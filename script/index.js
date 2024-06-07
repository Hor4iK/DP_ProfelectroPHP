//@ DOM-elements
const menu = document.querySelector(".top-menu");
const menuTriggers = Array.from(document.querySelectorAll(".menu"));
const popupSubscribe = document.querySelector('.popup__subscribe');
const panelAuthorization = document.querySelector('.panel-auto__background');
const subscribeButton = document.querySelector('.footer-button-subscribe');


//BLOCK MODAL


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


//BLOCK API


// Checking the response from the server
const checkResponse = res => {
  if (res.ok) {
    return res.json();
  }
  return Promise.reject(`Ошибка: ${res.status}`);
}

const callFunctionAllocator = (functionName, args = null) => {
  return fetch('/action/function_allocator.php', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      funcName: functionName,
      arguments: args ?? null
    })
  }).then(res => checkResponse(res))
    .then(data => { console.log(data) })
    .catch((err) => { console.log(`Warning expected: error sending data...`); })
}

const sendCookie = (card) => {
  const idCard = card.dataset.id;
  document.cookie = `idCard=${idCard}`;
  return idCard;
}


//INDEX


//Open popup for watching a product card
function cardPreviewHandler(card, cardConfig, priceList) {
  card.addEventListener('click', (evt) => {
    evt.preventDefault();
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
          cardConfig.dataset.id = idCard;
          return;
        }
      });
      openModal(popupCardPreview);
    }
  })
}

//Toggle classlist of Menu
const getClassShowHide = (evt) => {
  menu.classList.toggle('type__visible');
}
menuTriggers.forEach((item) => {
  item.addEventListener("click", getClassShowHide);
});

//Set eventListeners adding to button of a product card
const handlerCallAddGood = (evt) => {
  const card = evt.target.closest('.card');
  const args = {
    idCard: sendCookie(card),
  }
  callFunctionAllocator('addGoodCartFromBtn', args.idCard)
}
function setHandlersButtonsSubmit() {
  const buttonsSubmit = document.querySelectorAll('.content__catalog__card-button');
  buttonsSubmit.forEach(btn => {
    btn.addEventListener('click', handlerCallAddGood)
  })
}

//Set eventListeners adding to button of a product card
const handlerCallAddGoodFromPopup = (evt) => {
  const popup = evt.target.closest('.popup_card-preview');
  const inputValue = popup.querySelector('.popup__input_type_count').value;
  const args = {
    idCard: sendCookie(popup),
    countGood: inputValue,
  }
  callFunctionAllocator('addGoodCartFromPopup', args)
}
function setHandlersButtonsPopupSubmit() {
  const buttonsSubmit = popupCardPreview.querySelector('.popup__button');
  buttonsSubmit.addEventListener('click', handlerCallAddGoodFromPopup);
}

//Set eventListeners deleting to close__button of a product card
const handlerCallDeleteGood = (evt) => {
  const card = evt.target.closest('.card');
  const inputValue = card.querySelector('.cart__item-input').value;
  const args = {
    idCard: sendCookie(card),
    countGood: inputValue,
  }
  callFunctionAllocator('deleteGoodFromCart', args)
    .then(card.remove());
}
function setHandlersCloseButtons() {
  const closeButtons = document.querySelectorAll('.cart__close');
  closeButtons.forEach(btn => {
    btn.addEventListener('click', handlerCallDeleteGood)
  })
}

//Set eventListeners to subscribe
subscribeButton.addEventListener('click', (evt) => {
  evt.preventDefault();
  openModal(popupSubscribe);
  console.log('foo?');
});
