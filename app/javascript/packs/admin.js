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

// require("bulma-calendar")

import BulmaCalendar from 'bulma-calendar/dist/js/bulma-calendar.js';

const calendarOpts = {
  dateFormat: 'YYYY-MM-DD',
  cancelLabel: 'Cancelar',
  clearLabel: 'Limpiar',
  todayLabel: 'Hoy',
  nowLabel: 'Ahora',
  validateLabel: 'Aceptar',
};

document.addEventListener("turbolinks:load", async () => {

  // const calendars = BulmaCalendar.attach('[type="time"]', {
  //   type: 'time',
  // });

  for (const select of [...document.querySelectorAll('select')]) {
    const data = select.dataset;
    const selector = `#${select.id}`;
    const options = {};

    if (data.taggable === 'true') options.taggable = true;
    if (data.tagPlaceholder) options.tagPlaceholder = data.tagPlaceholder;

    if (data.source) {
      const g = await fetch(data.source);
      const json = await g.json();

      options.data = json.map(x => {
        return {
          text: x[0],
          value: x[1],
          selected: x[2],
        };
      });
    }

    new Selectr(selector, options);
  }

  for (const upDown of [...document.querySelectorAll('table > tbody > tr > td > div.order-controls > i')]) {
    upDown.addEventListener('click', async (e) => {
      console.log({
        e
      });
      const command = e.target.dataset.command;
      const currentRow = e.target.closest('tr');
      const tableBody = currentRow.closest('tbody');
      if (command === 'up') {
        const previousRow = currentRow.previousElementSibling;
        tableBody.insertBefore(currentRow, previousRow);
      } else {
        const nextRow = currentRow.nextElementSibling;
        tableBody.insertBefore(nextRow, currentRow);
      }
    });
  }

  for (const input of [...document.querySelectorAll('input[type=file]')]) {
    input.addEventListener('change', async (e) => {
      for (const f of e.target.files) {
        const reader = new FileReader();
        const control = e.target.closest('.control');

        reader.onload = function() {
          const imagePreview = document.createElement('div');
          const image = document.createElement('img');
          const previewsContainer = control.querySelector('.previews') || false;
          const previewContainer = control.querySelector('.preview') || false;

          imagePreview.classList.add('image-preview');
          image.src = reader.result;
          imagePreview.appendChild(image);

          if (previewsContainer) {
            previewsContainer.appendChild(imagePreview);
          }

          if (previewContainer) {
            previewContainer.innerHTML = null;
            previewContainer.appendChild(imagePreview);
          }
        }

        await reader.readAsDataURL(f);
      }
    });
  }

  BulmaCalendar.attach('[type="datetime-local"]', calendarOpts);

  // document
  //   .getElementById('dates-events')
  //   .querySelectorAll('input')
  //   .forEach(input => {
  //     input.addEventListener('change', async (e) => {
  //       const {
  //         target
  //       } = e;
  //       document
  //         .querySelectorAll('table.actividades tr')
  //         .forEach(row => {
  //           if (row.dataset.date === target.value) {
  //             row.style.visibility = target.checked ? 'visible' : 'collapse';
  //           }
  //         });
  //     });
  //   });

  const tagsEvents = document.getElementById('tags-events');
  if (tagsEvents) {
    tagsEvents.querySelectorAll('input')
      .forEach(input => {
        input.addEventListener('change', async (e) => {
          const checkedValues = [...document.querySelectorAll('#tags-events input:checked')].map(x => x.value);
          document
            .querySelectorAll('table.actividades tr')
            .forEach(row => {
              if (row.dataset.tags) {
                row.style.visibility = row.dataset.tags.split(',').some(x => checkedValues.includes(x)) ?
                  'visible' :
                  'collapse';
              }
            });
        });
      });
  }

  const participantesEvents = document.getElementById('participantes-events');
  if (participantesEvents) {
    participantesEvents.querySelectorAll('input')
      .forEach(input => {
        input.addEventListener('change', async (e) => {
          const checkedValues = [...document.querySelectorAll('#participantes-events input:checked')].map(x => x.value);
          document
            .querySelectorAll('table.participantes tr[data-events]')
            .forEach(row => {
              if (row.dataset.events) {
                row.style.visibility = row.dataset.events.split(',').some(x => checkedValues.includes(x)) ?
                  'visible' :
                  'collapse';
              }
            });
        });
      });
  }
});
