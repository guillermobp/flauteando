window.addEventListener('scroll', async (e) => {

  // Setup parallax effect
  document.querySelectorAll('section.hero img').forEach(image => {
    image.style.marginTop = `-${parseInt(window.scrollY)}px`;
  });
});
