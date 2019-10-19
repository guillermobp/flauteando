// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// require("bulma-extensions")
// require("selectr")

document.addEventListener("turbolinks:load", async () => {

  for (const select of [...document.querySelectorAll('select')]) {
    const selector = `#${select.id}`;
    const options = {};

    if (select.dataset.taggable === 'true') options.taggable = true;
    if (select.dataset.tagPlaceholder) options.tagPlaceholder = select.dataset.tagPlaceholder;

    new Selectr(selector, options);
  }
});
