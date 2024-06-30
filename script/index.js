//@ DOM-elements
const menu = document.querySelector(".popup__menu");
const menuTriggers = Array.from(document.querySelectorAll(".menu"));
const popupSubscribe = document.querySelector('.popup__subscribe');
const panelAuthorization = document.querySelector('.panel-auto__background');
const subscribeButton = document.querySelector('.footer-button-subscribe');

const renderLoading = (loader, isLoading) => {
  isLoading ? loader.classList.add('loader_active') : loader.classList.remove('loader_active');
}

const replaceToCart = () => {
  setTimeout(() => { window.location.replace('/content/cart.php') }, 300);
}


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

//Set eventListeners to open modal of add card
const setHandlerAddBannerButtonOpenModal = (modal) => {
  const buttonAdd = document.querySelector('.data__actions__btn_add_banner');
  buttonAdd.addEventListener('click', () => {
    openModal(modal);
  })
}

//Set eventListeners to open modal of add card
const setHandlerAddOffersButtonOpenModal = (modal) => {
  const buttonAdd = document.querySelector('.data__actions__btn_add_offers');
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
      // evt.preventDefault();
    }
  })
}

const selectCardsForDelete = (evt) => {
  const cardsList = evt.target.closest('.box');
  const cardArray = Array.from(cardsList.querySelectorAll('.card'));
  const checkedItemList = cardArray.filter(item => item.querySelector('.data__list-item-check').checked);

  return checkedItemList;
}

//Set eventListeners deleting of banners
const handlerCallDeleteBanners = (evt) => {
  const checkedItemList = selectCardsForDelete(evt);
  const idList = Array.from(checkedItemList, item => item.dataset.id);
  const args = {
    cardsId: idList,
  }
  callFunctionAllocator('deleteBanner', args)
    .then(checkedItemList.forEach(item => item.remove()))
    .then(generateMessage(messageTitle.success, messageText.successRemoveBanners, 'success'));
}
function setHandlerDeleteBannersButton() {
  const deleteButton = document.querySelector('.data__actions__btn_delete_banners');
  deleteButton.addEventListener('click', handlerCallDeleteBanners);
}

const createCardBanner = (template, cardData) => {
  const cardElement = template.content.querySelector('.card').cloneNode(true);
  const image = cardElement.querySelector('.card-image');
  const content = cardElement.querySelector('.card-title');
  const link = cardElement.querySelector('.card-link');
  const input = cardElement.querySelector('.card-value');

  cardElement.dataset.id = cardData.banner_id;
  cardData.banner_image ? image.src = cardData.banner_image : image.src = '../img/default-product-image.png';
  image.alt = cardData.banner_content;
  content.textContent = cardData.banner_content;
  link.textContent = cardData.banner_link;
  if (cardData.banner_turn != 0) input.checked = true;

  return cardElement;
}

//Set eventListeners send data of adding card banner
const setHandlerAddBannerButton = (modal, template, container) => {
  const form = modal.querySelector('.popup__content');
  const inputList = Array.from(form.querySelectorAll('.popup__input'));
  const buttonAdd = modal.querySelector('.popup__button');
  const inputImage = form.querySelector('.popup__input_type_card-image');
  const inputLink = form.querySelector('.popup__input_type_card-overview');
  const inputContent = form.querySelector('.popup__input_type_card-name');
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
      const args = {
        image: inputImage.value,
        link: inputLink.value,
        content: inputContent.value,
      }
      callFunctionAllocator('addBanner', args)
        .then(res => { generateMessage(messageTitle.success, messageText.successAddBanner, 'success') })
        .then(closeModal(modal))
        .then(() => {
          callFunctionAllocator('getBanners')
            .then(data => {
              const res = Array.from(data.response);
              container.querySelectorAll('.card').forEach(item => { item.remove(); });
              res.forEach(item => { container.append(createCardBanner(template, item)) })
            })
        })
        .catch(err => { generateMessage(messageTitle.error, messageText.errorAdd, 'danger') });
    }
    else {
      // evt.preventDefault();
    }
  })
}

//Set eventListeners deleting of offers
const handlerCallDeleteOffers = (evt) => {
  const checkedItemList = selectCardsForDelete(evt);
  const idList = Array.from(checkedItemList, item => item.dataset.id);
  const goodIdList = Array.from(checkedItemList, item => item.dataset.goodId);
  const args = {
    cardsId: idList,
    goodId: goodIdList,
  }
  callFunctionAllocator('deleteOffers', args)
    .then(checkedItemList.forEach(item => item.remove()))
    .then(generateMessage(messageTitle.success, messageText.successChangesOffers, 'success'));
}
function setHandlerDeleteOffersButton() {
  const deleteButton = document.querySelector('.data__actions__btn_delete_offers');
  deleteButton.addEventListener('click', handlerCallDeleteOffers);
}

//Set eventListeners send data of adding cards offer
const setHandlerAddOffersButton = (modal, container, template) => {
  const form = modal.querySelector('.popup__content');
  const cardsList = Array.from(form.querySelectorAll('.card'));
  const buttonAdd = modal.querySelector('.popup__button');
  buttonAdd.addEventListener('click', (evt) => {
    const checkedList = cardsList.map(item => { if (item.querySelector('.popup__input').checked) return item }).filter(item => item != undefined);
    if (checkedList.length != 0) {
      const idList = Array.from(checkedList, item => item.dataset.id);
      const args = {
        cardsId: idList,
      }
      callFunctionAllocator('addOffers', args)
        .then(data => {
          const res = Array.from(data.response);
          container.querySelectorAll('.card').forEach(item => { item.remove(); });
          res.forEach(item => { container.append(createAdminPanelCard(template, item)) })
          generateMessage(messageTitle.success, messageText.successChangesOffers, 'success');
        })
        .then(closeModal(modal))
        .catch(err => { generateMessage(messageTitle.error, messageText.errorAdd, 'danger') });
    }
    else {
      generateMessage(messageTitle.error, messageText.selectGoodOffer, 'warning')
      // evt.preventDefault();
    }
  })
}

const createObjCard = (container) => {
  const cardsList = Array.from(container.querySelectorAll('.card'));
  const objData = {}
  cardsList.forEach(item => {
    const id = item.dataset.id;
    const input = item.querySelector('.input-card');
    if (input.checked) objData[id] = 1;
    else objData[id] = 0;
  })
  return objData;
}

const createObjIdCard = (container) => {
  const cardsList = Array.from(container.querySelectorAll('.card'));
  const listData = []
  cardsList.forEach(item => { listData.push(item.dataset.id) })
  return listData;
}

const createValueObjCard = (container) => {
  const cardsList = Array.from(container.querySelectorAll('.card'));
  const objData = {}
  cardsList.forEach(item => {
    const id = item.dataset.id;
    const nameInput = item.querySelector('.data__list-item_banner-name');
    const srcInput = item.querySelector('.data__list-item_banner-src');
    const imageInput = item.querySelector('.data__list-item_banner-image');
    objData[id] = {
      name: nameInput.value,
      src: srcInput.value,
      image: imageInput.value,
    };
  })
  return objData;
}

//Set eventListeners send data of adding cards offer
const setHandlerSaveContentButton = (form, contentConfig) => {
  let args = {
    obj: {},
    idList: [],
  }
  const buttonSave = form.querySelector('.button_save');
  buttonSave.addEventListener('click', (evt) => {
    Object.assign(args.obj, createObjCard(contentConfig.banners));
    Object.assign(args.idList, createObjIdCard(contentConfig.banners));
    Promise.all([callFunctionAllocator('updateBanners', args)])
      .then(() => {
        args = {
          obj: {},
          idList: [],
        }
        Object.assign(args.obj, createObjCard(contentConfig.offers));
        Object.assign(args.idList, createObjIdCard(contentConfig.offers));
        callFunctionAllocator('updateOffers', args)
      })
      .then(() => {
        args = {
          obj: {},
          idList: [],
        }
        Object.assign(args.obj, createValueObjCard(contentConfig.minibanners));
        Object.assign(args.idList, createObjIdCard(contentConfig.minibanners));
        callFunctionAllocator('updateMiniBanners', args)
      })
      .then(res => { generateMessage(messageTitle.success, messageText.saveChanges, 'success') })
      .catch(err => { generateMessage(messageTitle.error, messageText.errorAdd, 'danger') });
  })
}


//Set eventListeners deleting to close__button of a product card
const handlerCallDeleteGoodDB = (evt) => {
  const checkedItemList = selectCardsForDelete(evt);
  const idList = Array.from(checkedItemList, item => item.dataset.id);
  const args = {
    cardsId: idList,
  }
  callFunctionAllocator('deleteGood', args)
    .then(checkedItemList.forEach(item => item.remove()))
    .then(generateMessage(messageTitle.success, messageText.successRemoveGoods, 'success'));
}
function setHandlerDeleteGoodsButton() {
  const deleteButton = document.querySelector('.data__actions__btn_delete_goods');
  deleteButton.addEventListener('click', handlerCallDeleteGoodDB);
}


//Set eventListeners to button of sending order
const setEventConfirmed = (evt) => {
  if (evt.target.classList.contains('popup')) window.location.replace('/index.php');
}
const handlerSendOrder = () => {
  const popupConfirmation = document.querySelector('.popup__confirmation');
  const buttonOk = popupConfirmation.querySelector('.popup__button');
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
  buttonOrder.addEventListener('click', () => { openModal(popupConfirmation) });
  buttonOk.addEventListener('click', () => {
    callFunctionAllocator('setPaidGood');
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

const createCard = (template, cardData, popupConfig, allPriceList) => {
  const cardElement = template.querySelector('.card').cloneNode(true);
  const image = cardElement.querySelector('.card-image');
  const name = cardElement.querySelector('.card-title');
  const provider = cardElement.querySelector('.card-provider');
  const price = cardElement.querySelector('.card-value');
  const unit = cardElement.querySelector('.card-unit');
  const button = cardElement.querySelector('.content__catalog__card-button');

  cardElement.dataset.id = cardData.good_id;
  cardData.good_image ? image.src = cardData.good_image : image.src = '../img/default-product-image.png';
  image.alt = cardData.good_name;
  name.textContent = cardData.good_name;
  provider.textContent = cardData.good_provider;
  price.textContent = cardData.good_price + ' ₽';
  unit.textContent = cardData.good_unit;
  cardPreviewHandler(cardElement, popupConfig, allPriceList);
  button.addEventListener('click', handlerCallAddGoodCartFromBtn);

  return cardElement;
}

const createAdminPanelCard = (template, cardData) => {
  const cardElement = template.querySelector('.card').cloneNode(true);
  const image = cardElement.querySelector('.card-image');
  const name = cardElement.querySelector('.card-title');
  const price = cardElement.querySelector('.card-value');
  const unit = cardElement.querySelector('.card-unit');
  const article = cardElement.querySelector('.card-article');

  cardElement.dataset.id = cardData.good_id;
  cardData.good_image ? image.src = cardData.good_image : image.src = '../img/default-product-image.png';
  image.alt = cardData.good_name;
  name.textContent = cardData.good_name;
  price.textContent = cardData.good_price + ' ';
  unit.textContent = cardData.good_unit;
  article.textContent = cardData.good_unit;

  return cardElement;
}

function setHandlerInputSearch(searchConfig, loader) {
  searchConfig.input.addEventListener('input', () => {
    const args = {
      search: searchConfig.input.value,
      category: 0,
    }
    searchConfig.containerSearch.querySelectorAll('.card').forEach(item => { item.remove(); });
    if (searchConfig.input.value != "" && searchConfig.input.value != null && searchConfig.input.value != ' ') {
      if (!searchConfig.input.validity.patternMismatch) {
        renderLoading(loader, true);
        callFunctionAllocator(searchConfig.method, args)
          .then(data => {
            const res = Array.from(data.response);
            if (res[0]) {
              if (res.length > 1) searchConfig.titlePage.textContent = `Найдено: ${res.length} товаров`;
              else if (res.length = 1) searchConfig.titlePage.textContent = `Найден: ${res.length} товар`;
              else if (res.length > 1 && res.length < 5) searchConfig.titlePage.textContent = `Найдено: ${res.length} товара`;
              if (searchConfig.admin) {
                res.forEach(item => { searchConfig.containerSearch.append(createAdminPanelCard(searchConfig.templateCard, item)) });
              } else {
                searchConfig.container.classList.add('content__catalog-container_type_hide');
                res.forEach(item => { searchConfig.containerSearch.append(createCard(searchConfig.templateCard, item, searchConfig.popupConfig, searchConfig.allPriceList)) });
              }
            }
            else {
              searchConfig.titlePage.textContent = `Результаты не найдены`;
              searchConfig.container.classList.add('content__catalog-container_type_hide');
            }
          })
          .finally(renderLoading(loader, false));
      }
      else {
        searchConfig.titlePage.textContent = `Результаты не найдены`;
        searchConfig.container.classList.add('content__catalog-container_type_hide');
      }
    }
    else {
      if (searchConfig.admin) {
        searchConfig.titlePage.textContent = 'Каталог товаров';
        renderLoading(loader, true);
        callFunctionAllocator(searchConfig.defaultMethod, args)
          .then(data => {
            const res = Array.from(data.response);
            res.forEach(item => { searchConfig.containerSearch.append(createAdminPanelCard(searchConfig.templateCard, item)) });
          })
          .finally(renderLoading(loader, false));
      }
      else {
        searchConfig.titlePage.textContent = 'Категории';
        searchConfig.container.classList.remove('content__catalog-container_type_hide');
      }
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
  successRemoveGoods: 'Товар удалён из базы.',
  successAddBanner: 'Баннер добавлен.',
  successRemoveBanners: 'Баннер удалён из базы.',
  successChangesOffers: 'Лучшие предложения изменены.',
  selectGoodOffer: 'Выберите товар для добавления.',
  saveChanges: 'Сохранения изменены.',
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
  const delay = Math.floor(Math.random() * 400);
  const timeoutID = setTimeout(() => {
    const message = document.querySelector('.notification__message');

    message.querySelector('h1').textContent = messageTitle;
    message.querySelector('p').textContent = messageText;
    message.className = `notification__message message--${messageClass}`;

    showMessage();
    clearTimeout(timeoutID);
  }, delay);
}

const setHandlerSaveButton = () => {

}
