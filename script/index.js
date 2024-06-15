//@ DOM-elements
const menu = document.querySelector(".popup__menu");
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

//The function of sending to the distributor
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
}

//The function of sending cookies
const sendCookie = (card) => {
  const idCard = card.dataset.id;
  document.cookie = `idCard=${idCard}`;
  return idCard;
}


//INDEX


//Open popup for watching a product card
function cardPreviewHandler(card, popupConfig, priceList) {
  card.addEventListener('click', (evt) => {
    evt.preventDefault();
    if (!evt.target.classList.contains('content__catalog__card-button')) {
      const idCard = card.dataset.id;
      priceList.forEach(item => {
        if (item.good_id == idCard) {
          popupConfig.title.textContent = item.good_name;
          if (item.good_image != null) popupConfig.image.src = item.good_image;
          else popupConfig.image.src = '../img/default-product-image.png';
          popupConfig.image.alt = item.good_name;
          popupConfig.provider.textContent = item.good_provider;
          popupConfig.description.textContent = item.good_overview;
          popupConfig.price.textContent = item.good_price;
          popupConfig.unit.textContent = item.good_unit;
          popupConfig.dataset.id = idCard;
          return;
        }
      });
      openModal(popupCardPreview);
    }
  })
}

//Toggle classlist of Menu
menuTriggers.forEach((item) => {
  item.addEventListener("click", () => {
    openModal(menu)
  });
});

//Set eventListeners adding to button of a product card
const handlerCallAddGoodCartFromBtn = (evt) => {
  const card = evt.target.closest('.card');
  const args = {
    idCard: sendCookie(card),
  }
  callFunctionAllocator('addGoodCartFromBtn', args)
}
function setHandlersButtonsSubmit() {
  const buttonsSubmit = document.querySelectorAll('.content__catalog__card-button');
  buttonsSubmit.forEach(btn => {
    btn.addEventListener('click', handlerCallAddGoodCartFromBtn)
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
  const cardOrder = document.querySelector('.card-order');
  const sumElemenet = cardOrder.querySelector('.card-order__summ-value');
  const buttonOrder = cardOrder.querySelector('.card-order__button')
  const card = evt.target.closest('.card');
  const inputValue = card.querySelector('.cart__item-input').value;
  const args = {
    idCard: sendCookie(card),
    countGood: inputValue,
  }
  let sum = 0;
  Promise.all([callFunctionAllocator('deleteGoodFromCart', args)])
    .then(() => {
      callFunctionAllocator('getCart')
        .then(data => {
          const dataArray = Array.from(data.response);
          dataArray.forEach(item => {
            sum += Number(item.good_summ);
          });
          sumElemenet.textContent = sum;
          if (sum == 0) buttonOrder.remove();
        })
    })
    .then(card.remove())
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
});

//Set eventListeners to open modal of add card
const setHandlerAddCardButtonOpenModal = (modal) => {
  const buttonAdd = document.querySelector('.data__actions__btn_add');
  buttonAdd.addEventListener('click', () => {
    openModal(modal);
  })
}

// Finding invalid inputs
const hasInvalidInput = (inputList) => {
  return inputList.some(inputElement => {
    return !inputElement.validity.valid;
  })
}

//Set eventListeners send data of adding card
const setHandlerAddCardButton = (modal) => {
  const form = modal.querySelector('.popup__content');
  const inputList = Array.from(form.querySelectorAll('.popup__input'));
  const buttonAdd = modal.querySelector('.popup__button');
  inputList.forEach(item => {
    item.addEventListener('input', () => {
      if (hasInvalidInput(inputList)) {
        // buttonAdd.disabled = true;
        buttonAdd.classList.add('popup__button_is-invalid');
      }
      else {
        // buttonAdd.disabled = false;
        buttonAdd.classList.remove('popup__button_is-invalid');
      }
    })
  })
  buttonAdd.addEventListener('click', (evt) => {
    if (!hasInvalidInput(inputList)) {
      new Promise(generateMessage(messageTitle.success, messageText.successAdd, 'success'));
    }
    else {
      evt.preventDefault();
    }
  })
}

//Set eventListeners deleting to close__button of a product card
const handlerCallDeleteGoodDB = (evt) => {
  const cardsList = document.querySelector('.data__list');
  const cardArray = Array.from(cardsList.querySelectorAll('.card'));
  const checkedItemList = cardArray.filter(item => item.querySelector('.data__list-item-check').checked);
  const idList = Array.from(checkedItemList, item => item.dataset.id);
  const args = {
    cardsId: idList,
  }
  callFunctionAllocator('deleteGood', args)
    .then(checkedItemList.forEach(item => item.remove()))
    .then(generateMessage(messageTitle.success, messageText.successRemove, 'success'));
}
function setHandlerDeleteButton() {
  const deleteButton = document.querySelector('.data__actions__btn_delete');
  deleteButton.addEventListener('click', handlerCallDeleteGoodDB)
}

//Set eventListeners to button of sending order
const setEventConfirmed = (evt) => {
  if (evt.target.classList.contains('popup')) window.location.replace('/index.php');
}
const handlerSendOrder = () => {
  const popupConfirmation = document.querySelector('.popup__confirmation');
  // const buttonOk = popupConfirmation.querySelector('.popup__button');
  const buttonOrder = document.querySelector('.card-order__button');
  const form = document.forms.dataUser;
  const inputList = Array.from(form.querySelectorAll('.panel-auto__field'));
  inputList.forEach(item => {
    item.addEventListener('input', () => {
      if (hasInvalidInput(inputList)) {
        // buttonOrder.disabled = true;
        buttonOrder.classList.add('popup__button_is-invalid');
      }
      else {
        // buttonOrder.disabled = false;
        buttonOrder.classList.remove('popup__button_is-invalid');
      }
    })
  })
  buttonOrder.addEventListener('click', () => {
    callFunctionAllocator('setPaidGood')
      .then([openModal(popupConfirmation),]);
  })
}

//Set eventListeners to input of changing cart
const setHandlersListenersInput = () => {
  const sumElemenet = document.querySelector('.card-order__summ-value');
  const cardsList = Array.from(document.querySelectorAll('.card'));
  cardsList.forEach(item => {
    const cardSum = item.querySelector('.cart__item-value');
    const cardId = item.dataset.id;
    const input = item.querySelector('.cart__item-input');

    input.addEventListener('input', () => {
      const inputValue = input.value;
      let sum = 0;
      const args = {
        cardId: cardId,
        count: inputValue
      }
      Promise.all([callFunctionAllocator('changeGoodCart', args)])
        .then(() => {
          callFunctionAllocator('getCart')
            .then(data => {
              const dataArray = Array.from(data.response);
              dataArray.forEach(item => {
                if (item.good_id == cardId) cardSum.textContent = item.good_summ;
                sum += Number(item.good_summ);
              });
              sumElemenet.textContent = sum;
            })
        })
    })
  })
}

const renderLoading = (loader, isLoading) => {
  isLoading ? loader.classList.add('loader_active') : loader.classList.remove('loader_active');
}

const replaceToCart = () => {
  setTimeout(() => { window.location.replace('./cart.php') }, 500);
}

const createCard = (template, cardData, popupConfig, allPriceList) => {
  const cardElement = template.querySelector('.card').cloneNode(true);
  const image = cardElement.querySelector('.card-image');
  const name = cardElement.querySelector('.card-title');
  const provider = cardElement.querySelector('.card-provider');
  const price = cardElement.querySelector('.card-value');
  const unit = cardElement.querySelector('.card-unit');

  cardElement.dataset.id = cardData.good_id;
  cardData.good_image ? image.src = cardData.good_image : image.src = '../img/default-product-image.png';
  image.alt = cardData.good_name;
  name.textContent = cardData.good_name;
  provider.textContent = cardData.good_provider;
  price.textContent = cardData.good_price + ' ₽';
  unit.textContent = cardData.good_unit;
  cardPreviewHandler(cardElement, popupConfig, allPriceList);

  return cardElement;
}

function setHandlerInputSearch(searchConfig, loader, template) {
  searchConfig.input.addEventListener('input', () => {
    const args = {
      search: searchConfig.input.value,
    }
    searchConfig.containerSearch.querySelectorAll('.card').forEach(item => { item.remove(); });
    if (searchConfig.input.value != "" && searchConfig.input.value != null && searchConfig.input.value != ' ') {
      if (!searchConfig.input.validity.patternMismatch) {
        renderLoading(loader, true);
        callFunctionAllocator('getGoodsBySearch', args)
          .then(data => {
            const res = Array.from(data.response);
            if (res[0]) {
              if (res.length > 1) searchConfig.titlePage.textContent = `Найдено: ${res.length} товаров`;
              else if (res.length = 1) searchConfig.titlePage.textContent = `Найден: ${res.length} товар`;
              searchConfig.container.classList.add('content__catalog-container_type_hide');
              res.forEach(item => { searchConfig.containerSearch.append(createCard(template, item, searchConfig.popupConfig, searchConfig.allPriceList)) });
            }
            else {
              searchConfig.titlePage.textContent = `Результаты не найдены`;
              searchConfig.container.classList.add('content__catalog-container_type_hide');
            }
          })
          .finally(renderLoading(loader, false))
      }
      else {
        searchConfig.titlePage.textContent = `Результаты не найдены`;
        searchConfig.container.classList.add('content__catalog-container_type_hide');
      }
    }
    else {
      searchConfig.titlePage.textContent = 'Категории';
      searchConfig.container.classList.remove('content__catalog-container_type_hide');
    }
  })
}


//NOTIFICATIONS


const messageTitle = {
  success: 'Успешно',
  error: 'Ошибка',
}

const messageText = {
  successAdd: 'Товар успешно добавлен!',
  successRemove: 'Товар удалён из базы.',
  errorAdd: 'Ошибка добавления товара в базу.',
  errorRemove: 'Ошибка удаления товара из базы.',
}

const notification = document.querySelector('.notification');

function dismissMessage() {
  notification.classList.remove('received');
}

function showMessage() {
  notification.classList.add('received');
  const button = document.querySelector('.notification__message button');
  button.addEventListener('click', dismissMessage, { once: true });
}

function generateMessage(messageTitle, messageText, messageClass) {
  const delay = Math.floor(Math.random() * 600);
  const timeoutID = setTimeout(() => {
    const message = document.querySelector('.notification__message');

    message.querySelector('h1').textContent = messageTitle;
    message.querySelector('p').textContent = messageText;
    message.className = `notification__message message--${messageClass}`;

    showMessage();
    clearTimeout(timeoutID);
  }, delay);
}

