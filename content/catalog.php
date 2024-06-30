<?php require_once __DIR__ . '/../helpers.php';
?>


<!doctype html>
<html lang="ru">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Каталог</title>
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
        <button class="panel-auto__btn panel-auto__btn-light" type="button" onclick="window.location.replace('/content/register.php')" id="btn_register">
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
    <div class="popup popup__menu popup_is-animated">
      <button type="button" class="popup__close visually_hidden"></button>
      <ul class="sidebar-menu__list sidebar-menu__block-list top-menu">
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
          <a onclick="<?php if (empty($_SESSION['user'])) {
                        echo ' closeModal(); openModal(panelAuthorization);';
                      } else {
                        echo 'window.location.replace(`./cart.php`)';
                      } ?>" class="sidebar-menu__content header__list-item-link list-item-link__accent">
            Корзина
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
                              echo "closeModal(); openModal(panelAuthorization);";
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
          <a href="./howbuy.php" class="header__list-item-link">Как купить</a>
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

    <? $value = $_GET['Value'];
    $products = getGoods($value);
    if ($value == 0) {
      $categories = getCategory(); ?>

      <div class="content__catalog content__section">
        <div class="searchBox">
          <input class="searchInput" pattern="[a-zA-Zа-яА-ЯёЁ\- ]+" type="text" name="search" placeholder="Поиск по сайту">
          <button class="searchButton" href="#">
            <i class="material-icons">
            </i>
          </button>
        </div>
        <h1 class="offers__title">Категории</h1>
        <div class="loader-container">
          <div class="loader"></div>
        </div>
        <ul class="content__catalog-popular" id="container-search"></ul>
        <div class="content__catalog-container">
          <ul class="content__catalog-content">

            <? foreach ($categories as $category) : ?>
              <li class="offers-card-item box">
                <a href="./catalog.php?Value=<?= $category['category_id'] ?>" class="content__catalog-content-link">
                  <img src="<?= $category['category_image'] ?>" class="content__catalog-content__image">
                  <h6 class="content__catalog-content__title">
                    <?= $category['category_name'] ?>
                  </h6>
                </a>
              </li>
            <? endforeach;
          } else { ?>

            <div class="content__catalog content__section">

              <? foreach ($products as $product) : ?>
                <button class='content__catalog-button' type='button' onclick="window.location.replace('./catalog.php?Value=0')">Каталог</button>
                <h1 class="offers__title"><?= $product['category_name'] ?></h1>
              <? break;
              endforeach; ?>

              <? if (array_key_exists('Podcategory', $_GET)) {
                $podcategories = getPodcategory($_GET['Podcategory']);
              } else {
                $podcategories = getPodcategories($value);
              } ?>

              <ul class="content__catalog-content">

                <? foreach ($podcategories as $podcategory) : ?>
                  <li class="offers-card-item box">
                    <a href="./catalog.php?Value=<?= $product['category_id'] ?>&Podcategory=<?= $podcategory['podcategory_id'] ?>" class="content__catalog-content-link">
                      <img src="<?= $podcategory['podcategory_image'] ?>" class="content__catalog-content__image">
                      <h6 class="content__catalog-content__title">
                        <?= $podcategory['podcategory_name'] ?>
                      </h6>
                    </a>
                  </li>
              <? endforeach;
              } ?>

              <? if (array_key_exists('Podcategory', $_GET)) $products = getGoodsPodcategory($_GET['Value'], $_GET['Podcategory']) ?>

              </ul>

              <h2 class="offers__title content__catalog-popular-title">
                <? if (array_key_exists('Podcategory', $_GET)) {
                  $podcategory = getPodcategory($_GET['Podcategory']); ?>
                <? echo ($podcategory[0]['podcategory_name']);
                } elseif (array_key_exists('Value', $_GET) && $_GET['Value'] != 0) {
                  echo ('Популярные товары раздела');
                } else {
                  echo ('Популярные товары');
                } ?>
              </h2>

              <ul class="content__catalog-popular">

                <? foreach ($products as $product) : ?>
                  <li class="content__catalog-popular__card card" data-id="<?= $product['good_id'] ?>">
                    <a href="#" class="content__catalog__card-link">
                      <img src="<? if ($product['good_image']) echo ($product['good_image']);
                                else echo ("../img/default-product-image.png") ?>" loading="lazy" class="content__catalog__card-image  card-image" />
                      <div class="content__catalog__card__conteiner">
                        <h6 class="content__catalog__card-title card-title">
                          <?= $product['good_name'] ?>
                        </h6>
                        <span class="content__catalog__card-provider card-provider"><?= $product['good_provider'] ?></span>
                        <div class="content__catalog__card__price-cover">
                          <span class="content__catalog__card-value card-value"><?= $product['good_price'] ?> ₽</span>
                          <span class="content__catalog__card-unit card-unit"><?= $product['good_unit'] ?></span>
                        </div>
                      </div>
                      <button onclick="<?php if (empty($_SESSION['user'])) {
                                          echo "openModal(panelAuthorization);";
                                        } else {
                                          echo "replaceToCart()";
                                        } ?>" class="content__catalog__card-button">Купить</button>
                    </a>
                  </li>
                <? endforeach; ?>

              </ul>
            </div>
        </div>
  </main>
  <footer class="footer">
    <div class="footer__content">
      <div class="footer__content__list">
        <ul class="footer__list footer__only-title">
          <a href="/content/catalog.php?Value=0" class="footer__content-link footer__title">каталог</a>
          <a href="/action/load_to_pdf.php" class="footer__content-link footer__title">прайс-лист</a>
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
  <div class="popup popup_card-preview popup_is-animated" id="popup">
    <div class="popup__content">
      <button type="button" class="popup__close"></button>
      <h4 class="popup__title">Name Good</h4>
      <h4 class="popup__provider">Name Provider</h4>
      <img src="/img/exgoods.png" alt="" class="popup__image">
      <div class="popup__container">
        <p class="popup__description">Lorem, ipsum dolor sit amet consectetur adipisicing elit.
          Tempore cumque eos voluptatibus non quos ducimus quia dignissimos at fuga dolore neque dolor modi.
        </p>
        <form name="card-preview" method="POST" class="popup__form">
          <div class="popup__price">
            <h5 class="popup__value">1234.5 $/м</h5>
            <span class="popup__currency">₽</span>
            <span class="popup__unit">\шт</span>
          </div>
          <div class="popup__container_form">
            <input type="number" name="count-good" value="1" min="1" minlength="1" id="popup__input_type_count" class="popup__input popup__input_type_count">
            <button class="button popup__button" onclick="<?php if (empty($_SESSION['user'])) {
                                                            echo "closeModal(); openModal(panelAuthorization);";
                                                          } else {
                                                            echo "replaceToCart()";
                                                          } ?>" type="button">В корзину</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <div class="popup popup__subscribe popup_is-animated" id="popup">
    <form name="license" method="post" action="/action/subscribe.php" class="popup__content">
      <button type="button" class="popup__close"></button>
      <h4 class="popup__title">Подписка на рассылку</h4>
      <fieldset class="popup__container">
        <input type="email" placeholder="example@mail.ru" name="license" id="popup__input_type_mail" class="popup__input popup__input_type_mail" required>
        <input type="checkbox" id="popup__licenses" class="popup__input popup__input_type_licenses visually-hidden" required>
        <label for="popup__licenses">Я согласен на <a class="popup__licenses-link" href="/public/license.pdf">обработку персональных данных</a></label>
      </fieldset>
      <button class="button popup__button panel-auto__btn-light" type="submit">Подписаться</button>
    </form>
  </div>
  <template id="search-request">
    <ul class="content__catalog-popular">
      <li class="content__catalog-popular__card card">
        <a class="content__catalog__card-link">
          <img loading="lazy" class="content__catalog__card-image  card-image" />
          <div class="content__catalog__card__conteiner">
            <h6 class="content__catalog__card-title card-title"></h6>
            <span class="content__catalog__card-provider card-provider"></span>
            <div class="content__catalog__card__price-cover">
              <span class="content__catalog__card-value card-value"></span>
              <span class="content__catalog__card-unit card-unit"></span>
            </div>
          </div>
          <button onclick="<?php if (empty($_SESSION['user'])) {
                              echo "openModal(panelAuthorization);";
                            } else {
                              echo "replaceToCart()";
                            } ?>" class="content__catalog__card-button">Купить</button>
        </a>
      </li>
    </ul>
  </template>
  <script src="../script/index.js"></script>
  <script>
    <?
    $arrayGoodsPHP = getGoods(0);
    $goodsJSON = json_encode($arrayGoodsPHP);
    ?>
    const popupCardPreview = document.querySelector('.popup_card-preview');
    const allPriceList = <?= $goodsJSON ?>;

    const titlePage = document.querySelector('.offers__title');
    const container = document.querySelector('.content__catalog-container');
    const containerSearch = document.querySelector('#container-search');
    const template = document.querySelector('#search-request').content;
    const searchInput = document.querySelector('.searchInput');
    const loader = document.querySelector('.loader-container');

    const cardImage = popupCardPreview.querySelector('.popup__image');
    const cardTitle = popupCardPreview.querySelector('.popup__title');
    const cardProvider = popupCardPreview.querySelector('.popup__provider');
    const cardDescription = popupCardPreview.querySelector('.popup__description');
    const cardValue = popupCardPreview.querySelector('.popup__value');
    const cardUnit = popupCardPreview.querySelector('.popup__unit');

    const popupConfig = {
      dataset: popupCardPreview.dataset,
      image: cardImage,
      title: cardTitle,
      provider: cardProvider,
      description: cardDescription,
      price: cardValue,
      unit: cardUnit,
    }
    const searchConfig = {
      titlePage: titlePage,
      container: container,
      containerSearch: containerSearch,
      input: searchInput,
      popupConfig: popupConfig,
      allPriceList: allPriceList,
      method: 'getGoodsBySearch',
      admin: false,
    }

    async function setEventHandlersCards() {
      const cardsList = Array.from(document.querySelectorAll('.card'));
      cardsList.forEach((card) => {
        cardPreviewHandler(card, popupConfig, allPriceList);
      });
    }
    setEventHandlersCards();
    setHandlersButtonsSubmit();
    setHandlersButtonsPopupSubmit();
    setHandlerInputSearch(searchConfig, loader);
  </script>
</body>

</html>
<?php clearValidation() ?>
