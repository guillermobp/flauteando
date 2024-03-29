import Instafeed from 'instafeed.js/dist/instafeed.js';

window.addEventListener('scroll', async (e) => {

  // Setup parallax effect
  document.querySelectorAll('section.hero img').forEach(image => {
    image.style.marginTop = `-${parseInt(window.scrollY)}px`;
  });

  const counter = document.querySelector('.counter');
  if (counter) {
    const counterComponents = document.querySelectorAll('.counter-component');
    const scrollEvent = e;
    const isCounterVisible = (window.innerHeight + window.scrollY) > (counter.offsetTop + (counter.clientHeight / 2));

    if (!counter.dataset.hasOwnProperty('doNotAnimate') && isCounterVisible) {
      counter.querySelector('.counter-title').classList.add('visible');
      counter.querySelectorAll('.counter-component').forEach(c => c.classList.add('visible'));
      counter.dataset.doNotAnimate = '';
    }
  }

  document.querySelectorAll('section.profiles .image-crop').forEach((imageCrop, i) => {
    const isImageCropVisible = (window.innerHeight + window.scrollY) > (imageCrop.offsetTop + (imageCrop.clientHeight / 4));
    if (!imageCrop.dataset.hasOwnProperty('doNotAnimate') && isImageCropVisible) {
      imageCrop.style.transitionDelay = `${(i + 1) * 75}ms`;
      imageCrop.classList.add('visible');
      imageCrop.dataset.doNotAnimate = '';
    }
  });
});

const initSlider = async () => {

  const slider = document.querySelector('.hero .slider');

  if (slider == null) {
    return;
  }

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

  setInterval(showNextImage, 5000);
};

const initCountdown = async () => {

  if (!document.querySelector('.counter')) {
    return;
  }

  const daysContainerOne = document.getElementById('counter-days-container-one');
  const daysContainerTen = document.getElementById('counter-days-container-ten');
  const daysContainerHundred = document.getElementById('counter-days-container-hundred');
  const hoursContainerOne = document.getElementById('counter-hours-container-one');
  const hoursContainerTen = document.getElementById('counter-hours-container-ten');
  const minutesContainerOne = document.getElementById('counter-minutes-container-one');
  const minutesContainerTen = document.getElementById('counter-minutes-container-ten');
  const secondsContainerOne = document.getElementById('counter-seconds-container-one');
  const secondsContainerTen = document.getElementById('counter-seconds-container-ten');

  const updateCounter = async (e) => {
    // Get today's date and time
    var now = new Date().getTime();

    // Find the distance between now and the count down date
    var distance = eventTime - now;

    // Time calculations for days, hours, minutes and seconds
    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((distance % (1000 * 60)) / 1000);

    const daysComps = days.toString().split('');
    const hoursComps = hours.toString().split('');
    const minutesComps = minutes.toString().split('');
    const secondsComps = seconds.toString().split('');

    daysContainerHundred.innerText = daysComps[2] ? daysComps[0] : '0';
    daysContainerTen.innerText = daysComps[2] ? daysComps[1] : (daysComps[1] ? daysComps[1] : '0');
    daysContainerOne.innerText = daysComps[2] || daysComps[1] || daysComps[0] || '0';

    hoursContainerTen.innerText = hoursComps[1] ? hoursComps[0] : '0';
    hoursContainerOne.innerText = hoursComps[1] ? hoursComps[1] : (hoursComps[0] || '0');

    minutesContainerTen.innerText = minutesComps[1] ? minutesComps[0] : '0';
    minutesContainerOne.innerText = minutesComps[1] || '0';

    secondsContainerTen.innerText = secondsComps[1] ? secondsComps[0] : '0';
    secondsContainerOne.innerText = secondsComps[1] || secondsComps[0] || '0';
  };

  setInterval(updateCounter, 1000);
};

const initInstafeed = async () => {

  if (!document.querySelector('#instagram')) {
    return;
  }

  let instafeedTranslation = 0;

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
};

const initToggles = async () => {
  document.querySelectorAll('[data-toggle="visible"][data-target]').forEach(toggle => {
    toggle.addEventListener('click', async (e) => {
      toggle.parentElement.querySelector('.active').classList.remove('active');
      toggle.classList.add('active');
      document.querySelector(`${toggle.dataset.targetsContainer}.active`).classList.remove('active');
      document.querySelector(toggle.dataset.target).classList.add('active');
    });
  });
};

const initProfiles = async () => {
  if (!document.querySelector('#artistas')) {
    return;
  }

  document.querySelectorAll('.image-crop').forEach((item, i) => {
    item.addEventListener('click', async (e) => {
      const overlay = document.querySelector('.overlay');
      overlay.querySelector('.main').innerHTML = item.querySelector('.bio-content').innerHTML;
      overlay.classList.add('active');
      overlay.closest('body').style.overflow = 'hidden';
    });
  });
};

const initActivities = async () => {
  document.querySelectorAll('#calendar .calendar-day .actividad.has-details').forEach((item, i) => {
    item.addEventListener('click', async (e) => {
      const overlay = document.querySelector('.overlay');
      overlay.querySelector('.main').innerHTML = item.querySelector('.details').innerHTML;
      overlay.classList.add('active');
      overlay.closest('body').style.overflow = 'hidden';
    });
  });
};

const hideOverlay = async (e) => {
  const overlay = document.querySelector('.overlay');
  overlay.classList.remove('active');
  overlay.closest('body').style.overflow = 'initial';
};

window.addEventListener('DOMContentLoaded', async () => {
  initSlider();
  initCountdown();
  initInstafeed();
  initToggles();
  initProfiles();
  initActivities();

  document
    .querySelector('.overlay .close-control')
    .addEventListener('click', hideOverlay);
});
