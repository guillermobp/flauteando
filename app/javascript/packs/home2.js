import Instafeed from 'instafeed.js/dist/instafeed.js';

window.addEventListener('scroll', async (e) => {

  // Setup parallax effect
  document.querySelectorAll('section.hero img').forEach(image => {
    image.style.marginTop = `-${parseInt(window.scrollY)}px`;
  });

  const counter = document.querySelector('.counter');
  const counterComponents = document.querySelectorAll('.counter-component');
  const scrollEvent = e;
  const isCounterVisible = (window.innerHeight + window.scrollY) > (counter.offsetTop + (counter.clientHeight / 2));

  if (!counter.dataset.hasOwnProperty('doNotAnimate') && isCounterVisible) {
    counter.querySelector('.counter-title').classList.add('visible');
    counter.querySelectorAll('.counter-component').forEach(c => c.classList.add('visible'));
    counter.dataset.doNotAnimate = '';
  }

  document.querySelectorAll('section.profiles .image-crop').forEach((imageCrop, i) => {
    const isImageCropVisible = (window.innerHeight + window.scrollY) > (imageCrop.offsetTop + (imageCrop.clientHeight / 2));
    if (!imageCrop.dataset.hasOwnProperty('doNotAnimate') && isImageCropVisible) {
      imageCrop.style.transitionDelay = `${(i + 1) * 125}ms`;
      imageCrop.classList.add('visible');
      imageCrop.dataset.doNotAnimate = '';
    }
  });
});

window.addEventListener('DOMContentLoaded', async () => {
  let instafeedTranslation = 0;
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

  const showNextImage = async () => {
    const active = slider.querySelector('.active');
    const next = active.nextElementSibling || slider.querySelector('.slider-item');
    active.classList.remove('active');
    next.classList.add('active');
  };

  setInterval(showNextImage, 2000);

  const getToken = async () => {
    const g = await fetch('https://flauteandoenelrio-igtoken.herokuapp.com/token.json');
    const json = await g.json();
    return json.token;
  };

  new Instafeed({
    accessToken: await getToken(),
    limit: 9,
    template: '<a href="{{link}}"><img title="{{caption}}" src="{{image}}" /></a>',
  }).run();

  document.getElementById('instafeed-slider-control-right').addEventListener('click', async (e) => {
    const track = document.getElementById('instafeed');
    const trackChildCount = track.childElementCount;
    const trackWidth = track.clientWidth;
    const imgWidth = track.querySelector('img').clientWidth;
    const clientWidth = document.querySelector('body').clientWidth;
    const endTrackContentWidth = trackWidth - clientWidth - instafeedTranslation;

    if ((instafeedTranslation + clientWidth) < trackWidth) {
      if (endTrackContentWidth > (trackWidth / trackChildCount)) {
        instafeedTranslation += 300;
      } else {
        instafeedTranslation += endTrackContentWidth;
      }
      track.style.transform = `translate(-${instafeedTranslation}px)`;
    }
  });

  document.getElementById('instafeed-slider-control-left').addEventListener('click', async (e) => {
    const track = document.getElementById('instafeed');
    const trackChildCount = track.childElementCount;
    const trackWidth = track.clientWidth;
    const imgWidth = track.querySelector('img').clientWidth;
    const clientWidth = document.querySelector('body').clientWidth;
    const beginTrackContentWidth = trackWidth - clientWidth - instafeedTranslation;
    if (instafeedTranslation >= 300) {
      instafeedTranslation -= 300;
    } else {
      instafeedTranslation = 0;
    }
    track.style.transform = `translate(-${instafeedTranslation}px)`;
  });
});
