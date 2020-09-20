window.addEventListener('scroll', async (e) => {

  // Setup parallax effect
  document.querySelectorAll('section.hero img').forEach(image => {
    image.style.marginTop = `-${parseInt(window.scrollY)}px`;
  });
});

window.addEventListener('')
const slider = document.querySelector('.hero .slider');
const sliderStep = 100;

let sliderScroll = 0;

setInterval(async () => {

  console.log({slider, sliderScroll});

  sliderScroll -= sliderStep;
  slider.style.transform = `translate(${sliderScroll}%)`;

}, 2000);
