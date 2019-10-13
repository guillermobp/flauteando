// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener("turbolinks:load", async () => {

  const info = document.getElementById('info');
  const infoBio = document.getElementById('info-bio');
  const infoOverlay = document.getElementById('info-overlay');

  for (const link of [...document.querySelectorAll('a[data-command=show]')]) {
    link.addEventListener('click', async (e) => {
      e.preventDefault();

      const g = await fetch(e.target.href);
      const data = await g.text();

      infoBio.querySelector('h1.title').textContent = e.target.dataset.title;
      infoBio.querySelector('div.content').innerHTML = data;

      infoOverlay.querySelector('img').src = info.querySelector('img').src;
      infoOverlay.classList.replace('hidden', 'shown');
    });
  }

  for (const img of [...document.querySelectorAll('.main img')]) {
    img.addEventListener('click', async (e) => {

      const nombre = await fetch(e.target.dataset.urlNombre);
      const bio = await fetch(e.target.dataset.urlBio);

      infoBio.querySelector('h1').textContent = await nombre.text();
      infoBio.querySelector('div').innerHTML = await bio.text();

      infoOverlay.querySelector('img').src = e.target.src;
      infoOverlay.classList.replace('hidden', 'shown');
    });
  }

  document.getElementById('close').addEventListener('click', e => {
    infoOverlay.classList.replace('shown', 'hidden');
  });

});
