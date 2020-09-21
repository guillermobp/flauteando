window.addEventListener('scroll', async (e) => {

  // Setup parallax effect
  document.querySelectorAll('section.hero img').forEach(image => {
    image.style.marginTop = `-${parseInt(window.scrollY)}px`;
  });
  const counter = document.querySelector('.counter');
  const counterComponents = document.querySelectorAll('.counter-component');
  const scrollEvent = e;
  const isCounterVisible = ((window.scrollMaxY + window.scrollY + 100) > counter.offsetTop);
  // const wasCounterComponentsAnimated = counter.dataset.hasOwnProperty('wasAnimated');
  // console.log({counter});
  // console.log(`${window.scrollMaxY + window.scrollY + 100} / ${counter.offsetTop}`, 'scroll');
  if (!counter.dataset.hasOwnProperty('wasAnimated') && isCounterVisible) {

    counter.querySelector('.counter-title').classList.add('visible');

    counter.querySelectorAll('.counter-component')
      .forEach(c => c.classList.add('visible'));

    counter.dataset.wasAnimated = '';
  }
});

window.addEventListener('DOMContentLoaded', async () => {

  const slider = document.querySelector('.hero .slider');

  const items = [...slider.querySelectorAll('.slider-item')];
  const sliderStep = 100;

  const firstImage = items[0].querySelector('img');
  const srcs = items.map(i => i.querySelector('img').src);

  let sliderScroll = 0;
  let i = 0;

  const showNextImage_ = async () => {

    i++;

    if (i >= srcs.length) {
      i = 0;
    }

    firstImage.src = srcs[i];
  };

  slider.querySelectorAll('.slider-item').forEach(item => {
    item.addEventListener('activated', async (e) => {
      console.log(e, 'activated!');
    });
  });

  const showNextImage = async () => {
    const active = slider.querySelector('.active');
    const next = active.nextElementSibling || slider.querySelector('.slider-item');
    active.classList.remove('active');
    next.classList.add('active');
    // next.dispatchEvent(new Event('activated'));
  };

  setInterval(showNextImage, 2000);

  // setInterval(async () => {
  //
  //   sliderScroll = sliderScroll < 0 ? -sliderScroll : sliderScroll;
  //
  //   sliderScroll = sliderScroll <= (sliderStep * items.length - 1)
  //     ? sliderScroll - sliderStep
  //     : 0;
  //
  //   slider.style.transform = `translate(${sliderScroll}%)`;
  //
  // }, 2000);

  // const canvas = document.getElementById('canvas');
  // const ctx = canvas.getContext('2d');
  //
  // ctx.fillStyle = 'green';
  // ctx.fillRect(10, 10, 150, 100);
});
