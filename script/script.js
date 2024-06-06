//@ DOM-elements
const menu = document.querySelector(".top-menu");
const menuTriggers = Array.from(document.querySelectorAll(".menu"));
const panelAuthorization = document.querySelector('.panel-auto__background');


//Function Close Modal Window
function closeModal() {
  const modal = document.querySelector('.popup_is-opened');
  const btnModalClose = modal.querySelector('.popup__close');

  if (modal) modal.classList.remove('popup_is-opened');

  document.removeEventListener('keydown', closeModalWithEsc);
  btnModalClose.removeEventListener('click', closeModal);
  modal.removeEventListener('mousedown', closeModalOverlay);
}

//Close Modal Window with button "Esc"
function closeModalWithEsc(evt) {
  if (evt.code === 'Escape') closeModal();
}

//Close Modal Window with Overlay
function closeModalOverlay(evt) {
  if (evt.target.classList.contains('popup')) closeModal();
}

//Function Open Modal Window
function openModal(modal) {
  const btnModalClose = modal.querySelector('.popup__close');

  modal.classList.add('popup_is-animated');
  setTimeout(() => { modal.classList.add('popup_is-opened') }, 0);

  btnModalClose.addEventListener('click', closeModal);
  document.addEventListener('keydown', closeModalWithEsc);
  modal.addEventListener('mousedown', closeModalOverlay);
}

function cardPreviewHandler(card, cardConfig, priceList) {
  card.addEventListener('click', (evt) => {
    if (!evt.target.classList.contains('content__catalog__card-button')) {
      const idCard = card.dataset.id;

      priceList.forEach(item => {
        if (item.good_id == idCard) {
          cardConfig.title.textContent = item.good_name;
          cardConfig.image.src = item.good_image;
          cardConfig.image.alt = item.good_name;
          cardConfig.provider.textContent = item.good_provider;
          cardConfig.description.textContent = item.good_overview;
          cardConfig.price.textContent = item.good_price;
          cardConfig.unit.textContent = item.good_unit;
          return;
        }
      });
      openModal(popupCardPreview);
    }
  })
}

const getClassShowHide = (evt) => {
  menu.classList.toggle('type__visible');
}

menuTriggers.forEach((item) => {
  item.addEventListener("click", getClassShowHide);
});

function setHandlersButtonsSubmit() {
  const buttonsSubmit = document.querySelectorAll('.content__catalog__card-button');
  buttonsSubmit.forEach(btn => {
    btn.addEventListener('click', (evt) => {
      const card = evt.target.closest('.card');
      const idCard = card.dataset.id;
      document.cookie = `idCard=${idCard}`;
    })
  })
}
