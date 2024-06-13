-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 192.168.0.19:3306
-- Время создания: Июн 14 2024 г., 00:15
-- Версия сервера: 5.7.39
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `4110`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `good_count` int(11) NOT NULL,
  `is_paid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `good_id`, `good_count`, `is_paid`) VALUES
(1, 4, 2, 10, 0),
(2, 4, 3, 12, 1),
(3, 2, 2, 10, 0),
(4, 4, 1, 8, 1),
(5, 3, 1, 2, 1),
(6, 3, 1, 2, 0),
(1491, 10, 1, 1, 1),
(1492, 10, 73, 1, 1),
(1493, 20, 116, 1, 1),
(1494, 20, 144, 1, 1),
(1495, 20, 179, 1, 0),
(1496, 19, 2, 10, 0),
(1497, 19, 1, 5, 0),
(1498, 21, 1, 1, 0),
(1499, 21, 3, 3, 0),
(1501, 22, 75, 1, 0),
(1502, 23, 131, 1, 1),
(1503, 23, 46, 1, 1),
(1504, 23, 57, 1, 1),
(1505, 23, 1, 150, 1),
(1506, 24, 18, 1, 1),
(1508, 25, 1, 3, 1),
(1509, 25, 2, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_image` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_image`) VALUES
(1, 'Электротовары', 'https://rndelectro.ru/upload/iblock/70c/70c6f9b731bf16cf8d00d8dde28982aa.jpg'),
(2, 'Водоотведение', 'https://rndelectro.ru/upload/iblock/79f/79f7d2708dbbd07c3f49275e5cdb7048.png'),
(3, 'Освещение', 'https://rndelectro.ru/upload/iblock/e8b/e8b4f6a42a36fe7dc97673a68550e77d.jpg'),
(4, 'Инструменты', '../img/d665893f4cc096894737a3feb930e277.png'),
(5, 'Экипировка, средства защиты', 'https://rndelectro.ru/upload/iblock/841/841a0d152803c029fefc125b1ca6b492.jpg'),
(6, 'Электрический тёплый пол', 'https://teplypol.by/img/p/1571-3695-large.jpg'),
(8, 'Сантехника', 'https://sgm.by/foto/polip/polip1.jpg'),
(9, 'Краски', 'https://rndelectro.ru/upload/iblock/274/eusq5p5rpj9fv13eptmcpglksnxnsuhz.png'),
(10, 'Газовое оборудование', 'https://vse-vse-vse-vse.ru/images/detailed/359/581ff8a003780b7-23f49535e91d1caf_vagr-tq.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `good_id` int(10) UNSIGNED NOT NULL,
  `good_name` varchar(255) DEFAULT NULL,
  `good_overview` text,
  `good_provider` varchar(255) DEFAULT NULL,
  `good_price` float DEFAULT NULL,
  `good_image` varchar(255) DEFAULT NULL,
  `good_unit` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `good_podcategory_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`good_id`, `good_name`, `good_overview`, `good_provider`, `good_price`, `good_image`, `good_unit`, `category_id`, `good_podcategory_id`) VALUES
(1, 'Угол канализационный 32х90 СИНИКОН', NULL, 'СИНИКОН', 40, 'https://rndelectro.ru/upload/resize_cache/iblock/44f/450_450_140cd750bba9870f18aada2478b24840a/ka9r7kfc2dp8qur5oabz5693ot70shvk.jpg', '/шт', 2, 5),
(2, 'Заглушка канализационная \'Россия\' (наружная) (110)', NULL, 'РТП', 64, 'https://rndelectro.ru/upload/resize_cache/iblock/771/450_450_140cd750bba9870f18aada2478b24840a/7nba7erz7746h2xagvg5dsxdfvoupnqw.jpg', '/шт', 2, 5),
(3, 'Труба канализационная 32х0,25м СИНИКОН', NULL, 'СИНИКОН', 63, 'https://rndelectro.ru/upload/resize_cache/iblock/667/450_450_140cd750bba9870f18aada2478b24840a/1bkvwqxsgs00o03e0uec6l6lndhodruo.jpg', '/шт', 2, 5),
(4, 'Заглушка канализационная 50', NULL, 'СИНИКОН', 25.5, 'https://rndelectro.ru/upload/resize_cache/iblock/e10/450_450_140cd750bba9870f18aada2478b24840a/e1049e0463b4eec3948738a3d9561b5c.jpg', '/шт', 2, 5),
(5, 'Переход канализационный 110х50 СИНИКОН \'КОМФОРТ\'', NULL, 'СИНИКОН', 139, 'https://rndelectro.ru/upload/resize_cache/iblock/fbd/450_450_140cd750bba9870f18aada2478b24840a/j0t3yqvq7h7eqfhdtq36ib03wfj9yfd2.jpg', '/шт', 2, 5),
(9, 'Гофра на унитаз Ани пласт', NULL, 'АНИ-ПЛАСТ', 278.5, 'https://rndelectro.ru/upload/resize_cache/iblock/4b8/450_450_140cd750bba9870f18aada2478b24840a/4b8ac62e9fe330f2ef3b893243b83283.jpg', '/шт', 2, 6),
(10, 'Арматура для бачка мет.кнопка (ЭНКОР) нижняя подводка', NULL, 'ЭНКОР', 545, 'https://rndelectro.ru/upload/resize_cache/iblock/f8b/450_450_140cd750bba9870f18aada2478b24840a/f8bf97a97232a536a7b138ffa097a2f2.jpg', '/шт', 2, 6),
(11, 'Манжета эксцентрическая для унитаза АНИ-ПЛАСТ', NULL, 'АНИ-ПЛАСТ', 259, 'https://rndelectro.ru/upload/resize_cache/iblock/bc9/450_450_140cd750bba9870f18aada2478b24840a/bc934a30345fa7725a66f5b623ee1411.jpg', '/шт', 2, 6),
(12, 'Арматура для бачка мет.кнопка (ЭНКОР) боковая подводка', NULL, 'ЭНКОР', 539, 'https://rndelectro.ru/upload/resize_cache/iblock/b24/450_450_140cd750bba9870f18aada2478b24840a/b24e26e4bcb08faf68aa31ada8c8c05d.jpeg', '/шт', 2, 6),
(13, 'Арматура для бачка мет.кнопка (ЭНКОР) нижняя подводка', NULL, 'ЭНКОР', 545, 'https://rndelectro.ru/upload/resize_cache/iblock/f8b/450_450_140cd750bba9870f18aada2478b24840a/f8bf97a97232a536a7b138ffa097a2f2.jpg', '/шт', 2, 6),
(14, 'Хомут пластиковый 40 канал', NULL, 'СИНИКОН', 21.5, 'https://rndelectro.ru/upload/resize_cache/iblock/2c9/450_450_140cd750bba9870f18aada2478b24840a/2yujjy2zatjnju3mx3w7r223xd8w3v2a.jpg', '/шт', 2, 7),
(15, 'Стяжки нейлоновые КСС 4*250 (ч) (100шт.) (Fortisflex)', NULL, 'Fortisflex', 160, 'https://rndelectro.ru/upload/resize_cache/iblock/87a/450_450_140cd750bba9870f18aada2478b24840a/fj1pqu56r4rpnsy6q6di6y1ug5b4zspp.jpg', '/шт', 2, 7),
(16, 'Стяжка стальная СКС (304) 4.6х500 (Fortisflex)', NULL, 'Fortisflex', 11.5, 'https://rndelectro.ru/upload/resize_cache/iblock/3ac/450_450_140cd750bba9870f18aada2478b24840a/td02ngr4wfdx9qsd854ckx4r0egvft6b.jpg', '/шт', 2, 7),
(17, 'Хомут пластиковый 110 канал', NULL, 'СИНИКОН', 46, 'https://rndelectro.ru/upload/resize_cache/iblock/2c9/450_450_140cd750bba9870f18aada2478b24840a/2yujjy2zatjnju3mx3w7r223xd8w3v2a.jpg', '/шт', 2, 7),
(18, 'Кабель витая пара UTP 4PR 24AWG CAT5e 305м Rexant', 'Кабель витая пара категории 5е серого цвета REXANT предназначен для создания локальныx сетей, компьютерныx сетей, подключения устройств оxранной системы, телефонии, интернета, камер видеонаблюдения и т.п.\r\nПрименяется для прокладки внутри помещений. Универсальность и широкое распространение позволяют подключить практически любое оборудование.\r\nКонструктивно кабель без экрана состоит из центрального проводника из высокоочищенной бескислородной меди в изоляции HDPE и оболочки из ПВХ.\r\nЗа счет усиления взаимодействия между каждой парой проводников, пользователю доступен высокий уровень эффективности передачи данныx. Гибкая форма обеспечивает удобное размещение кабеля в труднодоступныx местаx без образования заломов на местаx сгиба.', 'REXANT', 41.5, 'https://rndelectro.ru/upload/resize_cache/iblock/bb5/450_450_140cd750bba9870f18aada2478b24840a/heyyte87f9x6u4q6dkncwqkx1ux0u2zr.jpg', '/м', 1, 1),
(19, 'Кабель силовой медный ВВГп-нг(А)-LS 2х2,5 плоский 100 метров ГОСТ', 'Кабель ВВГ предназначен для передачи и распределения электрической энергии в\r\nстационарных установках с напряжением 1 кВ. Такой вид провода используется для\r\nпрокладки в помещениях разного назначения, в блоках и щитах.', 'АльфаКабель', 64, 'https://rndelectro.ru/upload/resize_cache/iblock/227/450_450_140cd750bba9870f18aada2478b24840a/8dku0kj6rosrhdk78xmsislvmdkqowys.jpg', '/м', 1, 1),
(20, 'Наконечник НШВИ 0,75- 8', 'Для монтажа одного провода.Предназначены для оконцевания методом опрессовки гибких многопроволочных медных проводников. Трансформируют концы многожильных проводов в монолитные штифты. Современная альтернатива обязательному облуживанию концов многожильных проводников при подсоединении к клеммам', 'КВТ', 0.5, 'https://rndelectro.ru/upload/resize_cache/iblock/0bb/450_450_140cd750bba9870f18aada2478b24840a/0bb8786be0f9415a180a6f5cb0112624.jpg', '/шт', 1, 1),
(21, 'Витая пара UTP Suprlan категория 5е 4х2х0,5 медь 305м', 'В ассортименте магазина Профэлектро представлены соединительные кабели для\r\nпроводки интернета.\r\nВиды кабелей:\r\n- SAT 703\r\n- UTP 5E\r\n- FTP 5E', 'SUPRLAN', 30, 'https://rndelectro.ru/upload/resize_cache/iblock/833/450_450_140cd750bba9870f18aada2478b24840a/8331fbafa9208ef835c25d71857f0a2d.jpg', '/м', 1, 1),
(22, 'Гильза ГМЛ 10 -5 луженая', 'Гильза медная луженая ГМЛ  предназначена для соединения опрессовкой проводов и кабелей с медными и алюминиевыми жилами, изготовлена из электротехнической меди с защитным покрытием олово-висмут .', 'КВТ', 30, 'https://rndelectro.ru/upload/resize_cache/iblock/a4a/450_450_140cd750bba9870f18aada2478b24840a/a4a23460d0569e933e92a8437ff14c5a.jpg', '/шт', 1, 1),
(23, 'Механизм розетки 1-м Schneider GLOSSA с заземл бел', NULL, 'Schneider Electric', 140, 'https://rndelectro.ru/upload/iblock/122/4p6jq02gf1jbjk5lqrffyp17u1es9au0.jpg', '/шт', 1, 2),
(24, 'Рамка 1-м Schneider GLOSSA бел', 'Рамка Glossa (цвет белый) одинарная.\r\n- Выполнена из материала PС+ASA, стойкого к УФ-излучению и появлению царапин.\r\n- Позволяет гармонично вписать электроустановочное изделие в интерьер помещения.', 'Schneider Electric', 42, 'https://rndelectro.ru/upload/iblock/3a3/njrpw57y2qbcrpoflgooea35akjprqrg.jpg', '/шт', 1, 2),
(25, 'Механизм розетки 1-м СП Atlas Design с заземл. 16А белый', NULL, 'Schneider Electric', 147, 'https://rndelectro.ru/upload/iblock/26a/22olat04t8ov149pils12plkbgb3cqln.jpg', '/шт', 1, 2),
(26, 'Рамка 2-м Atlas Design универс бежевый', NULL, 'Schneider Electric', 73, 'https://rndelectro.ru/upload/resize_cache/iblock/bed/450_450_140cd750bba9870f18aada2478b24840a/dnjzv0kqzp0zz7op3rk4eij78b2j4iaw.jpeg', '/шт', 1, 2),
(27, 'Механизм выключателя 1-кл Schneider GLOSSA беж', NULL, 'Schneider Electric', 129, 'https://rndelectro.ru/upload/iblock/a1a/wmyq7qgzpgaee01yhpegfp3y92nah6jq.jpg', '/шт', 1, 2),
(28, 'Патрон элект Е27 керамич. подвесной 4А 250B UNEVersal', 'Обеспечивает замыкание электрической цепи различными видами ламп освещения, по средствам электрического контакта токопроводящих частей патрона и лампы, и предназначен для совместной эксплуатации с лампами накаливания энергосберегающими, натриевыми и ртутными лампами, галогенными лампами.', 'UNIVersal', 19, 'https://rndelectro.ru/upload/resize_cache/iblock/358/450_450_140cd750bba9870f18aada2478b24840a/3587e2fd0f221176a7c5a57d56a49fb7.jpg', '/шт', 1, 3),
(29, 'Патрон электрич. E27 подвесной термопластик с клеммной колодкой 4А 250В Черный UNIVersal', NULL, 'UNIVersal', 61.5, 'https://rndelectro.ru/upload/iblock/ba5/usf6pw1khc3ypltwsf26mz0kgn5cfdpj.jpg', '/шт', 1, 3),
(30, 'Systeme Electric ИЗОЛЕНТА ПВХ 19мм Х 20м толщина-0,13мм ЧЁРНАЯ', 'Изолента Systeme Electric серии MultiSet в черном цвете предназначена для изоляции электрических соединений и проводов. Наличие большого выбора цветов позволяет использовать ее при маркировке проводов. Температура эксплуатации от -30 С до +70 С Поставляется в рулонах по 20 м и имеет ширину 19 мм при толщине 0,13 мм. Незаменима при использовании в быту.', 'Systeme Electric', 75, 'https://rndelectro.ru/upload/resize_cache/iblock/089/450_450_140cd750bba9870f18aada2478b24840a/oih1sp4qlcaurayu5x3zb7q48fybk6vd.jpg', '/шт', 1, 3),
(31, 'Изолента ПВХ Safeline 19мм х 20м черная', 'Изолента SAFELINE изготовлена на основе пленки из ПВХ изоляционного пластиката. Специальные добавки повышают эластичные свойства ленты, увеличивают ее долговечность и обеспечивают устойчивость к горению. Соответствует требованиям ГОСТ 16214-86 для изолент Высшего сорта. Изолента серии PRO предназначена для проведения электромонтажных работ и рекомендуется для профессионального и бытового применения.', 'Safeline', 114.5, 'https://rndelectro.ru/upload/resize_cache/iblock/9cd/450_450_140cd750bba9870f18aada2478b24840a/87f8ul10fyudrj5j7z9ssdr1kr2jqchu.jpg', '/шт', 1, 3),
(32, 'Трубка ТТК(3:1)-4.8/1.6 черная (КВТ)', 'Предназначены для герметизации, изоляции и защиты от коррозии контактных соединений в электроэнергетике и телекоммникациях. Расширенный коэффициент усадки - 3 -1. Материал - полиолефин, не поддерживает горение. Цвет - черный. По всей внутренней поверхности термоусадочных трубок методом соэкструзии нанесен слой термоплавкого клея. Трубки черного цвета обеспечивают устойчивость к воздействию ультрафиолетового излучения. При усадке клеевой подслой расплавляется, заполняет все неровности микрорельефа и обеспечивает полную герметичность соединений. Форма поставки - нарезка по 1 м', 'КВТ', 40, 'https://rndelectro.ru/upload/resize_cache/iblock/d5d/450_450_140cd750bba9870f18aada2478b24840a/rlsfq4njbyhqskx295l2zwvln0mtdk3r.jpg', '/шт', 1, 3),
(33, 'Маркировка кабеля (4,0…6,0 мм.кв.) (0-9. A.B.C.N.PE.L.L.1.2.3) 400шт.', NULL, 'ONKA', 2, 'https://rndelectro.ru/upload/resize_cache/iblock/29b/450_450_140cd750bba9870f18aada2478b24840a/29bf04c24d31e1654e9e0022087e2185.jpg', '/шт', 1, 4),
(34, 'Шина нулевая N 6х9 8 отверстий синий PROxima', 'Шины предназначены для присоединения нулевых проводников (шина N) и заземления (шина PE). Шины выполнены из латуни. Нулевая шина устанавливается на изоляторе.', 'PROxima', 83.5, 'https://rndelectro.ru/upload/resize_cache/iblock/9c7/450_450_140cd750bba9870f18aada2478b24840a/trm98vplq5mdhw2wdktlyg23gxw2zocg.jpg', '/шт', 1, 4),
(35, 'Клемма проходная UDK 4 Phoenix Contact', 'Четырехполюсная клемма серого цвета с винтовыми зажимами. С номинальным сечением - 4 мм² и номинальным током 32A.', 'Phoenix Contact', 139.5, 'https://rndelectro.ru/upload/resize_cache/iblock/352/450_450_140cd750bba9870f18aada2478b24840a/xzecouareoz7qiicz3dgw1zwyedqg4xq.jpg', '/шт', 1, 4),
(36, 'Наклейка модульная средний комплект 137х240 PROxima EKF', 'Знаки электробезопасности служат для предупреждения об опасности поражения электрическим током, для запрещения контактов с коммутационной аппаратурой, для определения места работы и т. п. Знаки выполнены из самоклеющейся пленки и пластика.', 'EKF', 227, 'https://rndelectro.ru/upload/resize_cache/iblock/211/450_450_140cd750bba9870f18aada2478b24840a/o9oky78cgmd2mtjvua2s10si0htr220b.jpg', '/шт', 1, 4),
(37, 'Клемма вводная KCB 16-50 желто-зеленая EKF', 'Предназначены для присоединения вводных медных и алюминиевых проводников. Подключаться могут одножильные и многожильные проводники, а также гибкие многопроволочные провода с наконечником. Сечение подключаемых проводов: от 2,5 до 240 мм2 (в зависимости от габарита клемм).', 'EKF', 158.5, 'https://rndelectro.ru/upload/resize_cache/iblock/2b9/450_450_140cd750bba9870f18aada2478b24840a/oleh5ufpy05d2dvh1ve70c0qdb9ohdao.jpg', '/шт', 1, 4),
(38, 'Лампа с/д LEEK LE A65 LED 20W 4000K E27', NULL, 'LEEK', 151, 'https://rndelectro.ru/upload/resize_cache/iblock/1fb/450_450_140cd750bba9870f18aada2478b24840a/hejtjp27saj45z3gl23n5n24f52onikt.jpg', '/шт', 3, 11),
(39, 'Лампа светодиод.шар ФАРЛАЙТ G45 10Вт 4000К Е14', NULL, 'Фарлайт', 103.5, 'https://rndelectro.ru/upload/resize_cache/iblock/087/450_450_140cd750bba9870f18aada2478b24840a/w0zgtrvkfx3n436s4ke032ft2hasrw8x.png', '/шт', 3, 11),
(40, 'Плата светодиодная Apeyron 220В, 12Вт,smd 2835, IP20, 80Лм/Вт, 4000К, 63*63мм. с линзой', NULL, 'Apeyron', 206.5, 'https://rndelectro.ru/upload/resize_cache/iblock/3fa/450_450_140cd750bba9870f18aada2478b24840a/3fa6acec34c9b41d81272899d32955cf.jpg', '/шт', 3, 11),
(41, 'Лампа светодиодная A60 11Вт грушевидная 4000К E27 230В GENERICA', NULL, 'IEK', 59.5, 'https://rndelectro.ru/upload/resize_cache/iblock/746/450_450_140cd750bba9870f18aada2478b24840a/n4ahath9co03i4d834loz4lurbf9b2kt.jpg', '/шт', 3, 11),
(42, 'Лампа светодиод.ФАРЛАЙТ GX53 9Вт 4000К', NULL, 'Фарлайт', 105, 'https://rndelectro.ru/upload/resize_cache/iblock/280/450_450_140cd750bba9870f18aada2478b24840a/9gq6vvsk964jll6utzqaj39krlih8yoc.png', '/шт', 3, 11),
(43, 'Профиль алюминиевый для светодиодной ленты, анод., П-образный , накладной, серебро, 15,2х6мм', 'Алюминиевый профиль для светодиодной ленты 08-01 по своей конструкции является накладным, что делает этот профиль отличным решением для монтажа на любую плоскую поверхность. Данная модель алюминиевого профиля имеет размер 15,2х6х2000мм, и внутри него можно разместить светодиодную ленту шириной до 10мм. В алюминиевый профиль уже установлен рассеиватель белого цвета, изготовленный из светорассеивающего поликарбоната. Такой рассеиватель пропускает 70 % светового потока и делает его более мягким и приятным для ваших глаз, поэтому наиболее часто используется для решения задач по организации декоративного и основного освещения. Также в комплекте с профилем идут заглушки в количестве 2-х шт. Благодаря дробеструйной обработке профиль имеет приятную матовую поверхность, а анодирование сохранит благородный серебристый цвет, защищая профиль от окисления', 'Apeyron', 506, 'https://rndelectro.ru/upload/resize_cache/iblock/1d6/450_450_140cd750bba9870f18aada2478b24840a/j2jg9ssj85mnhj6wcpppc2drko4f4dz5.jpg', '/шт', 3, 12),
(44, 'Блок питания Apeyron 12 В, 100 Вт, IP20, 8,3А,алюминий, слим, серый, 226*53*18 мм.', 'Блок питания 12В 03-49 из линейки Стандарт с номинальной мощностью 100Вт обладает на выходе постоянным током с напряжением 12В, что делает его идеальным источником питания для таких изделий, как светодиодная лента, светодиодные лампы, линейки и модули с рабочим напряжением 12В. Компактный, алюминиевый корпус с размерами 185х40х32мм позволит найти место для монтажа в любом интерьере, спрятать в местах с ограниченным пространством. Также он будет легок в подключении благодаря клеммам, снабженным маркировкой на корпусе', 'Apeyron', 1140, 'https://rndelectro.ru/upload/resize_cache/iblock/6b8/450_450_140cd750bba9870f18aada2478b24840a/35zxoi98w95fgpq90zfut1pxqinsnore.jpg', '/шт', 3, 12),
(45, 'Соединитель X образный FERON для светодиодных лент 3528', 'Комплект X коннекторов FERON LD190 с соединителем для светодиодной ленты (3528/8мм)', 'FERON', 62, 'https://rndelectro.ru/upload/resize_cache/iblock/bb8/450_450_140cd750bba9870f18aada2478b24840a/1c48tlm6nbhu4lyqy91hkl9ec3uysdfg.jpg', '/шт', 3, 12),
(46, 'Светодиодная лента 12В, СТ, 8Вт/м, smd2835, 60д/м, IP20, 800Лм/м', 'Светодиодная лента из линейки Стандарт с артикулом 00-121 работает от постоянного тока с напряжением 12В. Благодаря светодиодам smd 2835 излучающим световой поток равный 800 Лм/м лента является прекрасным решением для организации основного освещения и ярких декоративных подсветок. Она подойдет для создания основного освещения на базе многоуровневых потолков, а также будет отличным выбором для освещения торгового оборудования или требующих большой яркости рекламных вывесок. По сравнению с лампами накаливания светодиодная лента эквивалентна лампам мощностью 80 Вт.', 'Apeyron', 803.5, 'https://rndelectro.ru/upload/iblock/4a7/3v9n0ci1gd6o89c80e1ltuzrd3uoljc7.jpg', '/шт', 3, 12),
(47, '09-02 Коннектор для подключения ленты 10мм (5050 моно, 2835), провод 150мм', 'Коннектор 09-02 для монохромной светодиодной ленты с шириной подложки 10 мм служит прекрасной альтернативой в тех случаях, когда нет возможности паять. Чаще всего подложку шириной 10 мм можно встретить у ленты со светодиодами 5050, 2835. С помощью данного коннектора можно: соединить 2 отрезка светодиодной ленты, а также подключить светодиодную ленту к источнику питания.', 'Apeyron', 38, 'https://rndelectro.ru/upload/resize_cache/iblock/ea2/450_450_140cd750bba9870f18aada2478b24840a/bxy2rbkjzcfc1p19mjqhjfc8qvgea9g2.jpg', '/шт', 3, 12),
(48, 'Прожектор светодиодный СДО 06-50 6500К IP65 черн. IEK', 'Для внутренней и наружной декоративной и фасадной подсветки конструкций, зданий и сооружений, открытых объектов, площадей, стадионов, парков, автостоянок, рекламных стендов и сооружений, открытых пространств и объектов различного назначения. Ультратонкий корпус из литого алюминия, угловая скоба для легкого монтажа. Срок службы: 50 000 часов', 'IEK', 800, 'https://rndelectro.ru/upload/resize_cache/iblock/a99/450_450_140cd750bba9870f18aada2478b24840a/qq96arzgnufnuodwahqpq4k4vdv5xt2o.jpg', '/шт', 3, 13),
(49, 'Прожектор светодиодный STAR 2 220-240В 30вт IP65 6500К, Sparkled', 'Светодиодный прожектор — оптимальный современный прибор для освещения приусадебного участка, парковки, технического помещения и других пространств самой разной площади и назначения.', 'Sparkled', 275.5, 'https://rndelectro.ru/upload/resize_cache/iblock/bf1/450_450_140cd750bba9870f18aada2478b24840a/dbn603ev7fcjnzzbqt8jsca33pxgh1f2.jpg', '/шт', 3, 13),
(50, 'Прожектор с/д LE LED FL1 150W BLACK IP65 холодный белый', 'Коллекция FL1 и модель LE040303-0047 российского производителя Leek разработана для открытых помещений в функциональном стиле. Прожектор Leek FL1 обладает габаритами 33 см по высоте, 3.5 см длиной, 27.5 см шириной. Арматура черного цвета выполнена из алюминия, прямоугольный плафон, направленный вниз, произведен из стекла.', 'LEEK', 2745.5, 'https://rndelectro.ru/upload/iblock/807/lmj9m9po8dvr1aao7e1stz7o7ilthage.jpg', '/шт', 3, 13),
(51, 'Свет-к с/д (авар) LE LED LT-96130 (40)', 'Пластиковый корпус с прозрачным полимерным рассеивателем\r\nИсточник света – светодиоды Epistar (Тайвань)\r\nЛитий-ионный аккумулятор\r\nВстроенный в корпус шнур для подключения устройства к сети 220 В\r\nВыключатель/переключатель мощности свечения светильника\r\nИндикатор заряда/наличия напряжения в электросети\r\nКнопка для тестирования в режиме подзарядки\r\nВыдвижные петли для удобства монтажа', 'LEEK', 385, 'https://rndelectro.ru/upload/iblock/a7f/2lj17tsrnfmbkke44vvc4ij9p1wj1d37.jpg', '/шт', 3, 13),
(52, 'Прожектор светодиодный STAR 2 220-240В 100вт IP65 6500К, Sparkled', 'Светодиодный прожектор — оптимальный современный прибор для освещения приусадебного участка, парковки, технического помещения и других пространств самой разной площади и назначения.', 'Sparkled', 607.5, 'https://rndelectro.ru/upload/resize_cache/iblock/ca1/450_450_140cd750bba9870f18aada2478b24840a/ykhbin4f527t6e1z0uljh3jw6bfyfu6q.jpg', '/шт', 3, 13),
(53, 'Настольный светильник 12Вт (RED) RG-TD1201', NULL, NULL, 2406.5, 'https://rndelectro.ru/upload/resize_cache/iblock/bb3/450_450_140cd750bba9870f18aada2478b24840a/wb1ume7ge7mdlovbcvf4lrkqqv48paqv.jpg', '/шт', 3, 14),
(54, 'Светильник настольный LE TL-203 BLACK (Черный, E27, пакет) (24)', NULL, NULL, 490, 'https://rndelectro.ru/upload/resize_cache/iblock/f24/450_450_140cd750bba9870f18aada2478b24840a/jcx5i19p5n9a8vzpgqxnmtx9ppeyu6iz.jpg', '/шт', 3, 14),
(55, 'Светильник настольный светодиодный ССО-01Б 8Вт сенсор-диммер RGB-ночник адаптер БЕЛЫЙ IN HOME', NULL, 'IN HOME', 1205.5, 'https://rndelectro.ru/upload/resize_cache/iblock/0ac/450_450_140cd750bba9870f18aada2478b24840a/r8r3qum7autp4qa394hxfpr0ses2kk0u.jpg', '/шт', 3, 14),
(56, 'Светильник настольный LE TL-108 RED (Красный, E27, прищепка, пакет) (24)', NULL, NULL, 450.5, 'https://rndelectro.ru/upload/resize_cache/iblock/d4a/450_450_140cd750bba9870f18aada2478b24840a/5sct4vflcp1pd8qlhnxukyjobi862kc8.jpg', '/шт', 3, 14),
(57, 'Свет-к с/д (ночник) LE LED NL-817-S 0,5W (Круг, с датчиком освещенности) (100)', NULL, NULL, 240.5, 'https://rndelectro.ru/upload/resize_cache/iblock/0b6/450_450_140cd750bba9870f18aada2478b24840a/5mt5id12cssg3j6gme2xudfzub0lmtw3.jpeg', '/шт', 3, 14),
(58, 'Свет-к точ. GX53 LE M 223-10 (106х90х38); Цв:Черненая бронза (10/100)', NULL, 'LEEK', 87.5, 'https://rndelectro.ru/upload/resize_cache/iblock/daf/450_450_140cd750bba9870f18aada2478b24840a/juu1mnjj1koij7a8ypomptzogl80wam5.jpg', '/шт', 3, 15),
(59, 'Свет-к точ. GX53 LE M 223-1 (106х90х38); Цв:Белый (10/100)', NULL, 'LEEK', 76, 'https://rndelectro.ru/upload/resize_cache/iblock/806/450_450_140cd750bba9870f18aada2478b24840a/m7rkj8f08vw8pjd1bc0mvponq4gi7fle.jpg', '/шт', 3, 15),
(60, 'Свет-к точ. GX53 LE M 223-3 (100x78x16.7); Цв:Хром (1/100)', NULL, 'LEEK', 92, 'https://rndelectro.ru/upload/resize_cache/iblock/6d0/450_450_140cd750bba9870f18aada2478b24840a/vcdrxxwlf6j974dgpvwmozge81e2nkg3.jpg', '/шт', 3, 15),
(61, 'Свет-к с/д PRE LED ECO 01 18W 6500К (30)', NULL, 'LEEK', 255.5, 'https://rndelectro.ru/upload/resize_cache/iblock/a5f/450_450_140cd750bba9870f18aada2478b24840a/n41kebocnmd13rrlclgs2xrr7rtscypp.jpg', '/шт', 3, 15),
(62, 'Светильник встраиваемый Sweko SDOT-D106H4-GX53-WH-10 Белый', NULL, 'Sweko', 65.5, 'https://rndelectro.ru/upload/resize_cache/iblock/265/450_450_140cd750bba9870f18aada2478b24840a/iewyw7d82xcqthpcwytkzigaa12fhlrl.jpg', '/шт', 3, 15),
(63, 'Свет-к с/ LE LED ECO 27W 6500К (20)', 'Идеально ровный без пульсаций свет во всем диапазоне питания\r\nУдобство и простота монтажа\r\nДля основного и дополнительного освещения помещений административных и жилых зданий', NULL, 385.5, 'https://rndelectro.ru/upload/resize_cache/iblock/6b1/450_450_140cd750bba9870f18aada2478b24840a/sxdes0gx4e99j3kvdk7hhgowd3kbsxso.jpg', '/шт', 3, 16),
(64, 'LED-01-16W-4000-W ЭРА Линейный светодиодный светильник с выключателем 16Вт 6500К L1172мм', 'Линейный светодиодный светильник LED-01 мощностью 16W 230V. В комплекте: светильник без выключателя, сетевой шнур 15см без вилки,  твердый коннектор, крепеж для монтажа на вертикальную или горизонтальную поверхность.', NULL, 363.5, 'https://rndelectro.ru/upload/resize_cache/iblock/0e7/450_450_140cd750bba9870f18aada2478b24840a/r5l06ilf8icpecfyqi9tysywrz0fyl4l.jpg', '/шт', 3, 16),
(65, 'Светильник Линейный LED 80Вт 6500К 7600Лм Белый 1200х68мм 120º IP65 REDIGLE', 'Влагозащищенный линейный светильник\r\nМощность 80 Вт\r\nНапряжение 220 В\r\nСтепень пылевлагозащиты IP 65\r\nЦветовая температура 6500K холодный белый свет', 'REDIGLE', 1386, 'https://rndelectro.ru/upload/iblock/94d/w8rogz1rx8e6n77u31ysvojiqj4fhxeb.jpeg', '/шт', 3, 16),
(66, 'Светодиодный светильник Split 14Вт 900мм 6500К матовый', NULL, 'Split', 637, 'https://rndelectro.ru/upload/resize_cache/iblock/61f/450_450_140cd750bba9870f18aada2478b24840a/n0md4momuxv9e2cwendpmqyjmg4o6m5y.jpg', '/шт', 3, 16),
(67, 'Линейный светодиодный светильник СПБ 10Вт 6500K 600мм Фарлайт', 'Яркий светодиодный линейный светильник Фарлайт с выключателем на корпусе может использоваться как самостоятельный элемент подсветки, так и в комплексной системе освещения. Цветовая температура 6500К - это холодный белый свет. Он идеально подойдет для акцентного освещения зоны мойки на кухне; для рабочего стола - его свет уравновешивает и повышает работоспособность, а также не искажает цветопередачу объектов; в ванной комнате в зоне для умывания - холодные оттенки помогут взбодриться и до конца проснуться.', 'Фарлайт', 450.5, 'https://rndelectro.ru/upload/resize_cache/iblock/0f1/450_450_140cd750bba9870f18aada2478b24840a/hmlksnsxn8a2m3uf0ysylzwjn66orhfl.jpg', '/шт', 3, 16),
(68, 'Аккумуляторный светодиодный фонарь с прямой зарядкой 5 LED Smartbuy, синий (SBF-99-B) 1/150', NULL, 'Smartbuy', 285, 'https://rndelectro.ru/upload/resize_cache/iblock/159/450_450_140cd750bba9870f18aada2478b24840a/if1xpufc6ll7ts8paqh630ajyjdimct7.jpg', '/шт', 3, 17),
(69, 'Фонарь налобный RC-GY-71', NULL, NULL, 324, 'https://rndelectro.ru/upload/resize_cache/iblock/9ea/450_450_140cd750bba9870f18aada2478b24840a/pajt09yd1yjox92h7t828vd9gw0ktr27.png', '/шт', 3, 17),
(70, 'Фонарь кемпинговый Smartbuy', NULL, 'Smartbuy', 864.5, 'https://rndelectro.ru/upload/resize_cache/iblock/9ba/450_450_140cd750bba9870f18aada2478b24840a/mra0lxwgp4avtadcstv2znx4tgrr2dkw.jpg', '/шт', 3, 17),
(71, 'Светодиодный ручной c магнитом YYC-736-Т6', NULL, NULL, 675, 'https://rndelectro.ru/upload/resize_cache/iblock/f76/450_450_140cd750bba9870f18aada2478b24840a/vek3w23xx47ssj00to9z4iz9ok0q8lbd.jpg', '/шт', 3, 17),
(72, 'Аккумуляторный светодиодный фонарь CREE T6 10W с системой фок-ки луча, металлический с ручкой, IP54', NULL, 'CREE', 1216.5, 'https://rndelectro.ru/upload/resize_cache/iblock/fca/450_450_140cd750bba9870f18aada2478b24840a/1nhi1e7c59g52fxjq7a40deadjw75tja.jpg', '/шт', 3, 17),
(73, 'Бур усиленный \'ЭНКОР\' SDS+ 6*100/160', NULL, 'ЭНКОР', 91.5, 'https://rndelectro.ru/upload/resize_cache/iblock/1f0/450_450_140cd750bba9870f18aada2478b24840a/1f083bb1b311c571420357e667ab5eae.jpg', '/шт', 4, 18),
(74, 'Бур Зубр по бетону 6х110мм', NULL, 'Зубр', 149.5, 'https://rndelectro.ru/upload/resize_cache/iblock/bec/450_450_140cd750bba9870f18aada2478b24840a/bec71816c52940aea667694dc7c56dfe.jpg', '/шт', 4, 18),
(75, 'Перфоратор SDS-plus, ЗУБР П-26-800, реверс,горизонтальный, 3 Дж, 0-1300 об/мин, 0-4800 уд/мин,800', NULL, 'Зубр', 7283.5, 'https://rndelectro.ru/upload/resize_cache/iblock/f8c/450_450_140cd750bba9870f18aada2478b24840a/f8c87911a14b612df48a3e3cadb051cd.jpg', '/шт', 4, 18),
(76, 'Лобзик электрический, 400 Вт, ЗУБР', NULL, 'Зубр', 2451, 'https://rndelectro.ru/upload/resize_cache/iblock/349/450_450_140cd750bba9870f18aada2478b24840a/349bb95d892960d19d8e5ec1dca42d72.jpg', '/шт', 4, 18),
(77, 'Аккумуляторный перфоратор DongCheng DCZC04-24', NULL, 'DongCheng', 11841.5, 'https://rndelectro.ru/upload/resize_cache/iblock/96d/450_450_140cd750bba9870f18aada2478b24840a/hailo5xl4ssa86xbonabb9827j8rt8x8.jpg', '/шт', 4, 18),
(78, 'Электропаяльник ЭПСН Россия 65Вт с пластиковой рукояткой', NULL, 'Rexant', 407, 'https://rndelectro.ru/upload/resize_cache/iblock/68e/450_450_140cd750bba9870f18aada2478b24840a/dw2nz65rqkyazhzir7n96wj09ndnujn7.jpg', '/шт', 4, 19),
(79, 'Паяльник ПП (ЭПСН) 65Вт 220В пластик. ручка Rexant', NULL, 'Rexant', 373, 'https://rndelectro.ru/upload/resize_cache/iblock/4ba/450_450_140cd750bba9870f18aada2478b24840a/konxxuz1jq0thgbhnat3qlp2wo89m1q1.jpeg', '/шт', 4, 19),
(80, 'Отвертка Master SL5.5x125 мм EKF', NULL, 'EKF', 218, 'https://rndelectro.ru/upload/resize_cache/iblock/1e1/450_450_140cd750bba9870f18aada2478b24840a/tmi4wya1ka4ooeyl02am7os2skt2vuf1.png', '/шт', 4, 19),
(81, 'Кованый топор ЗУБР Фибергласс Плюс, 600/900 г, с чехлом, 380мм', NULL, 'Зубр', 1226.5, 'https://rndelectro.ru/upload/resize_cache/iblock/d97/450_450_140cd750bba9870f18aada2478b24840a/ww5u1ewp00b7vvchlby0g1vpq7mezsms.jpg', '/шт', 4, 19),
(82, 'Лезвия STAYER. сегментированные 18мм', NULL, 'STAYER', 68.5, 'https://rndelectro.ru/upload/resize_cache/iblock/1a0/450_450_140cd750bba9870f18aada2478b24840a/0wd7vj9zybp8ej6jf7djpfgft8es15jf.jpg', '/шт', 4, 19),
(83, 'KRAFTOOL ножницы для металлопласт труб', NULL, 'KRAFTOOL', 1795, 'https://rndelectro.ru/upload/resize_cache/iblock/e19/450_450_140cd750bba9870f18aada2478b24840a/5hpvdiz9jvxrckg37kb58bx3ws8c82fp.jpg', '/шт', 4, 20),
(84, 'Сварочный аппарат (паяльник) для полипропиленовых труб, ЗУБР Мастер АСТ-2000,1000/2000Вт, 50-300С', NULL, 'Зубр', 4814.5, 'https://rndelectro.ru/upload/resize_cache/iblock/eb9/450_450_140cd750bba9870f18aada2478b24840a/eb9a0c5079be14d5c65d0d547ca34c7b.jpg', '/шт', 4, 20),
(85, 'Бур усиленный \'ЭНКОР\' SDS+ 6*100/160', NULL, 'ЭНКОР', 91.5, 'https://rndelectro.ru/upload/resize_cache/iblock/1f0/450_450_140cd750bba9870f18aada2478b24840a/1f083bb1b311c571420357e667ab5eae.jpg', '/шт', 4, 18),
(86, 'Бур Зубр по бетону 6х110мм', NULL, 'Зубр', 149.5, 'https://rndelectro.ru/upload/resize_cache/iblock/bec/450_450_140cd750bba9870f18aada2478b24840a/bec71816c52940aea667694dc7c56dfe.jpg', '/шт', 4, 18),
(87, 'Перфоратор SDS-plus, ЗУБР П-26-800, реверс,горизонтальный, 3 Дж, 0-1300 об/мин, 0-4800 уд/мин,800', NULL, 'Зубр', 7283.5, 'https://rndelectro.ru/upload/resize_cache/iblock/f8c/450_450_140cd750bba9870f18aada2478b24840a/f8c87911a14b612df48a3e3cadb051cd.jpg', '/шт', 4, 18),
(88, 'Лобзик электрический, 400 Вт, ЗУБР', NULL, 'Зубр', 2451, 'https://rndelectro.ru/upload/resize_cache/iblock/349/450_450_140cd750bba9870f18aada2478b24840a/349bb95d892960d19d8e5ec1dca42d72.jpg', '/шт', 4, 18),
(89, 'Аккумуляторный перфоратор DongCheng DCZC04-24', NULL, 'DongCheng', 11841.5, 'https://rndelectro.ru/upload/resize_cache/iblock/96d/450_450_140cd750bba9870f18aada2478b24840a/hailo5xl4ssa86xbonabb9827j8rt8x8.jpg', '/шт', 4, 18),
(90, 'Электропаяльник ЭПСН Россия 65Вт с пластиковой рукояткой', NULL, 'Rexant', 407, 'https://rndelectro.ru/upload/resize_cache/iblock/68e/450_450_140cd750bba9870f18aada2478b24840a/dw2nz65rqkyazhzir7n96wj09ndnujn7.jpg', '/шт', 4, 19),
(91, 'Паяльник ПП (ЭПСН) 65Вт 220В пластик. ручка Rexant', NULL, 'Rexant', 373, 'https://rndelectro.ru/upload/resize_cache/iblock/4ba/450_450_140cd750bba9870f18aada2478b24840a/konxxuz1jq0thgbhnat3qlp2wo89m1q1.jpeg', '/шт', 4, 19),
(92, 'Отвертка Master SL5.5x125 мм EKF', NULL, 'EKF', 218, 'https://rndelectro.ru/upload/resize_cache/iblock/1e1/450_450_140cd750bba9870f18aada2478b24840a/tmi4wya1ka4ooeyl02am7os2skt2vuf1.png', '/шт', 4, 19),
(93, 'Кованый топор ЗУБР Фибергласс Плюс, 600/900 г, с чехлом, 380мм', NULL, 'Зубр', 1226.5, 'https://rndelectro.ru/upload/resize_cache/iblock/d97/450_450_140cd750bba9870f18aada2478b24840a/ww5u1ewp00b7vvchlby0g1vpq7mezsms.jpg', '/шт', 4, 19),
(94, 'Лезвия STAYER. сегментированные 18мм', NULL, 'STAYER', 68.5, 'https://rndelectro.ru/upload/resize_cache/iblock/1a0/450_450_140cd750bba9870f18aada2478b24840a/0wd7vj9zybp8ej6jf7djpfgft8es15jf.jpg', '/шт', 4, 19),
(95, 'KRAFTOOL ножницы для металлопласт труб', NULL, 'KRAFTOOL', 1795, 'https://rndelectro.ru/upload/resize_cache/iblock/e19/450_450_140cd750bba9870f18aada2478b24840a/5hpvdiz9jvxrckg37kb58bx3ws8c82fp.jpg', '/шт', 4, 20),
(96, 'Сварочный аппарат (паяльник) для полипропиленовых труб, ЗУБР Мастер АСТ-2000,1000/2000Вт, 50-300С', NULL, 'Зубр', 4814.5, 'https://rndelectro.ru/upload/resize_cache/iblock/eb9/450_450_140cd750bba9870f18aada2478b24840a/eb9a0c5079be14d5c65d0d547ca34c7b.jpg', '/шт', 4, 20),
(97, 'Трещётка ЗУБР \'Профессионал\' для трубных клуппов', 'Сталь\r\nHSS (быстрорежущая)\r\nКлупп в комплекте\r\nнет дюйм\r\nДлина-620 мм\r\nДля клуппов-1/4; 3/8; 1/2; 3/4; 1; 1 1/4\r\nТип головки-R11\r\nВес нетто-1.44 кг', 'Зубр', 2795.5, 'https://rndelectro.ru/upload/resize_cache/iblock/2b3/450_450_140cd750bba9870f18aada2478b24840a/h1aaob015irt0ad5o06xgxz2gv8ztrax.jpg', '/шт', 4, 20),
(98, 'Клупп ЗУБР профессионал трубный 1 1/4', NULL, 'Зубр', 1092, 'https://rndelectro.ru/upload/resize_cache/iblock/af5/450_450_140cd750bba9870f18aada2478b24840a/af5f428eb6d1f99908fa7504706c225f.jpg', '/шт', 4, 20),
(99, 'Клупп ЗУБР \'ЭКСПЕРТ\' трубный резьбонарезной 3/4', 'Направление резьбы-правая\r\nРезьба-3/4 дюйм\r\nТип головки-R11\r\nТип резьбы-BSPT-R\r\nВес нетто-0.66 кг', 'Зубр', 1117, 'https://rndelectro.ru/upload/resize_cache/iblock/b21/450_450_140cd750bba9870f18aada2478b24840a/7qxxmblwoao08uiztsswsgxgywz2141c.jpg', '/шт', 4, 20),
(100, 'Стержни STAYER \'MASTER\' для клеевых (термоклеящих) пистолетов', NULL, 'STAYER', 37, 'https://rndelectro.ru/upload/resize_cache/iblock/b80/450_450_140cd750bba9870f18aada2478b24840a/b80d8a58adfb858a92e1d9da93ef2a4e.jpg', '/шт', 4, 21),
(101, 'Мультиметр цифровой M838 EKF Master', NULL, 'EKF', 618, 'https://rndelectro.ru/upload/resize_cache/iblock/b1c/450_450_140cd750bba9870f18aada2478b24840a/5gx8ag3v60fotncmjt8q1on1kb9cteyp.jpg', '/шт', 4, 21),
(102, 'Клипса СМ серия \'Quick-Lock\' (KBT)', NULL, 'KBT', 268, 'https://rndelectro.ru/upload/resize_cache/iblock/47d/450_450_140cd750bba9870f18aada2478b24840a/47d69f5c8dd3ae536ed40d4ebd4ea889.jpg', '/шт', 4, 21),
(103, 'Токовые клещи цифровые 266 EKF Master', NULL, 'EKF', 1037, 'https://rndelectro.ru/upload/resize_cache/iblock/8b6/450_450_140cd750bba9870f18aada2478b24840a/18lfa72fkpxgccx4jf53c7op4y5zwn1e.jpg', '/шт', 4, 21),
(104, 'Инструмент для снятия изоляции 0,05-10мм WS-12 «Ягуар» Профи КВТ', NULL, 'КВТ', 2428, 'https://rndelectro.ru/upload/resize_cache/iblock/47c/450_450_140cd750bba9870f18aada2478b24840a/c3d2kf0idcmpo9k2abw561dbixsvj1pc.jpg', '/шт', 4, 21),
(105, 'Лазерный 4D уровень 12 Линий HILDA', NULL, 'HILDA', 5407, 'https://rndelectro.ru/upload/resize_cache/iblock/08b/450_450_140cd750bba9870f18aada2478b24840a/ifipk3sn0m37mp3043233mz56hehqk4y.jpg', '/шт', 4, 22),
(106, 'Лазерный 3D уровень 12 Линий HILDA', NULL, 'HILDA', 3284.5, 'https://rndelectro.ru/upload/resize_cache/iblock/a18/450_450_140cd750bba9870f18aada2478b24840a/xzn7j53j7ci1kl5ekzwe3nsjw1uz1zki.jpg', '/шт', 4, 22),
(107, 'Лазерный 3D уровень Fukuda 3D MW-93D-2-3GX', NULL, 'Fukuda', 13100, 'https://rndelectro.ru/upload/resize_cache/iblock/1de/450_450_140cd750bba9870f18aada2478b24840a/qnvomp1v9jprzb9bms56icdso95pxjua.jpg', '/шт', 4, 22),
(108, 'Перчатки хозяйственные латексные БИКОЛОР L /синий+желтый/ Komfi/144/12', NULL, 'Komfi', 71.5, 'https://rndelectro.ru/upload/resize_cache/iblock/3c9/450_450_140cd750bba9870f18aada2478b24840a/di7nikzgt24o2z28qgun48t692wv2svd.jpg', '/шт', 5, 23),
(109, 'Перчатки Для точных работ, полиэстер, полиуретановое покрытие, в и/у, 8(M), белые, Fiberon', NULL, 'Fiberon', 68.5, 'https://rndelectro.ru/upload/resize_cache/iblock/f78/450_450_140cd750bba9870f18aada2478b24840a/y696yh35q2qjpro3xsbiohwmnbjds7mr.jpg', '/шт', 5, 23),
(110, 'Перчатки Fiberon Для сборочных работ черные ( L )', NULL, 'Fiberon', 41.5, 'https://rndelectro.ru/upload/iblock/928/nd55ohyodfld6rr66q1pbqke9019oa96.jpg', '/шт', 5, 23),
(111, 'Перчатки полиэстеровые с полиуретановым покрытием , цв. черный, р. 9', NULL, 'DeltaClub', 103.5, 'https://rndelectro.ru/upload/resize_cache/iblock/556/450_450_140cd750bba9870f18aada2478b24840a/ve7zuix11quzawmqlpg05ivlqggi8cy4.jpg', '/шт', 5, 23),
(112, 'Перчатки Gepro', NULL, 'Gepro', 44.5, 'https://rndelectro.ru/upload/resize_cache/iblock/6fd/450_450_140cd750bba9870f18aada2478b24840a/khlqxsazrev3awwtzzk8p8vniy8lh20y.jpg', '/шт', 5, 23),
(113, 'Стекло к маске сварщика 90х110 С7', NULL, NULL, 50, 'https://rndelectro.ru/upload/resize_cache/iblock/48d/450_450_140cd750bba9870f18aada2478b24840a/fqsamwe7r6re8s158hr9xu1lunjz3a1v.jpg', '/шт', 5, 24),
(114, 'Стекло к маске сварщика 52х102 С3', NULL, NULL, 24, 'https://rndelectro.ru/upload/resize_cache/iblock/71b/450_450_140cd750bba9870f18aada2478b24840a/bay8muaiwlog2kod2adkyj2fyp10lkl7.jpg', '/шт', 5, 24),
(115, 'Стекло к маске сварщика 52х102 С7', NULL, NULL, 36, NULL, '/шт', 5, 24),
(116, 'Мат SPYHEAT ЭКСТРА SHMD-12-2-460', NULL, 'SPYHEAT', 4422.5, NULL, '/шт', 6, 25),
(117, 'Мат SPYHEAT ЭКСТРА SHMD-12-3-690', NULL, 'SPYHEAT', 5398.5, NULL, '/шт', 6, 25),
(118, 'Мат SPYHEAT ЭКСТРА SHMD-12-4-460', NULL, 'SPYHEAT', 6952.5, NULL, '/шт', 6, 25),
(119, 'Нагревательный мат двухжильные \'ЧТК\' МНД160 - 1,0 - 160 Вт', NULL, 'ЧТК', 2586.5, NULL, '/шт', 6, 27),
(120, 'Нагревательный мат двухжильные \'ЧТК\' МНД160 - 7,0 - 1120 Вт', NULL, 'ЧТК', 10229, NULL, '/шт', 6, 27),
(121, 'Нагревательный мат двухжильные \'ЧТК\' МНД160 - 5,0 - 800 Вт', NULL, 'ЧТК', 7760, NULL, '/шт', 6, 27),
(122, 'Нагревательный мат двухжильные \'ЧТК\' МНД160 - 1,5 - 240 Вт', NULL, 'ЧТК', 3181, NULL, '/шт', 6, 27),
(123, 'Секция нагревательная CHT-18-697 (38,7м)', NULL, 'ЧТК', 5450, NULL, '/шт', 6, 27),
(124, 'PL3-269F-1 Кран для одной воды, из высокопрочного пластика-белый', NULL, 'Ростовская мануфактура сантехники', 340, 'https://rndelectro.ru/upload/resize_cache/iblock/4c3/450_450_140cd750bba9870f18aada2478b24840a/einf3ip4ooje3qrpqsa5whgldq6t268f.jpg', '/шт', 8, 28),
(125, 'Смеситель для умывальника, глянцевый хром, Enjoy, Milardo', 'Коллекция: Enjoy\r\nМатериал: Латунь ЛЦ40C (ГОСТ 17711-93)\r\nЦвет: Глянцевый хром\r\nПокрытие: Никель-хромовое\r\nТип излива: Фиксированный\r\nРазмер изделия (мм): 170x49x177\r\nДлина излива (мм): 133\r\nАэратор: Пластиковый аэратор M18\r\nТип водозапорного механизма: Керамический картридж 35 мм\r\nМонтаж: На умывальник\r\nСтрана производитель: РОССИЯ', 'Milardo', 3851.5, 'https://rndelectro.ru/upload/resize_cache/iblock/739/450_450_140cd750bba9870f18aada2478b24840a/hltqpzk8u2b4fdq4luh8i4z3xt9grxr1.jpg', '/шт', 8, 28),
(126, 'Смеситель для кухни на гайке стандарт (рефликторный излив)', NULL, 'Zegor', 2103, 'https://rndelectro.ru/upload/resize_cache/iblock/734/450_450_140cd750bba9870f18aada2478b24840a/c3oitt1hky8fefc2aekce49rfyp0v0bm.jpg', '/шт', 8, 28),
(127, 'Смеситель для умывальника Milardo Simp SIMSB00M01', NULL, 'Milardo', 2114, 'https://rndelectro.ru/upload/resize_cache/iblock/67b/450_450_140cd750bba9870f18aada2478b24840a/3xhpy84zqwfxvd60b40vs3l9ow831f00.jpg', '/шт', 8, 28),
(128, 'FEINISE Насадка для гибкого излива двухрежимная S23', NULL, 'FEINISE', 186.5, 'https://rndelectro.ru/upload/resize_cache/iblock/50a/450_450_140cd750bba9870f18aada2478b24840a/4hph6d99taomjmxor4jlb3y82ie04v2p.jpg', '/шт', 8, 28),
(129, 'Аэрозольная эмаль универсальная ярко-зеленый 520мл. NO.101', NULL, 'DECORIX', 246, 'https://rndelectro.ru/upload/resize_cache/iblock/13a/450_450_140cd750bba9870f18aada2478b24840a/f0kogxkqsi7s711hwqp6j6sjinj8h5pm.jpg', '/шт', 9, 8),
(130, 'Аэрозольная эмаль универсальная коричневый 520мл. A39 (12 шт/кор)', NULL, 'DECORIX', 246, 'https://rndelectro.ru/upload/resize_cache/iblock/3fb/450_450_140cd750bba9870f18aada2478b24840a/tidr6n2sx0k1qz3smvtihg8kxqfahroc.jpg', '/шт', 9, 8),
(131, 'Аэрозольная эмаль универсальная черный глянцевый 520мл.', NULL, 'DECORIX', 246, 'https://rndelectro.ru/upload/resize_cache/iblock/33d/450_450_140cd750bba9870f18aada2478b24840a/3rsu3hwa9ttkezg4ec9ix4rkakf3dqr6.jpg', '/шт', 9, 8),
(132, 'Аэрозольная эмаль универсальная белый матовый 520мл. A24', NULL, 'DECORIX', 246, 'https://rndelectro.ru/upload/resize_cache/iblock/bde/450_450_140cd750bba9870f18aada2478b24840a/x96nvew047p8pcf8cgbeycq7u3vgcdic.jpg', '/шт', 9, 8),
(133, 'Аэрозольная эмаль универсальная зеленый 520мл. A14', NULL, 'DECORIX', 246, 'https://rndelectro.ru/upload/resize_cache/iblock/5e1/450_450_140cd750bba9870f18aada2478b24840a/igzyv9wpm4m0yk5wih0senr9v30vy2dt.jpg', '/шт', 9, 8),
(134, 'Грунт - Эмаль 3 в 1 зеленая 1,8 кг', NULL, 'ULTRA LINES', 505.5, 'https://rndelectro.ru/upload/resize_cache/iblock/c9e/450_450_140cd750bba9870f18aada2478b24840a/jcs0ft024lmi0kgwvffpxi4sz7uda2is.png', '/шт', 9, 9),
(135, 'Грунт-Эмаль 3 в 1 Коричневая 1,8 кг', NULL, 'ULTRA LINES', 487.5, 'https://rndelectro.ru/upload/resize_cache/iblock/c9e/450_450_140cd750bba9870f18aada2478b24840a/jcs0ft024lmi0kgwvffpxi4sz7uda2is.png', '/шт', 9, 9),
(136, 'Грунт - Эмаль 3 в 1 белая 0,8 кг', NULL, 'ULTRA LINES', 246, 'https://rndelectro.ru/upload/resize_cache/iblock/414/450_450_140cd750bba9870f18aada2478b24840a/h0n4iyy3xn2uc8ler0g0l5xfls1ufpw6.jpg', '/шт', 9, 9),
(137, 'Грунт - Эмаль 3 в 1 бирюза 1,8 кг', NULL, 'ULTRA LINES', 505.5, 'https://rndelectro.ru/upload/resize_cache/iblock/c9e/450_450_140cd750bba9870f18aada2478b24840a/jcs0ft024lmi0kgwvffpxi4sz7uda2is.png', '/шт', 9, 9),
(138, 'Грунт - Эмаль 3 в 1 жёлтая 0,8 кг', NULL, 'ULTRA LINES', 236.5, 'https://rndelectro.ru/upload/resize_cache/iblock/414/450_450_140cd750bba9870f18aada2478b24840a/h0n4iyy3xn2uc8ler0g0l5xfls1ufpw6.jpg', '/шт', 9, 9),
(139, 'Эмаль ПФ-115 парижская зелень 1,8 кг', NULL, 'ULTRA LINES', 392.5, 'https://rndelectro.ru/upload/resize_cache/iblock/811/450_450_140cd750bba9870f18aada2478b24840a/vntj49agybj3jhltwue8b7fu8qfyp2ih.jpg', '/шт', 9, 10),
(140, 'Эмаль ПФ-115 ярко-зеленая 1,8 кг Радуга', NULL, 'ULTRA LINES', 378.5, 'https://rndelectro.ru/upload/resize_cache/iblock/811/450_450_140cd750bba9870f18aada2478b24840a/vntj49agybj3jhltwue8b7fu8qfyp2ih.jpg', '/шт', 9, 10),
(141, 'Эмаль ПФ-115 изумруд 1,8 кг', NULL, 'ULTRA LINES', 392.5, 'https://rndelectro.ru/upload/resize_cache/iblock/811/450_450_140cd750bba9870f18aada2478b24840a/vntj49agybj3jhltwue8b7fu8qfyp2ih.jpg', '/шт', 9, 10),
(142, 'Эмаль ПФ-115 желтая 1,8 кг', NULL, 'ULTRA LINES', 392.5, 'https://rndelectro.ru/upload/resize_cache/iblock/811/450_450_140cd750bba9870f18aada2478b24840a/vntj49agybj3jhltwue8b7fu8qfyp2ih.jpg', '/шт', 9, 10),
(143, 'Эмаль ПФ-115 черная 1,8 кг', NULL, 'ULTRA LINES', 408.5, 'https://rndelectro.ru/upload/resize_cache/iblock/811/450_450_140cd750bba9870f18aada2478b24840a/vntj49agybj3jhltwue8b7fu8qfyp2ih.jpg', '/шт', 9, 10),
(144, 'Счетчик газа СГМН-1М-G6 200мм Левый', 'Счетчики газа двухкамерные СГМН предназначены для измерения израсходованного количества природного газа по ГОСТ 5542-87 или паров сжиженного углеводородного газа по ГОСТ 20448-90 применяемых в бытовых и производственных целях.', NULL, 5980, 'https://rndelectro.ru/upload/iblock/018/xsrryifcxj12ny9tuiy4seyycakj17or.jpg', '/шт', 10, 29),
(145, 'Счетчик газа СГМН-1М-G6 200мм Правый', 'Счетчики газа двухкамерные СГМН предназначены для измерения израсходованного количества природного газа по ГОСТ 5542-87 или паров сжиженного углеводородного газа по ГОСТ 20448-90 применяемых в бытовых и производственных целях.', NULL, 5980, 'https://rndelectro.ru/upload/iblock/018/xsrryifcxj12ny9tuiy4seyycakj17or.jpg', '/шт', 10, 29),
(146, 'Счетчик газа СГМН-1М-G6 200мм Левый', 'Счетчики газа двухкамерные СГМН предназначены для измерения израсходованного количества природного газа по ГОСТ 5542-87 или паров сжиженного углеводородного газа по ГОСТ 20448-90 применяемых в бытовых и производственных целях.', NULL, 5980, 'https://rndelectro.ru/upload/iblock/018/xsrryifcxj12ny9tuiy4seyycakj17or.jpg', '/шт', 10, 29),
(147, 'Счетчик газа СГМН-1М-G6 200мм Правый', 'Счетчики газа двухкамерные СГМН предназначены для измерения израсходованного количества природного газа по ГОСТ 5542-87 или паров сжиженного углеводородного газа по ГОСТ 20448-90 применяемых в бытовых и производственных целях.', NULL, 5980, 'https://rndelectro.ru/upload/iblock/018/xsrryifcxj12ny9tuiy4seyycakj17or.jpg', '/шт', 10, 29),
(148, 'Счётчик газа G4 СГВ-LM 4,0 (М33*1,5-206) Левый, горизонтальный (\'СКАЙМЕТР\')', NULL, NULL, 4290, 'https://rndelectro.ru/upload/resize_cache/iblock/183/450_450_140cd750bba9870f18aada2478b24840a/nzkxltcmwjfp5j2je62g9pq2k2ip9psa.jpeg', '/шт', 10, 29),
(149, 'Счетчик газа СГМН-1М-G6 250мм Правый', 'Счетчики газа двухкамерные СГМН предназначены для измерения израсходованного количества природного газа по ГОСТ 5542-87 или паров сжиженного углеводородного газа по ГОСТ 20448-90 применяемых в бытовых и производственных целях.', NULL, 6345, 'https://rndelectro.ru/upload/iblock/018/xsrryifcxj12ny9tuiy4seyycakj17or.jpg', '/шт', 10, 29),
(150, 'Газовый котёл Baxi ECO LIFE 24 F двухконтурный', NULL, 'Baxi', 57500, 'https://rndelectro.ru/upload/resize_cache/iblock/1d8/450_450_140cd750bba9870f18aada2478b24840a/9hanj8a4nhlcktim19j90fh3mqu6onwe.jpg', '/шт', 10, 30),
(151, 'Газовый котел настенного типа Baxi ECO-4s 24F', NULL, 'Baxi', 67200, 'https://rndelectro.ru/upload/resize_cache/iblock/133/450_450_140cd750bba9870f18aada2478b24840a/vcxwhffdn8tk7cvm8nl3cepm2bi4z1nw.jpg', '/шт', 10, 30),
(152, 'Настенный газовый котел Federica Bugatti 24 VARME 1 контур', 'Газовый настенный 1-контурный котел Federica Bugatti VARME 24B с ЖК дисплеем  - это сплав технологий, традиционного итальянского качества и уникального дизайна от известного производителя.\r\nБлагодаря своим компактным размерам подойдут практически для всех помещений.\r\nДесять степеней защиты обеспечат бесперебойную работу и долговечность.\r\nЖК - дисплей удобен в эксплуатации, отображает все необходимые параметры и текущее состояние котла.\r\nЛинейка настенных газовых котлов FEDERICA BUGATTI - это современные, стильные и надежные агрегаты.\r\nПо умолчанию котел работает на природном магистральном газе, но при необходимости котел можно переоборудовать для работы на сжиженном газе, для этого необходимо приобрести комплект жиклеров.\r\nВ своей конструкции котел отопления уже имеет циркуляционный насос Grundfos, поэтому необходимость в его приобретении отпадает.\r\nБлагодаря своим компактным размерам подойдут практически для всех помещений.', 'Federica', 59400, 'https://rndelectro.ru/upload/resize_cache/iblock/cf9/450_450_140cd750bba9870f18aada2478b24840a/507n4d906q1jmjgm04rbm6thz2j1k9rq.jpg', '/шт', 10, 30),
(153, 'Двухконтурный напольный газовый котел отопления КОВ-16СКВС Сигнал, серия \'S-TERM\' (до 160 кв.м)', 'Напольный газовый котел Сигнал КОВ-16 СКВс TGV - это двухконтурный отопительный котел, предназначенный для обеспечения комфортного тепла в вашем доме.\r\nМатериал первичного теплообменника - сталь, что обеспечивает долговечность и надежность работы котла. Материал вторичного теплообменника - медь, что гарантирует быстрый и эффективный нагрев воды.\r\nТип камеры сгорания - открытый, что позволяет использовать сжиженный газ. Управление котлом осуществляется механическим способом, что делает его удобным и простым в использовании.\r\nКотел обладает энергонезависимым режимом работы, что делает его независимым от наличия электричества. Максимальная тепловая мощность составляет 16 кВт, что позволяет отапливать помещения площадью до 160 кв. м.\r\nДиаметр дымохода составляет 100 мм, что обеспечивает хорошую тягу и эффективное удаление продуктов горения.\r\nНапольный газовый котел Сигнал КОВ-16 СКВс TGV оснащен фильтром для газа, что предотвращает попадание посторонних частиц в систему и обеспечивает стабильную работу котла.', 'Сигнал', 30645, 'https://rndelectro.ru/upload/resize_cache/iblock/cf0/450_450_140cd750bba9870f18aada2478b24840a/vb67hrpcmn22gg2h3ka0twl1bw41m6n4.jpg', '/шт', 10, 30),
(154, 'Сильфонная подводка для газа \'Gasfix\' (1/2\'х0.8 г/г)', NULL, 'Gasfix', 223.5, 'https://rndelectro.ru/upload/iblock/3fd/noofsqg3nm53nupxcteeuuqzqj54ha8e.jpg', '/шт', 10, 31),
(155, 'Сильфонная подводка для газа \'Gasfix\' (1/2\'х0.4 г/г)', NULL, 'Gasfix', 202.5, 'https://rndelectro.ru/upload/iblock/3fd/noofsqg3nm53nupxcteeuuqzqj54ha8e.jpg', '/шт', 10, 31),
(156, 'Сильфонная подводка для газа \'Gasfix\' (1/2\'х0.8 г/ш)', NULL, 'Gasfix', 213, 'https://rndelectro.ru/upload/iblock/3fd/noofsqg3nm53nupxcteeuuqzqj54ha8e.jpg', '/шт', 10, 31),
(157, 'Сильфонная подводка для газа \'Gasfix\' (1/2\'х0.3 г/ш)', NULL, 'Gasfix', 189.5, 'https://rndelectro.ru/upload/iblock/3fd/noofsqg3nm53nupxcteeuuqzqj54ha8e.jpg', '/шт', 10, 31),
(158, 'Микровыключатель для Газовой Колонки два провода без планки 4510', NULL, NULL, 90, 'https://rndelectro.ru/upload/resize_cache/iblock/806/450_450_140cd750bba9870f18aada2478b24840a/oa5ljp41iruu17o9aej1o7c83uebszng.jpg', '/шт', 10, 32),
(159, 'Запальник Данко для настенных котлов', NULL, NULL, 150, 'https://rndelectro.ru/upload/iblock/672/dkhkijyx0t27mzu44c57lin5h6ia22u7.jpg', '/шт', 10, 32),
(160, 'Микровыключатель для газовой колонки три провода без планки J0031', NULL, NULL, 120, 'https://rndelectro.ru/upload/resize_cache/iblock/c9f/450_450_140cd750bba9870f18aada2478b24840a/qvz6b59erxqjnjeghr5kamfk6ja0xcef.jpg', '/шт', 10, 32),
(161, 'Пневмореле для котла белые', NULL, NULL, 1162.5, 'https://rndelectro.ru/upload/iblock/a5c/9tv7anpjv9g6p0s30via0ov8hcca01yo.jpg', '/шт', 10, 32);

-- --------------------------------------------------------

--
-- Структура таблицы `podcategory`
--

CREATE TABLE `podcategory` (
  `podcategory_id` int(10) UNSIGNED NOT NULL,
  `podcategory_name` varchar(255) DEFAULT NULL,
  `podcategory_affiliation` int(11) DEFAULT NULL,
  `podcategory_image` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `podcategory`
--

INSERT INTO `podcategory` (`podcategory_id`, `podcategory_name`, `podcategory_affiliation`, `podcategory_image`) VALUES
(1, 'Кабели и провода', 1, 'https://rndelectro.ru/upload/iblock/e8e/e8e510e9a8ac6aea3ca188b795d2dd42.jpg'),
(2, 'Электроустановочные изделия', 1, 'https://rndelectro.ru/upload/iblock/52c/52c93532878eed282e7fa77e423be385.jpg'),
(3, 'Материалы для электромонтажа', 1, 'https://rndelectro.ru/upload/iblock/8c2/8c2e909b5e958b2fcb6ddb5b23240130.jpg'),
(4, 'Щитовое оборудование', 1, 'https://rndelectro.ru/upload/iblock/127/127bd4a5336b4aa25eaf5ca79aa853b6.png'),
(5, 'Канализация', 2, 'https://rndelectro.ru/upload/iblock/781/781a1aea8bd1dc820dcc046e852a9330.jpg'),
(6, 'Арматура', 2, 'https://rndelectro.ru/upload/iblock/3ff/3ff71d146fc15ee84e16bcf08bde9603.jpg'),
(7, 'Хомут', 2, NULL),
(8, 'Аэрозоль', 9, NULL),
(9, 'Грунт 3 в 1', 9, NULL),
(10, 'Эмали', 9, NULL),
(11, 'Светодиодные лампы', 3, 'https://rndelectro.ru/upload/iblock/e4c/gf206vbv8ygasvhm5zkxv2b1e1i36dcp.jpg'),
(12, 'Светодиодные ленты', 3, 'https://rndelectro.ru/upload/iblock/efc/c1mvxbi8wseczkteco3j2hxehox8u63f.jpeg'),
(13, 'Светодиодные прожектора', 3, 'https://rndelectro.ru/upload/iblock/712/ushv3kgsz8kze7no7b3e9jr0chucz3xj.jpeg'),
(14, 'Настольные светильники', 3, 'https://rndelectro.ru/upload/iblock/531/gqxg4k3pym39h020tz6pjsr1rihnbzp1.jpg'),
(15, 'Светильники потолочные', 3, NULL),
(16, 'Светильники линейные', 3, 'https://rndelectro.ru/upload/iblock/9a0/nm89cs5hn7cmzbzscq3cd0pd78433t32.jpeg'),
(17, 'Фонарики', 3, 'https://rndelectro.ru/upload/iblock/31b/zw3q4ucu9kku5k0sq0vj4xwrtrvlk8m1.jpg'),
(18, 'Электроинструмент', 4, 'https://rndelectro.ru/upload/iblock/b8c/xnz9d3fujzbfs4j18cudvmnh01d87mpz.jpg'),
(19, 'Ручные инструменты', 4, 'https://rndelectro.ru/upload/iblock/213/1utd0yt3ieyvdpxkseg7j1ndn210gtah.jpeg'),
(20, 'Инструмент сантехника', 4, NULL),
(21, 'Инструмент электромонтажный', 4, NULL),
(22, 'Лазерные уровни', 4, NULL),
(23, 'Перчатки респиратор', 5, 'https://rndelectro.ru/upload/iblock/330/33062ec9963f5653f7ed357f284b1727.jpg'),
(24, 'Маски сварочные', 5, NULL),
(25, 'SPYHEAT', 6, NULL),
(26, 'Warmeenergie', 6, NULL),
(27, 'ЧТК', 6, NULL),
(28, 'Смесители', 8, 'https://rndelectro.ru/upload/iblock/cf4/cf42e566c9fcb7859b6ebcea3604db2d.JPG'),
(29, 'Газовый счётчик', 10, NULL),
(30, 'Отопительные котлы', 10, NULL),
(31, 'Шланги для газа', 10, NULL),
(32, 'Запасные части к котлам', 10, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`) VALUES
(4, 'test24', 'test@test.test', 'testtest', '$2y$10$u3OPl4SN.hRLRMBKc4v9dO3a13LhRNgarUTifxXlNmN7NlMAYsFrS'),
(10, 'Elia', 'admin@admin.admin', '89653102250', '$2y$10$JOplh22HawyBaRuj9AoELeQ/avl6/.BMbI8TRFQO/LZiQ1IbzKop6'),
(16, 'Александр', 'test@test.xn--t5-nlc', '77898999998', '$2y$10$QSMQYN7pmg1pvwjD.ZZer.aI1J.WVE61qf07kQ4dHofv1SGBkFXbi'),
(19, 'Administrator', 'admin@mail.ru', '89608462050', '$2y$10$aTdD9EZAW3yc4WC3GPU5aOWKv2.2qrWgQpuCqXNQwKLoBz.MWlCoa'),
(20, 'Сандор Клиган', 'kligan@gmail.com', '89348013027', '$2y$10$TDhIr55QJSQhi/pQbEYy9ulNQyZtRc6IK.BZQgQ.cgXnM3/tNZgly'),
(21, 'Элеонора Марсовна Назырова', 'lolrylgyl@mail.ru', '89518462058', '$2y$10$Jq/wtcdTQ0YaoQaKgnvSmO1DtMnsYt9FJeZ4NQqvNCgw2x2jC2WSG'),
(22, 'Ирина Яковлева', 'gyilaw@mail.ru', '89465073035', '$2y$10$5TS233yXACUXc5OBgEuQ0ub3g3/fVJEScd/4tG.dktmUV9LXUlj4i'),
(23, 'Рена Макдон', 'ira.dvur.18052004@gmail.com', '79613108475', '$2y$10$/4dFjrNLCQf2CHyyO0kQ4.avjHX3Js5cxiNw52qqgEXonFovsDhom'),
(24, 'Дмитрий Жуков', 'dima2004.04@list.ru', '79896111355', '$2y$10$a2V2yijRWI7T4FFeecn2PutPYzo0zJK48NHBhttmYfW8b1Z8hG1xW'),
(25, 'Александр', 'polyakov.shura.04@yandex.ru', '79889975632', '$2y$10$Bojxdr15EzAjTap82BpsTus1.MejaY/C.wom7fBBbKI6PB5b1VFtK');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`good_id`);

--
-- Индексы таблицы `podcategory`
--
ALTER TABLE `podcategory`
  ADD PRIMARY KEY (`podcategory_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1510;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `good_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT для таблицы `podcategory`
--
ALTER TABLE `podcategory`
  MODIFY `podcategory_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
