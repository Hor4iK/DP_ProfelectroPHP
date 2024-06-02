<?php require_once __DIR__ . '/../helpers.php'; ?>


<!doctype html>
<html lang="ru">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Оформление заказа в ПрофЭлектро</title>
  <link rel="shortcut icon" href="../img/logo.ico" type="image/x-icon" sizes="any" />
  <link rel="icon" href="../img/logo.svg" type="image/svg+xml" />
  <link rel="stylesheet" href="../fonts/fonts.css" />
  <link rel="stylesheet" href="../styles/global.css" />
  <link rel="stylesheet" href="../styles/style.css" />
  <link rel="stylesheet" href="../styles/content.css" />
  <link rel="stylesheet" media="(width <= 1215px)" href="../mobile/tablet.css" />
  <link rel="stylesheet" media="(width <= 600px)" href="/mobile/mobile.css" />
</head>

<body class="page">
  <div id="panel-auto" class="popup panel-auto__background popup_is-animated ">
    <form class="panel-auto" action="/action/login.php" method="post">
      <button class="panel-auto-exit popup__close" id="panel-auto_exit" type="button"></button>
      <h1 class="panel-auto__title">Личный кабинет</h1>
      <?php if (hasMessage(key: 'error')) : ?>
        <h2 class="panel-auto-error"><?php echo getMessage(key: 'error') ?></h2>
      <?php endif; ?>
      <div class="panel-auto__login">
        <label for="login">Логин</label>
        <span class="incorrect-symbol type__hide<?php if (!empty($_SESSION['validation']['login'])) echo ' type__visible' ?>" id="incorrect-symbol-log">*</span>
        <input class="panel-auto__field" type="email" name="login" id="login" required />
      </div>
      <div class="panel-auto__password">
        <label for="password">Пароль</label>
        <span class="incorrect-symbol type__hide<?php if (!empty($_SESSION['validation']['password'])) echo ' type__visible' ?>" id="incorrect-symbol-log">*</span>
        <input class="panel-auto__field" type="password" name="password" id="password" required />
      </div>
      <div class="panel-auto__btns">
        <button class="panel-auto__btn panel-auto__btn-color" type="submit" id="btn_enter">войти</button>
        <button class="panel-auto__btn panel-auto__btn-light" type="button" onclick="window.location.replace('/action/register.php')" id="btn_register">
          регистрация
        </button>
      </div>
    </form>
  </div>
  <header class="header">
    <div class="header__menu-section menu">
      <a class="header__menu-section-link">
        <img src="../img/menu.png" alt="Изображение меню для раскрытия полного меню" class="header__menu-section-icon" />
      </a>
    </div>
    <div class="sidebar-menu__block-list top-menu">
      <ul class="sidebar-menu__list">
        <li class="sidebar-menu_list-item">
          <a href="./catalog.php?Value=1" class="sidebar-menu__content header__list-item-link">
            Электротовары
          </a>
        </li>
        <li class="sidebar-menu_list-item">
          <a href="./catalog.php?Value=2" class="sidebar-menu__content header__list-item-link">
            Водоотведение
          </a>
        </li>
        <li class="sidebar-menu_list-item">
          <a href="./catalog.php?Value=3" class="sidebar-menu__content header__list-item-link">
            Освещение
          </a>
        </li>
        <li class="sidebar-menu_list-item">
          <a href="./catalog.php?Value=4" class="sidebar-menu__content header__list-item-link">
            Инструменты
          </a>
        </li>
        <li class="sidebar-menu_list-item">
          <a href="./catalog.php?Value=5" class="sidebar-menu__content header__list-item-link">
            Экипировка, средства защиты
          </a>
        </li>
        <li class="sidebar-menu_list-item">
          <a href="./catalog.php?Value=6" class="sidebar-menu__content header__list-item-link">
            Электрический тёплый пол
          </a>
        </li>
        <li class="sidebar-menu_list-item">
          <a href="./catalog.php?Value=8" class="sidebar-menu__content header__list-item-link">
            Сантехника
          </a>
        </li>
        <li class="sidebar-menu_list-item">
          <a href="./catalog.php?Value=9" class="sidebar-menu__content header__list-item-link">
            Краски
          </a>
        </li>
        <li class="sidebar-menu_list-item ">
          <a href="./catalog.php?Value=10" class="sidebar-menu__content header__list-item-link">
            Газовое оборудование
          </a>
        </li>
        <li class="sidebar-menu_list-item list-item_option">
          <a href="./catalog.php?Value=0" class="sidebar-menu__content header__list-item-link list-item-link__accent">
            Каталог
          </a>
        </li>
        <li class="sidebar-menu_list-item list-item_option">
          <a href="./howbuy.php" class="sidebar-menu__content header__list-item-link list-item-link__accent">
            Как купить
          </a>
        </li>
        <li class="sidebar-menu_list-item list-item_option">
          <a href="./about.php" class="sidebar-menu__content header__list-item-link list-item-link__accent">
            О компании
          </a>
        </li>
        <li class="sidebar-menu_list-item list-item_option">
          <a href="./contacts.php" class="sidebar-menu__content header__list-item-link list-item-link__accent">
            Контакты
          </a>
        </li>
        <li class="sidebar-menu_list-item">
          <button onclick="<?php if (empty($_SESSION['user'])) {
                              echo "openModal(panelAuthorization);";
                            } else {
                              echo "window.location.replace('./account.php')";
                            } ?>" class="sidebar-menu__content sidebar-menu__account-btn">
            Аккаунт
          </button>
        </li>
      </ul>
    </div>
    <nav class="header__menu-list-block">
      <div class="header__menu-section__menu-logo">
        <div class="header__menu-section top-sidebar-menu visible__none menu" id="top-sidebar-menu">
          <a class="header__menu-section-link">
            <img src="../img/menu.png" alt="Изображение меню для раскрытия полного меню" class="header__menu-section-icon" />
          </a>
        </div>
        <a href="../index.php" class="header__logo-link">
          <img src="../img/Логотип-Профэлектро.png" alt="Логотип компании ПрофЭлектро с изображением капли и шестерёнки" class="header__logo-image" />
        </a>
      </div>
      <ul class="header__menu-list">
        <li class="header__list-item type__hiding">
          <a href="./catalog.php?Value=0" class="header__list-item-link">Каталог</a>
        </li>
        <li class="header__list-item type__hiding">
          <a class="header__list-item-link">Как купить</a>
        </li>
        <li class="header__list-item type__hiding">
          <a href="./about.php" class="header__list-item-link">О компании</a>
        </li>
        <li class="header__list-item type__hiding">
          <a href="./contacts.php" class="header__list-item-link">Контакты</a>
        </li>
        <li class="header__list-item">
          <button onclick="<?php if (empty($_SESSION['user'])) {
                              echo "openModal(panelAuthorization);";
                            } else {
                              echo "window.location.replace('../content/account.php')";
                            } ?>" class="header__user-link">
          </button>
        </li>
      </ul>
    </nav>
  </header>
  <main class="content">
    <div class="sidebar">
      <nav class="sidebar-menu menu">
        <div class="sidebar-menu__block-static">
          <img src="../img/four-point.png" class="sidebar-menu__text-img" />
          <h3 class="sidebar-menu__text-title">Каталог</h3>
        </div>
      </nav>
    </div>
    <div class="content__block">
      <ul class="content__block__list">
        <li class="content__block__list-item">
          <a class="content__block__list-link" href="#payment">Условия оплаты</a>
        </li>
        <li class="content__block__list-item t2">
          <a class="content__block__list-link" href="#delivery">Условия доставки</a>
        </li>
        <li class="content__block__list-item t3">
          <a class="content__block__list-link" href="#warranty">Гарантия на товар</a>
        </li>
      </ul>
      <div class="conteiner-text">
        <div class="conteiner-text__payment" id="payment">
          <h2>Как оформить заказ</h2>
          <p>
            Оформить заказ на нашем сайте легко. Просто добавьте выбранные
            товары в корзину, а затем перейдите на страницу Корзина, проверьте
            правильность заказанных позиций и нажмите кнопку «Оформить заказ»
            или «Быстрый заказ».
          </p>
          <h2>Быстрый заказ</h2>
          <p>
            Функция «Быстрый заказ» позволяет покупателю не проходить всю
            процедуру оформления заказа самостоятельно. Вы заполняете форму, и
            через короткое время вам перезвонит менеджер магазина. Он уточнит
            все условия заказа, ответит на вопросы, касающиеся качества
            товара, его особенностей. А также подскажет о вариантах оплаты и
            доставки.
          </p>
          <p>
            По результатам звонка, пользователь либо, получив уточнения,
            самостоятельно оформляет заказ, укомплектовав его необходимыми
            позициями, либо соглашается на оформление в том виде, в котором
            есть сейчас. Получает подтверждение на почту или на мобильный
            телефон и ждёт доставки.
          </p>
          <h2>Оформление заказа в стандартном режиме</h2>
          <p>
            Если вы уверены в выборе, то можете самостоятельно оформить заказ,
            заполнив по этапам всю форму.
          </p>
          <h2>Заполнение адреса</h2>
          <p>
            Выберите из списка название вашего региона и населённого пункта.
            Если вы не нашли свой населённый пункт в списке, выберите значение
            «Другое местоположение» и впишите название своего населённого
            пункта в графу «Город». Введите правильный индекс.
          </p>
          <h2>Доставка</h2>
          <p>
            В зависимости от места жительства вам предложат варианты доставки.
            Выберите любой удобный способ. Подробнее об условиях доставки
            читайте в разделе «Доставка».
          </p>
          <h2>Оплата</h2>
          <p>
            Выберите оптимальный способ оплаты. Подробнее о всех вариантах
            читайте в разделе «Оплата»
          </p>
          <h2>Покупатель</h2>
          <p>
            Введите данные о себе: ФИО, адрес доставки, номер телефона. В поле
            «Комментарии к заказу» введите сведения, которые могут пригодиться
            курьеру, например: подъезды в доме считаются справа налево.
          </p>
          <h2>Оформление заказа</h2>
          <p>
            Проверьте правильность ввода информации: позиции заказа, выбор
            местоположения, данные о покупателе. Нажмите кнопку «Оформить
            заказ».
          </p>
          <p>
            Наш сервис запоминает данные о пользователе, информацию о заказе и
            в следующий раз предложит вам повторить к вводу данные предыдущего
            заказа. Если условия вам не подходят, выбирайте другие варианты.
          </p>
        </div>
        <div class="conteiner-text__delivery" id="delivery">
          <h2>Курьерская доставка</h2>
          <p>
            Вы можете заказать доставку товара с помощью курьера, который
            прибудет по указанному адресу в будние дни и субботу с 9.00 до
            19.00. Курьерская служба, после поступления товара на склад,
            свяжется с вами и предложит выбрать удобное время доставки.
            Уточнит адрес.
          </p>
          <p>
            Вы вскрываете упаковку при курьере, осматриваете на целостность и
            соответствие указанной комплектации. Если речь идёт об одежде,
            допустима примерка. Время осмотра и примерки ограничено 15
            минутами. После вы можете отказаться частично или полностью от
            покупки.
          </p>
          <p>Доставка бесплатна при заказе от 3000 рублей.</p>
          <h2>Самовывоз из магазина</h2>
          <p>
            Вы можете забрать товар в одном из магазинов, сотрудничающих с
            нами. Список торговых точек, которые принимают заказы от нашей
            компании появится у вас в корзине. Когда заказ поступит в ваш
            город, вам придёт уведомление. Вы просто идёте в этот магазин,
            обращаетесь к сотруднику в кассовой зоне и называете номер заказа.
            Забрать покупку может ваш друг или родственник, который знает
            номер и имя, на кого он оформлен.
          </p>
          <h2>Почтовая доставка</h2>
          <p>
            Если в вашем городе не действует курьерская служба, то вы можете
            заказать доставку через почту России. Сразу по прибытии товара, на
            ваш адрес придет извещение о посылке.
          </p>
          <p>
            Перед оплатой вы можете оценить состояние коробки (не вскрывая):
            вес, целостность. Если вам кажется, что заказ не соответствует
            параметрам или коробка повреждена, попросите сотрудника почты
            составить акт о вскрытии. Вскрывать коробку самостоятельно вы
            можете только после того, как оплатили заказ.
          </p>
          <p>
            Один заказ может содержать не больше 10 позиций и его стоимость не
            должна превышать 100 тысяч рублей.
          </p>
        </div>
        <div class="conteiner-text__warranty" id="warranty">
          <h2>С какого момента начинается гарантия?</h2>
          <p>
            Гарантийный период – это срок, во время которого клиент, обнаружив
            недостаток товара имеет право потребовать от продавца или
            изготовителя принять меры по устранению дефекта. Продавец должен
            устранить недостатки, если не будет доказано, что они возникли
            вследствие нарушений покупателем правил эксплуатации.
          </p>
          <p>
            с момента передачи товара потребителю, если в договоре нет
            уточнения; если нет возможности установить день покупки, то
            гарантия идёт с момента изготовления; на сезонные товары гарантия
            идёт с момента начала сезона; при заказе товара из
            интернет-магазина гарантия начинается со дня доставки.
          </p>
          <p>Обслуживание по гарантии включает в себя:</p>
          <p>
            устранение недостатков товара в сертифицированных сервисных
            центрах; обмен на аналогичный товар без доплаты; обмен на похожий
            товар с доплатой; возврат товара и перечисление денежных средств
            на счёт покупателя.
          </p>
          <h2>Правила обмена и возврата товара</h2>
          <h2>Обмен и возврат продукции надлежащего качества</h2>
          <p>
            Продавец гарантирует, что покупатель в течение 7 дней с момента
            приобретения товара может отказаться от товара надлежащего
            качества, если:
          </p>
          <p>
            товар не поступал в эксплуатацию и имеет товарный вид, находится в
            упаковке со всеми ярлыками, а также есть документы на приобретение
            товара; товар не входит в перечень продуктов надлежащего качества,
            не подлежащих возврату и обмену.
          </p>
          <p>
            Покупатель имеет право обменять товар надлежащего качество на
            другое торговое предложение этого товара или другой товар,
            идентичный по стоимости или на иной товар с доплатой или возвратом
            разницы в цене.
          </p>
          <h2>Обмен и возврат продукции ненадлежащего качества</h2>
          <p>
            Если покупатель обнаружил недостатки товара после его
            приобретения, то он может потребовать замену у продавца. Замена
            должна быть произведена в течение 7 дней со дня предъявления
            требования. В случае, если будет назначена экспертиза на
            соответствие товара указанным нормам, то обмен должен быть
            произведён в течение 20 дней.
          </p>
          <p>
            Технически сложные товары ненадлежащего качества заменяются
            товарами той же марки или на аналогичный товар другой марки с
            перерасчётом стоимости. Возврат производится путем аннулирования
            договора купли-продажи и возврата суммы в размере стоимости
            товара.
          </p>
          <h2>Возврат денежных средств</h2>
          <p>
            Срок возврата денежных средств зависит от вида оплаты, который
            изначально выбрал покупатель.
          </p>
          <p>
            При наличном расчете возврат денежных средств осуществляется на
            кассе не позднее через через 10 дней после предъявления
            покупателем требования о возврате.
          </p>
          <p>
            Зачисление стоимости товара на карту клиента, если был использован
            безналичный расчёт, происходит сразу после получения требования от
            покупателя.
          </p>
          <p>
            При использовании электронных платёжных систем, возврат
            осуществляется на электронный счёт в течение 10 календарных дней.
          </p>
        </div>
      </div>
    </div>
  </main>
  <footer class="footer">
    <div class="footer__content">
      <div class="footer__content__list">
        <ul class="footer__list footer__only-title">
          <a href="#" class="footer__content-link footer__title">каталог</a>
          <a href="#" class="footer__content-link footer__title visible__none">бренды</a>
        </ul>
        <ul class="footer__list">
          <li class="footer__list-item">
            <a href="../content/about.php" class="footer__content-link footer__title">компания</a>
          </li>
          <li class="footer__list-item">
            <a href="../content/about.php" class="footer__content-link">О компании</a>
          </li>
          <li class="footer__list-item visible__none">
            <a href="#" class="footer__content-link">Отзывы</a>
          </li>
          <li class="footer__list-item">
            <a href="../content/contacts.php" class="footer__content-link">Контакты</a>
          </li>
        </ul>
        <ul class="footer__list">
          <li class="footer__list-item">
            <a href="#" class="footer__content-link footer__title">информация</a>
          </li>
          <li class="footer__list-item">
            <a href="../content/howbuy.php" class="footer__content-link">Условия оплаты</a>
          </li>
          <li class="footer__list-item">
            <a href="../content/howbuy.php" class="footer__content-link">Условия доставки</a>
          </li>
          <li class="footer__list-item">
            <a href="../content/politics.php" class="footer__content-link">Политика</a>
          </li>
          <li class="footer__list-item">
            <a href="#" class="footer__content-link">Реквизиты</a>
          </li>
        </ul>
        <ul class="footer__list">
          <li class="footer__list-item">
            <a href="../content/howbuy.php" class="footer__content-link footer__title">Помощь</a>
          </li>
          <li class="footer__list-item visible__none">
            <a href="../content/howbuy.php" class="footer__content-link">Вопрос-ответ</a>
          </li>
          <li class="footer__list-item">
            <a href="../content/howbuy.php" class="footer__content-link">Гарантия на товар</a>
          </li>
          <li class="footer__list-item">
            <a href="/img/oferta.pdf" class="footer__content-link">Публичная оферта</a>
          </li>
        </ul>
      </div>
      <ul class="footer__contact-list">
        <li class="footer__contact-list-item">
          <button class="footer-button-subscribe">
            Подписаться на рассылку
          </button>
        </li>
        <li class="footer__contact-list-item">
          <a class="footer__contact-link" href="tel:+79081935043">8(908)193-50-43</a>
        </li>
        <li class="footer__contact-list-item">
          <a class="footer__contact-link" href="mailto:kettlin_94@mail.ru">kettlin_94@mail.ru</a>
        </li>
        <li class="footer__contact-list-item">
          <div class="contact__block-address">
            <p>г. Ростов-на-Дону,</p>
            <p>ул. Еременко 99,</p>
            <p>Сиверса 28а</p>
          </div>
        </li>
        <li class="footer__contact-list-item">
          <div class="contact__block-address">
            <p>Село Новобатайск,</p>
            <p>ул. Ленина 61б</p>
          </div>
        </li>
        <li class="footer__contact-list-item">
          <div class="contact__block-address">
            <p>г. Батайск,</p>
            <p>ул. Куйбышева 108</p>
          </div>
        </li>
        <li class="footer__contact-list-item footer__contact-list-item__block-svg">
          <a href="https://vk.com/public216663226" class="contact__link-svg">
            <svg xmlns="http://www.w3.org/2000/svg" width="39" height="20" viewBox="0 0 39 20" fill="none">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M18.8654 19.9163H21.1663C21.1663 19.9163 21.8614 19.8468 22.2162 19.4984C22.5428 19.1786 22.5324 18.5779 22.5324 18.5779C22.5324 18.5779 22.4874 15.7661 23.9204 15.352C25.3329 14.9442 27.1468 18.0696 29.0694 19.2714C30.5232 20.1809 31.628 19.9815 31.628 19.9815L36.7686 19.9163C36.7686 19.9163 39.4579 19.7654 38.1827 17.8398C38.0782 17.6822 37.4402 16.4153 34.3606 13.8119C31.1373 11.0872 31.5689 11.5279 35.4517 6.81471C37.8164 3.94434 38.7618 2.19194 38.4665 1.44139C38.1848 0.726539 36.4457 0.915486 36.4457 0.915486L30.6575 0.948325C30.6575 0.948325 30.2285 0.89502 29.9102 1.06826C29.5993 1.23817 29.3991 1.63415 29.3991 1.63415C29.3991 1.63415 28.4831 3.85534 27.2612 5.74433C24.6839 9.73029 23.6533 9.94065 23.2321 9.69317C22.2523 9.11633 22.4968 7.37584 22.4968 6.13936C22.4968 2.27666 23.1401 0.666096 21.2442 0.249177C20.615 0.110679 20.152 0.0192998 18.543 0.00454579C16.4777 -0.0149676 14.7297 0.0102564 13.7399 0.451925C13.0814 0.745577 12.5735 1.39999 12.8829 1.43759C13.2654 1.48423 14.1318 1.65033 14.5912 2.22003C15.1843 2.95487 15.1634 4.60542 15.1634 4.60542C15.1634 4.60542 15.5041 9.1525 14.3675 9.71744C13.5873 10.1049 12.517 9.31385 10.2192 5.69769C9.04186 3.84535 8.15295 1.79787 8.15295 1.79787C8.15295 1.79787 7.98154 1.41522 7.67583 1.21057C7.30479 0.962603 6.78639 0.883599 6.78639 0.883599L1.28619 0.916437C1.28619 0.916437 0.460502 0.937379 0.157403 1.26435C-0.112251 1.55514 0.135977 2.15673 0.135977 2.15673C0.135977 2.15673 4.44207 11.3318 9.31779 15.9555C13.7885 20.1947 18.8654 19.9163 18.8654 19.9163Z" fill="white" />
            </svg>
          </a>
          <a href="http://instagram.com/shtory_textile_moda/" class="contact__link-svg">
            <svg xmlns="http://www.w3.org/2000/svg" width="27" height="24" viewBox="0 0 27 24" fill="none">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M13.9144 0C10.3599 0 9.91421 0.0138127 8.51824 0.0722122C7.12518 0.130468 6.17375 0.33334 5.34126 0.630005C4.48061 0.936625 3.75074 1.34695 3.02309 2.01406C2.29549 2.68122 1.84796 3.35044 1.51354 4.13954C1.18998 4.90283 0.968721 5.77515 0.905184 7.05241C0.841489 8.33234 0.826416 8.74099 0.826416 12C0.826416 15.259 0.841489 15.6677 0.905184 16.9476C0.968721 18.2248 1.18998 19.0972 1.51354 19.8605C1.84796 20.6496 2.29549 21.3188 3.02309 21.9859C3.75074 22.6531 4.48061 23.0634 5.34126 23.37C6.17375 23.6667 7.12518 23.8695 8.51824 23.9278C9.91421 23.9862 10.3599 24 13.9144 24C17.4688 24 17.9145 23.9862 19.3105 23.9278C20.7036 23.8695 21.655 23.6667 22.4875 23.37C23.3481 23.0634 24.078 22.6531 24.8056 21.9859C25.5332 21.3188 25.9808 20.6496 26.3152 19.8605C26.6387 19.0972 26.86 18.2248 26.9236 16.9476C26.9873 15.6677 27.0023 15.259 27.0023 12C27.0023 8.74099 26.9873 8.33234 26.9236 7.05241C26.86 5.77515 26.6387 4.90283 26.3152 4.13954C25.9808 3.35044 25.5332 2.68122 24.8056 2.01406C24.078 1.34695 23.3481 0.936625 22.4875 0.630005C21.655 0.33334 20.7036 0.130468 19.3105 0.0722122C17.9145 0.0138127 17.4688 0 13.9144 0ZM13.9144 2.16216C17.409 2.16216 17.823 2.1744 19.203 2.23213C20.4791 2.28548 21.1721 2.48097 21.6333 2.64531C22.2442 2.863 22.6802 3.12303 23.1381 3.54298C23.5961 3.96287 23.8797 4.36262 24.1172 4.92274C24.2964 5.34559 24.5096 5.98098 24.5678 7.15097C24.6308 8.41632 24.6441 8.79587 24.6441 12C24.6441 15.2041 24.6308 15.5837 24.5678 16.849C24.5096 18.019 24.2964 18.6544 24.1172 19.0773C23.8797 19.6374 23.5961 20.0371 23.1381 20.457C22.6802 20.877 22.2442 21.137 21.6333 21.3547C21.1721 21.519 20.4791 21.7145 19.203 21.7679C17.8232 21.8256 17.4093 21.8378 13.9144 21.8378C10.4195 21.8378 10.0056 21.8256 8.62571 21.7679C7.34965 21.7145 6.65665 21.519 6.19547 21.3547C5.58456 21.137 5.14856 20.877 4.6906 20.457C4.23264 20.0371 3.94898 19.6374 3.71156 19.0773C3.53232 18.6544 3.31911 18.019 3.26092 16.849C3.19795 15.5837 3.1846 15.2041 3.1846 12C3.1846 8.79587 3.19795 8.41632 3.26092 7.15097C3.31911 5.98098 3.53232 5.34559 3.71156 4.92274C3.94898 4.36262 4.23258 3.96287 4.6906 3.54298C5.14856 3.12303 5.58456 2.863 6.19547 2.64531C6.65665 2.48097 7.34965 2.28548 8.62571 2.23213C10.0058 2.1744 10.4197 2.16216 13.9144 2.16216ZM13.9144 5.83784C10.2025 5.83784 7.19354 8.59671 7.19354 12C7.19354 15.4033 10.2025 18.1622 13.9144 18.1622C17.6262 18.1622 20.6352 15.4033 20.6352 12C20.6352 8.59671 17.6262 5.83784 13.9144 5.83784ZM13.9144 16C11.5049 16 9.55172 14.2091 9.55172 12C9.55172 9.79085 11.5049 8 13.9144 8C16.3238 8 18.277 9.79085 18.277 12C18.277 14.2091 16.3238 16 13.9144 16ZM22.4713 5.59438C22.4713 6.38968 21.7681 7.03436 20.9007 7.03436C20.0334 7.03436 19.3302 6.38968 19.3302 5.59438C19.3302 4.79908 20.0334 4.15436 20.9007 4.15436C21.7681 4.15436 22.4713 4.79908 22.4713 5.59438Z" fill="white" />
            </svg>
          </a>
        </li>
      </ul>
    </div>
  </footer>
  <div class="footer footer__offer">
    <p>
      2023 © Профэлектро - интернет-магазин, Сайт несет информационный
      характер и не является публичной офертой
    </p>
  </div>
  <script src="../script/script.js"></script>
</body>

</html>
<?php clearValidation() ?>
