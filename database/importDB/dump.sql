-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 34.175.127.145:3306
-- Temps de generació: 08-03-2023 a les 11:15:05
-- Versió del servidor: 8.0.26-google
-- Versió de PHP: 8.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `isphero_front_dev`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `article`
--

CREATE TABLE `article` (
  `id` bigint NOT NULL,
  `value_property` varchar(255) DEFAULT NULL,
  `article_father_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `property_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `article`
--

INSERT INTO `article` (`id`, `value_property`, `article_father_id`, `product_id`, `property_id`) VALUES
(1, '.es', NULL, 1, 1),
(2, '.com', NULL, 2, 1),
(3, '.tv', NULL, 3, 1),
(4, '.cat', NULL, 4, 1),
(5, '10', NULL, 1, 2),
(6, '20.5', NULL, 2, 2),
(7, '0.50', NULL, 3, 2),
(8, '30', NULL, 4, 2),
(9, '20', NULL, 1, 3),
(10, '40', NULL, 2, 3),
(11, '10', NULL, 3, 3),
(12, '60', NULL, 4, 3),
(13, '10', NULL, 5, 2),
(14, '1', NULL, 5, 4),
(15, '25', NULL, 5, 5),
(16, '35', NULL, 6, 2),
(17, '5', NULL, 6, 4),
(18, '50', NULL, 6, 5),
(19, '.de', NULL, 8, 1),
(20, '.org', NULL, 9, 1),
(21, '8', NULL, 8, 2),
(22, '15', NULL, 9, 2),
(23, '16', NULL, 8, 3),
(24, '30', NULL, 9, 3),
(25, '1', NULL, 10, 6),
(26, '5', NULL, 11, 6),
(27, '99', NULL, 10, 2),
(28, '199', NULL, 11, 2);

-- --------------------------------------------------------

--
-- Estructura de la taula `article_domains`
--

CREATE TABLE `article_domains` (
  `tlds_id` bigint NOT NULL,
  `domains_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `article_domains`
--

INSERT INTO `article_domains` (`tlds_id`, `domains_id`) VALUES
(2, 16),
(2, 23),
(3, 12),
(3, 13),
(3, 22),
(3, 25),
(4, 15),
(4, 18),
(4, 24),
(4, 25),
(4, 12),
(4, 26),
(4, 27),
(4, 28),
(1, 11),
(1, 12),
(1, 14),
(1, 17),
(1, 19),
(1, 20),
(1, 21),
(1, 29);

-- --------------------------------------------------------

--
-- Estructura de la taula `category`
--

CREATE TABLE `category` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_father_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `category`
--

INSERT INTO `category` (`id`, `name`, `category_father_id`) VALUES
(1, 'domain', NULL),
(2, 'host', NULL),
(3, 'mail', NULL);

-- --------------------------------------------------------

--
-- Estructura de la taula `category_categories_children`
--

CREATE TABLE `category_categories_children` (
  `category_id` bigint NOT NULL,
  `categories_children_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `domain_registered`
--

CREATE TABLE `domain_registered` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `domain_registered`
--

INSERT INTO `domain_registered` (`id`, `name`) VALUES
(11, 'nofre.es'),
(12, 'nofre'),
(13, 'marti'),
(14, 'ffqwed'),
(15, 'ultimahora'),
(16, 'joquese2'),
(17, 'cas'),
(18, 'esundomini'),
(19, 'nofe'),
(20, 'midominio'),
(21, 'sdgdsf'),
(22, 'hghghg'),
(23, 'holatomeuy'),
(24, 'barar'),
(25, 'asdasd'),
(26, 'hahaha'),
(27, 'loquesigui'),
(28, 'joan'),
(29, 'hola');

-- --------------------------------------------------------

--
-- Estructura de la taula `invoice`
--

CREATE TABLE `invoice` (
  `id` bigint NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `date_buy` datetime(6) DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `invoice`
--

INSERT INTO `invoice` (`id`, `full_name`, `user_id`, `date_buy`, `total`) VALUES
(29, 'factura nofreruizsalom', 103, '2023-02-23 11:05:02.248248', 10),
(30, 'factura alexanderwitt97', 108, '2023-02-24 09:19:24.400163', 99),
(33, 'Factura-24-02-2023', 19, '2023-02-24 10:39:39.919014', 274),
(34, 'Factura-24-02-2023', 19, '2023-02-24 10:50:26.944775', 164),
(35, 'Factura-24-02-2023', 19, '2023-02-24 10:53:14.939752', 70),
(36, 'Factura-24-02-2023', 1, '2023-02-24 12:00:57.797336', 264),
(37, 'factura awitt15316', 109, '2023-02-27 09:25:59.557976', NULL),
(38, 'Factura-27-02-2023', 19, '2023-02-27 11:16:53.412597', 0.5),
(39, 'Factura-27-02-2023', 19, '2023-02-27 12:13:20.833641', 10),
(40, 'Factura-02-03-2023', 110, '2023-03-02 07:51:44.998501', 159),
(41, 'Factura-03-03-2023', 108, '2023-03-03 18:54:47.041860', 30),
(42, 'Factura-07-03-2023', 113, '2023-03-07 10:57:02.233274', 20);

-- --------------------------------------------------------

--
-- Estructura de la taula `invoice_line`
--

CREATE TABLE `invoice_line` (
  `id` bigint NOT NULL,
  `name_article` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `vat` varchar(255) DEFAULT NULL,
  `invoice_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `invoice_line`
--

INSERT INTO `invoice_line` (`id`, `name_article`, `price`, `quantity`, `vat`, `invoice_id`) VALUES
(39, 'null', '10', '1 ', '21 ', 29),
(40, 'nofe.es', '10', '1 ', '21 ', 29),
(41, 'midominio.es', '20', '1 ', '21 ', 30),
(42, 'null', '35', '1 ', '21 ', 30),
(43, 'null', '99', '1 ', '21 ', 30),
(46, 'holatomeuy.com', '40', '1 ', '21 ', 33),
(47, 'null', '199', '1 ', '21 ', 33),
(48, 'null', '35', '1 ', '21 ', 33),
(49, '.cat', '30', '1 ', '21 ', 34),
(50, 'single', '99', '1 ', '21 ', 34),
(51, 'advanced', '35', '1 ', '21 ', 34),
(52, 'host', '10', '1 ', '21 ', 35),
(53, 'domain', '60', '1 ', '21 ', 35),
(54, 'domain', '30', '1 ', '21 ', 36),
(55, 'host', '35', '1 ', '21 ', 36),
(56, 'mail', '199', '1 ', '21 ', 36),
(57, 'null', '10', '1 ', '21 ', 37),
(58, 'hahaha.cat', '30', '1 ', '21 ', 37),
(59, 'domain', '0.50', '1 ', '21 ', 38),
(60, 'host', '10', '1 ', '21 ', 39),
(61, 'mail', '99', '1 ', '21 ', 40),
(62, 'domain', '60', '1 ', '21 ', 40),
(63, 'domain', '30', '1 ', '21 ', 41),
(64, 'domain', '20', '1 ', '21 ', 42);

-- --------------------------------------------------------

--
-- Estructura de la taula `key_text`
--

CREATE TABLE `key_text` (
  `id` bigint NOT NULL,
  `text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `key_text`
--

INSERT INTO `key_text` (`id`, `text`) VALUES
(1, 'header.about'),
(2, 'header.contact'),
(3, 'header.account'),
(4, 'header.cart'),
(5, 'footer.aboutUs'),
(6, 'footer.aboutUsText'),
(7, 'footer.privacyPolicy'),
(8, 'footer.termsOfService'),
(9, 'footer.cookiePolicy'),
(10, 'main.findDomain'),
(11, 'main.searchAndBuy'),
(12, 'main.freeDomain'),
(13, 'main.findDomainText'),
(14, 'main.searchButton'),
(15, 'main.card1Title'),
(16, 'main.card1Text'),
(17, 'main.card2Title'),
(18, 'main.card2Text'),
(19, 'main.card3Title'),
(20, 'main.card3Text'),
(21, 'main.subscribe'),
(22, 'main.subscribeText'),
(23, 'main.subscribeBar'),
(24, 'main.subscribeButton'),
(25, 'main.success'),
(26, 'main.error'),
(27, 'main.error2'),
(28, 'main.errorDomain'),
(29, 'about.aboutUs'),
(30, 'about.aboutUsText'),
(31, 'about.ourBusiness'),
(32, 'about.ourBusinessText'),
(33, 'about.contactUs'),
(34, 'about.contactUsTextp1'),
(35, 'about.contactUsTextp2'),
(36, 'about.contactUsTextp3'),
(37, 'about.ourTeam'),
(38, 'about.founder'),
(39, 'contact.text'),
(40, 'contact.ourLocation'),
(41, 'contact.message'),
(42, 'contact.send'),
(43, 'contact.ourLocationText'),
(44, 'contact.ourHours'),
(45, 'main.flexText'),
(46, 'main.flexp1'),
(47, 'main.flexp2'),
(48, 'main.flexp3'),
(49, 'main.domainsRegistered'),
(50, 'main.clientsServed'),
(51, 'main.serversOnline'),
(52, 'main.collaborators'),
(53, 'header.language'),
(54, 'account.welcomeBack'),
(55, 'account.home'),
(56, 'account.account'),
(57, 'account.invoices'),
(58, 'account.waiting'),
(59, 'account.yourServices'),
(60, 'account.expiryDate'),
(61, 'account.active'),
(62, 'account.deleteBtn'),
(63, 'account.no'),
(64, 'account.yes'),
(65, 'account.personalInfo'),
(66, 'account.firstName'),
(67, 'account.lastName'),
(68, 'account.lastName2'),
(69, 'account.email'),
(70, 'account.country'),
(71, 'account.chooseCountry'),
(72, 'account.city'),
(73, 'account.address'),
(74, 'account.postalCode'),
(75, 'account.editBtn'),
(76, 'account.saveBtn'),
(77, 'account.cancelBtn'),
(78, 'account.changePassword'),
(79, 'account.oldPassword'),
(80, 'account.newPassword'),
(81, 'account.confirmPassword'),
(82, 'account.changePasswordBtn'),
(83, 'account.paymentInfo'),
(84, 'account.noWaitingList'),
(85, 'account.noServices'),
(86, 'domain.tld1'),
(87, 'domain.tld2'),
(88, 'domain.tld3'),
(89, 'domain.tld4'),
(90, 'domain.tld5'),
(91, 'domain.tld6'),
(92, 'info.technical'),
(93, 'info.text1'),
(94, 'info.cp'),
(95, 'info.text2'),
(96, 'info.support'),
(97, 'info.text3'),
(98, 'info.learn'),
(99, 'mail.header'),
(100, 'mail.single'),
(101, 'mail.single.desc'),
(102, 'mail.single.adv1'),
(103, 'mail.single.adv2'),
(104, 'mail.single.adv3'),
(105, 'mail.single.adv4'),
(106, 'mail.single.adv5'),
(107, 'product.year'),
(108, 'product.addtocart'),
(109, 'mail.prof'),
(110, 'mail.prof.desc'),
(111, 'mail.prof.adv1'),
(112, 'mail.prof.adv2'),
(113, 'mail.prof.adv3'),
(114, 'mail.prof.adv4'),
(115, 'mail.prof.adv5'),
(116, 'host.header1'),
(117, 'host.header2'),
(118, 'host.header3'),
(119, 'host.basic'),
(120, 'host.basic.desc'),
(121, 'host.basic.adv1'),
(122, 'host.basic.adv2'),
(123, 'host.basic.adv3'),
(124, 'host.freetraffic'),
(125, 'host.capacity'),
(126, 'host.adv'),
(127, 'host.adv.desc'),
(128, 'host.adv.adv1'),
(129, 'host.adv.adv2'),
(130, 'host.adv.adv3'),
(131, 'contact.name'),
(132, 'contact.phname'),
(133, 'contact.phmail'),
(134, 'username'),
(135, 'password'),
(136, 'login'),
(137, 'register'),
(138, 'login.google'),
(139, 'login.fb'),
(140, 'login.forgot'),
(141, 'cart.empty'),
(142, 'cart.message'),
(143, 'cart.continue'),
(144, 'repeatpw'),
(145, 'register.already'),
(146, 'register.login'),
(147, 'register.registered'),
(148, 'register.sent1'),
(149, 'register.sent2'),
(150, 'homepage'),
(151, 'registernow'),
(152, 'from'),
(153, 'cart.personal1'),
(154, 'cart.personal2'),
(155, 'cart.logged'),
(156, 'cart.duration'),
(157, 'cart.addtolist'),
(158, 'cart.deletefromlist'),
(159, 'domain.choose'),
(160, 'domain.domain'),
(161, 'hosting.hosting'),
(162, 'cart.youhave'),
(163, 'cart.items'),
(164, 'product.tooltip'),
(165, 'cart.summary');

-- --------------------------------------------------------

--
-- Estructura de la taula `lang`
--

CREATE TABLE `lang` (
  `code` varchar(255) NOT NULL,
  `name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `lang`
--

INSERT INTO `lang` (`code`, `name`) VALUES
('ar', 'العربية'),
('de', 'Deutsch'),
('en', 'English'),
('es', 'Español'),
('fr', 'Français'),
('jp', '日本語'),
('kr', '한국인');

-- --------------------------------------------------------

--
-- Estructura de la taula `news_letter`
--

CREATE TABLE `news_letter` (
  `id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `news_letter`
--

INSERT INTO `news_letter` (`id`, `email`) VALUES
(26, 'nofre@gmail.com'),
(28, 'mariadelcarme64@gmail.com'),
(53, 'wbarker@outlook.com'),
(55, 'tfinniga@att.net'),
(56, 'unreal@icloud.com'),
(60, 'thassine@msn.com'),
(61, 'staffelb@outlook.com'),
(62, 'tmccarth@comcast.net'),
(63, 'yamla@live.com'),
(64, 'jandrese@mac.com'),
(66, 'schumer@sbcglobal.net'),
(67, 'stern@yahoo.ca'),
(68, 'tbmaddux@verizon.net'),
(69, 'jbearp@aol.com'),
(70, 'shrapnull@aol.com'),
(71, 'engelen@comcast.net'),
(72, 'tedrlord@optonline.net'),
(73, 'wojciech@yahoo.ca'),
(74, 'matloff@gmail.com'),
(77, 'djupedal@sbcglobal.net'),
(81, 'cgreuter@live.com'),
(82, 'flavell@live.com'),
(83, 'leocharre@yahoo.com'),
(84, 'martyloo@msn.com'),
(85, 'parents@gmail.com'),
(86, 'doormat@yahoo.com'),
(87, 'johnbob@yahoo.ca'),
(88, 'maratb@outlook.com'),
(89, 'ehood@comcast.net');

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int UNSIGNED NOT NULL,
  `dbase` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `col_length` text CHARACTER SET utf8 COLLATE utf8_bin,
  `col_collation` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `col_default` text CHARACTER SET utf8 COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int UNSIGNED NOT NULL,
  `db_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `settings_data` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Bolcament de dades per a la taula `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('Nofre', '{\"relation_lines\":\"true\",\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `template_data` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tables` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tables` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Bolcament de dades per a la taula `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('Alex', '[{\"db\":\"isphero_front_dev\",\"table\":\"invoice\"},{\"db\":\"isphero_front_dev\",\"table\":\"lang\"},{\"db\":\"isphero_front_dev\",\"table\":\"translate_page\"},{\"db\":\"isphero_front_dev\",\"table\":\"key_text\"},{\"db\":\"isphero_front_dev\",\"table\":\"invoice_line\"},{\"db\":\"isphero_front_dev\",\"table\":\"domain_registered\"},{\"db\":\"isphero_front_dev\",\"table\":\"category_categories_children\"},{\"db\":\"isphero_front_dev\",\"table\":\"article_domains\"},{\"db\":\"isphero_front_dev\",\"table\":\"article\"},{\"db\":\"isphero_front_dev\",\"table\":\"category\"}]'),
('Nofre', '[{\"db\":\"isphero_front_dev\",\"table\":\"user\"},{\"db\":\"isphero_front_dev\",\"table\":\"product\"},{\"db\":\"isphero_front_dev\",\"table\":\"profile_img\"},{\"db\":\"isphero_front_dev\",\"table\":\"user_data\"},{\"db\":\"isphero_front_dev\",\"table\":\"key_text\"},{\"db\":\"isphero_front_dev\",\"table\":\"translate_page\"},{\"db\":\"isphero_front_dev\",\"table\":\"lang\"}]');

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `prefs` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `version` int UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `schema_sql` text CHARACTER SET utf8 COLLATE utf8_bin,
  `data_sql` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Bolcament de dades per a la taula `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('Alex', '2023-03-07 14:20:11', '{\"lang\":\"es\",\"Console\\/Mode\":\"collapse\"}'),
('Nofre', '2023-03-08 11:13:54', '{\"Console\\/Mode\":\"collapse\",\"Server\\/hide_db\":\"\",\"Server\\/only_db\":\"\",\"lang\":\"ca\"}');

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

-- --------------------------------------------------------

--
-- Estructura de la taula `product`
--

CREATE TABLE `product` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `product`
--

INSERT INTO `product` (`id`, `name`, `category_id`) VALUES
(1, '.es', 1),
(2, '.com', 1),
(3, '.tv', 1),
(4, '.cat', 1),
(5, 'basic', 2),
(6, 'advanced', 2),
(8, '.de', 1),
(9, '.org', 1),
(10, 'single', 3),
(11, 'professional', 3);

-- --------------------------------------------------------

--
-- Estructura de la taula `product_articles`
--

CREATE TABLE `product_articles` (
  `product_id` bigint NOT NULL,
  `articles_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `profile_img`
--

CREATE TABLE `profile_img` (
  `id` bigint NOT NULL,
  `img` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `user_id` bigint DEFAULT NULL,
  `format` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Bolcament de dades per a la taula `profile_img`
--

INSERT INTO `profile_img` (`id`, `img`, `user_id`, `format`) VALUES
(4, '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', 29, 'image/jpeg');
INSERT INTO `profile_img` (`id`, `img`, `user_id`, `format`) VALUES
(5, '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', 1, 'image/jpeg');

-- --------------------------------------------------------

--
-- Estructura de la taula `property`
--

CREATE TABLE `property` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `property`
--

INSERT INTO `property` (`id`, `name`, `type`) VALUES
(1, 'tld', 'String'),
(2, 'price1year', 'float'),
(3, 'price2year', 'float'),
(4, 'capacity', 'float'),
(5, 'traffic', 'float'),
(6, 'accounts', 'int');

-- --------------------------------------------------------

--
-- Estructura de la taula `service`
--

CREATE TABLE `service` (
  `id` bigint NOT NULL,
  `date_expired` datetime(6) DEFAULT NULL,
  `is_cancelled` bit(1) NOT NULL,
  `name_domain` varchar(255) DEFAULT NULL,
  `article_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `service`
--

INSERT INTO `service` (`id`, `date_expired`, `is_cancelled`, `name_domain`, `article_id`, `user_id`) VALUES
(1, '2023-03-01 10:08:28.000000', b'0', 'hola.es', 1, 1),
(2, '2023-03-01 10:12:00.000000', b'0', 'hola.com', 2, 1),
(9, '2024-01-31 09:42:49.123373', b'0', 'nofre', 3, 1),
(10, '2024-02-02 10:49:52.996530', b'0', 'hola.cat', 4, 1),
(11, '2024-02-02 10:50:15.531930', b'1', 'hola.cat', 4, 1),
(12, '2024-02-02 10:50:15.555723', b'0', 'adeu.com', 2, 1),
(13, '2024-02-02 10:57:07.005286', b'0', 'hola.cat', 4, 1),
(14, '2024-02-02 10:57:21.069539', b'0', 'hola.tv', 3, 1),
(15, '2024-02-02 11:07:39.475784', b'0', 'cada.es', 1, 1),
(17, '2024-02-06 14:19:18.990987', b'0', 'ucfniusdf', 2, 44),
(18, '2024-02-08 16:04:28.000000', b'0', '6969', 2, 69),
(23, '2024-02-10 12:25:06.143377', b'0', 'hola', 13, 1),
(24, '2024-02-10 12:25:06.179996', b'0', 'hola', 1, 1),
(25, '2024-02-10 12:25:06.203810', b'0', 'nofre', 4, 1),
(26, '2024-02-10 12:25:06.229364', b'0', 'hola.cat', 16, 1),
(27, '2024-02-10 12:26:04.589164', b'0', 'patata', 3, 1),
(28, '2024-02-10 12:33:13.759819', b'0', 'hola.es', 13, 1),
(29, '2023-01-10 13:22:03.803000', b'1', 'nofre', 13, 29),
(30, '2024-02-10 13:22:03.841464', b'0', 'nofre', 1, 29),
(31, '2024-02-10 13:26:16.549731', b'0', 'nofre', 1, 29),
(32, '2024-02-10 13:28:13.617462', b'0', 'nofre', 3, 29),
(33, '2024-02-10 13:36:46.552531', b'0', 'nofre', 1, 29),
(34, '2024-02-10 13:40:24.802469', b'0', 'nofre', 16, 29),
(35, '2024-02-10 13:40:24.827759', b'0', 'marti', 16, 29),
(36, '2024-02-10 13:40:24.853084', b'0', 'marti', 3, 29),
(52, '2025-02-24 09:19:24.340843', b'0', 'midominio', 1, 108),
(53, '2024-02-24 09:19:24.354901', b'0', 'midominio', 16, 108),
(54, '2024-02-24 09:19:24.368221', b'0', 'midominio', 25, 108),
(57, '2025-02-24 10:39:39.763971', b'0', 'holatomeuy', 2, 19),
(58, '2024-02-24 10:39:39.821625', b'0', 'holatomeuy', 26, 19),
(59, '2024-02-24 10:39:39.854253', b'0', 'holatomeuy', 16, 19),
(60, '2024-02-24 10:50:26.802576', b'0', 'barar', 4, 19),
(61, '2024-02-24 10:50:26.853615', b'0', 'barar', 25, 19),
(62, '2024-02-24 10:50:26.883511', b'0', 'barar', 16, 19),
(63, '2024-02-24 10:53:14.828067', b'0', 'asdasd', 13, 19),
(64, '2025-02-24 10:53:14.879151', b'0', 'asdasd', 4, 19),
(65, '2024-02-24 12:00:57.682923', b'0', 'nofre', 4, 1),
(66, '2024-02-24 12:00:57.719243', b'0', 'nofre', 16, 1),
(67, '2024-02-24 12:00:57.744794', b'0', 'nofre', 26, 1),
(68, '2024-02-27 09:25:59.510490', b'0', 'hahaha', 13, 109),
(69, '2024-02-27 09:25:59.547030', b'0', 'hahaha', 4, 109),
(70, '2024-02-27 11:16:53.373634', b'0', 'asdasd', 3, 19),
(71, '2024-02-27 12:13:20.795693', b'0', 'holatomeuy', 13, 19),
(72, '2024-03-02 07:51:44.981518', b'0', 'loquesigui', 25, 110),
(73, '2025-03-02 07:51:44.993501', b'0', 'loquesigui', 4, 110),
(74, '2024-03-03 18:54:46.982191', b'0', 'joan', 4, 108),
(75, '2025-03-07 10:57:02.221332', b'0', 'hola', 1, 113);

-- --------------------------------------------------------

--
-- Estructura de la taula `todo`
--

CREATE TABLE `todo` (
  `id` int NOT NULL,
  `task` varchar(255) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Small todo list for Quasar Dashboard';

--
-- Bolcament de dades per a la taula `todo`
--

INSERT INTO `todo` (`id`, `task`, `completed`) VALUES
(1, 'Create dashboard', 0),
(2, 'Test Task', 1),
(3, 'Test task', 0),
(4, 'NOT COMPLETED', 1),
(5, 'Not cpmleert', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `translate_category`
--

CREATE TABLE `translate_category` (
  `id` bigint NOT NULL,
  `translation` varchar(255) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `lang_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `translate_page`
--

CREATE TABLE `translate_page` (
  `id` bigint NOT NULL,
  `translate` text,
  `key_text_id` bigint DEFAULT NULL,
  `lang_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `translate_page`
--

INSERT INTO `translate_page` (`id`, `translate`, `key_text_id`, `lang_code`) VALUES
(36, 'About', 1, 'en'),
(37, 'Contact', 2, 'en'),
(38, 'Account', 3, 'en'),
(39, 'Cart', 4, 'en'),
(40, 'About Us', 5, 'en'),
(41, 'We are a small team of passionate individuals who are dedicated to providing the best service possible. We believe in honesty, transparency, and going above and beyond to make sure our customers are satisfied.', 6, 'en'),
(42, 'Privacy Policy', 7, 'en'),
(43, 'Terms of Service', 8, 'en'),
(44, 'Cookie Policy', 9, 'en'),
(45, 'Find domains', 10, 'en'),
(46, 'Search and buy', 11, 'en'),
(47, 'your free domain', 12, 'en'),
(48, 'Search for a domain name', 13, 'en'),
(49, 'Search', 14, 'en'),
(50, 'Domain Hosting', 15, 'en'),
(51, 'Keep your domain name safe and secure with our reliable hosting services. Our team of experts will help you find the perfect domain and keep it running smoothly.', 16, 'en'),
(52, 'We\'ve got you covered', 17, 'en'),
(53, 'Don\'t worry about any problems you may have. Our team of experts is here to help with any issue you may have', 18, 'en'),
(54, 'Why Choose us?', 19, 'en'),
(55, 'We offer the best prices and rates in the industry. Our team works hard to negotiate the best deals for our customers, ensuring that you get the best value for your money.', 20, 'en'),
(56, 'Subscribe to our newsletter', 21, 'en'),
(57, 'Get the latest news and updates from our team.', 22, 'en'),
(58, 'Enter email', 23, 'en'),
(59, 'Subscribe', 24, 'en'),
(60, 'Thank you for subscribing!', 25, 'en'),
(61, 'Please enter a valid email address.', 26, 'en'),
(62, 'You are already subscribed.', 27, 'en'),
(63, 'Please enter a valid email address.', 28, 'en'),
(64, 'About Us', 29, 'en'),
(65, 'We are a small team of passionate individuals who are dedicated to providing the best service possible. We believe in honesty, transparency, and going above and beyond to make sure our customers are satisfied.', 30, 'en'),
(66, 'Our business', 31, 'en'),
(67, 'Our business is focused on providing high-quality domain hosting services. We have been in the industry for over 10 years and have a reputation for reliability and excellent customer support.', 32, 'en'),
(68, 'Contact Us', 33, 'en'),
(69, 'We would love to hear from you! You can reach us by phone at (123) 456-7890 or by email at info@isphero.com.', 34, 'en'),
(70, 'Our office is located at 1820 NW 56th St', 35, 'en'),
(71, 'We are open Monday through Friday from 9:00 AM to 5:00 PM EST.', 36, 'en'),
(72, 'Our team', 37, 'en'),
(73, 'Founder of ISP Hero', 38, 'en'),
(74, 'We would love to hear from you! Please use the form below to send us a message.', 39, 'en'),
(75, 'Our Location', 40, 'en'),
(76, 'Message', 41, 'en'),
(77, 'Send message', 42, 'en'),
(78, 'Our office is located at 1820 NW 56th St', 43, 'en'),
(79, 'We are open Monday through Friday from 9:00 AM to 5:00 PM EST.', 44, 'en'),
(80, 'Your digital solutions', 45, 'en'),
(81, 'Sustainable and scalable', 46, 'en'),
(82, 'Safe and flexible', 47, 'en'),
(83, 'Competent and customizable', 48, 'en'),
(84, 'Domains registered', 49, 'en'),
(85, 'Clients served', 50, 'en'),
(86, 'Servers online', 51, 'en'),
(87, 'Collaborators', 52, 'en'),
(88, 'English', 53, 'en'),
(89, 'Welcome back ', 54, 'en'),
(90, 'Home', 55, 'en'),
(91, 'Profile', 56, 'en'),
(92, 'Invoices', 57, 'en'),
(93, 'Waiting', 58, 'en'),
(94, 'Your services', 59, 'en'),
(95, 'Expiry date', 60, 'en'),
(96, 'Active', 61, 'en'),
(97, 'Delete', 62, 'en'),
(98, 'No', 63, 'en'),
(99, 'Yes', 64, 'en'),
(100, 'Personal information', 65, 'en'),
(101, 'First name', 66, 'en'),
(102, 'Last name', 67, 'en'),
(103, '2nd last name', 68, 'en'),
(104, 'E-mail', 69, 'en'),
(105, 'Country', 70, 'en'),
(106, 'Choose country', 71, 'en'),
(107, 'City', 72, 'en'),
(108, 'Address', 73, 'en'),
(109, 'Postal code', 74, 'en'),
(110, 'Edit', 75, 'en'),
(111, 'Save', 76, 'en'),
(112, 'Cancel', 77, 'en'),
(113, 'Change password', 78, 'en'),
(114, 'Old password', 79, 'en'),
(115, 'New password', 80, 'en'),
(116, 'Confirm password', 81, 'en'),
(117, 'Change password', 82, 'en'),
(118, 'Payment information', 83, 'en'),
(119, 'You don\'t have any domain names you\'re waiting for.', 84, 'en'),
(120, 'You don\'t have any services.', 85, 'en'),
(121, 'Über uns', 1, 'de'),
(122, 'Kontakt', 2, 'de'),
(123, 'Konto', 3, 'de'),
(124, 'Wagen', 4, 'de'),
(125, 'Über uns', 5, 'de'),
(126, 'Wir sind ein kleines Team von leidenschaftlichen Menschen, die sich dafür einsetzen, den bestmöglichen Service zu bieten. Wir glauben an Ehrlichkeit, Transparenz und tun alles, um sicherzustellen, dass unsere Kunden zufrieden sind.', 6, 'de'),
(127, 'Datenschutz-Bestimmungen', 7, 'de'),
(128, 'Nutzungsbedingungen', 8, 'de'),
(129, 'Cookie-Richtlinie', 9, 'de'),
(130, 'Domain finden', 10, 'de'),
(131, 'Suchen', 11, 'de'),
(132, 'Sie ihre Domain', 12, 'de'),
(133, 'Suchen Sie nach einem Domainnamen', 13, 'de'),
(134, 'Suchen', 14, 'de'),
(135, 'Domain-Hosting', 15, 'de'),
(136, 'Schützen Sie Ihren Domainnamen mit unseren zuverlässigen Hosting-Services. Unser Expertenteam hilft Ihnen dabei, die perfekte Domain zu finden und für einen reibungslosen Betrieb zu sorgen.', 16, 'de'),
(137, 'Wir geben dir Deckung', 17, 'de'),
(138, 'Machen Sie sich keine Sorgen über eventuelle Probleme. Unser Expertenteam hilft Ihnen bei allen Problemen, ob groß oder klein.', 18, 'de'),
(139, 'Warum uns wählen?', 19, 'de'),
(140, 'Wir bieten die besten Preise und Tarife der Branche. Unser Team arbeitet hart daran, die besten Angebote für unsere Kunden auszuhandeln und sicherzustellen, dass Sie das beste Preis-Leistungs-Verhältnis erhalten.', 20, 'de'),
(141, 'Abonniere unseren Newsletter', 21, 'de'),
(142, 'Erhalten Sie die neuesten Nachrichten und Updates von unserem Team.', 22, 'de'),
(143, 'Geben Sie ihre E-Mail ein', 23, 'de'),
(144, 'Abonnieren', 24, 'de'),
(145, 'Danke für ihr Abonnement!', 25, 'de'),
(146, 'Bitte geben Sie eine gültige E-Mail ein.', 26, 'de'),
(147, 'Sie sind bereits abonniert.', 27, 'de'),
(148, 'Bitte geben Sie mindestens 3 Zeichen ein!', 28, 'de'),
(149, 'Über uns', 29, 'de'),
(150, 'Wir sind ein kleines Team von leidenschaftlichen Menschen, die sich dafür einsetzen, den bestmöglichen Service zu bieten. Wir glauben an Ehrlichkeit, Transparenz und tun alles, um sicherzustellen, dass unsere Kunden zufrieden sind.', 30, 'de'),
(151, 'Unser Geschäft', 31, 'de'),
(152, 'Unser Geschäft konzentriert sich auf die Bereitstellung hochwertiger Domain-Hosting-Dienste. Wir sind seit über 10 Jahren in der Branche tätig und haben einen guten Ruf für Zuverlässigkeit und exzellenten Kundensupport.', 32, 'de'),
(153, 'Kontaktieren Sie uns', 33, 'de'),
(154, 'Wir würden uns freuen, von Ihnen zu hören! Sie erreichen uns telefonisch unter (123) 456-7890 oder per E-Mail unter info@isphero.com.', 34, 'de'),
(155, 'Unser Büro befindet sich in 1820 NW 56th St, Miami, Florida (FL), 33142.', 35, 'de'),
(156, 'Wir sind von Montag bis Freitag von 9:00 bis 17:00 Uhr EST geöffnet.', 36, 'de'),
(157, 'Unser Team', 37, 'de'),
(158, 'Gründer von ISP Hero', 38, 'de'),
(159, 'Wir würden uns freuen, von Ihnen zu hören! Bitte verwenden Sie das folgende Formular, um uns eine Nachricht zu senden.', 39, 'de'),
(160, 'Unser Standort', 40, 'de'),
(161, 'Nachricht', 41, 'de'),
(162, 'Nachricht senden', 42, 'de'),
(163, 'Unser Büro befindet sich in 1820 NW 56th St, Miami, Florida (FL), 33142.', 43, 'de'),
(164, 'Wir sind von Montag bis Freitag von 9:00 bis 17:00 Uhr EST geöffnet.', 44, 'de'),
(165, 'Ihre digitalen Lösungen', 45, 'de'),
(166, 'Nachhaltig und skalierbar', 46, 'de'),
(167, 'Sicher und flexibel', 47, 'de'),
(168, 'Kompetent und individuell', 48, 'de'),
(169, 'Registrierte Domains', 49, 'de'),
(170, 'zufriedene Kunden', 50, 'de'),
(171, 'Servers online', 51, 'de'),
(172, 'Partner', 52, 'de'),
(173, 'Deutsch', 53, 'de'),
(174, 'Willkommen zurück', 54, 'de'),
(175, 'Startseite', 55, 'de'),
(176, 'Profil', 56, 'de'),
(177, 'Rechnungen', 57, 'de'),
(178, 'Wartend', 58, 'de'),
(179, 'Ihre Dienste', 59, 'de'),
(180, 'Ablaufdatum', 60, 'de'),
(181, 'Aktiv', 61, 'de'),
(182, 'Löschen', 62, 'de'),
(183, 'Nein', 63, 'de'),
(184, 'Ja', 64, 'de'),
(185, 'Persönliche Informationen', 65, 'de'),
(186, 'Vorname', 66, 'de'),
(187, 'Nachname', 67, 'de'),
(188, 'Zweiter Nachname', 68, 'de'),
(189, 'E-Mail', 69, 'de'),
(190, 'Land', 70, 'de'),
(191, 'Land wählen', 71, 'de'),
(192, 'Stadt', 72, 'de'),
(193, 'Adresse', 73, 'de'),
(194, 'Postleihzahl', 74, 'de'),
(195, 'Bearbeiten', 75, 'de'),
(196, 'Speichern', 76, 'de'),
(197, 'Abbrechen', 77, 'de'),
(198, 'Passwort ändern', 78, 'de'),
(199, 'Altes Passwort', 79, 'de'),
(200, 'Neues Passwort', 80, 'de'),
(201, 'Passwort bestätigen', 81, 'de'),
(202, 'Passwort ändern', 82, 'de'),
(203, 'Zahlungsinformationen', 83, 'de'),
(204, 'Sie haben keine Domänennamen, auf die Sie warten.', 84, 'de'),
(205, 'Sie haben noch keine Dienstleistungen', 85, 'de'),
(206, 'Sobre nosotros', 1, 'es'),
(207, 'Contacto', 2, 'es'),
(208, 'Cuenta', 3, 'es'),
(209, 'Carrito', 4, 'es'),
(210, 'Sobre nosotros', 5, 'es'),
(211, 'Somos un pequeño equipo de personas apasionadas que se dedican a brindar el mejor servicio posible. Creemos en la honestidad, la transparencia y en ir más allá para asegurarnos de que nuestros clientes están satisfechos.', 6, 'es'),
(212, 'Política de privacidad', 7, 'es'),
(213, 'Términos de servicio', 8, 'es'),
(214, 'Política de cookies', 9, 'es'),
(215, 'Buscar dominios', 10, 'es'),
(216, 'Busca y compra ', 11, 'es'),
(217, 'tu dominio libre', 12, 'es'),
(218, 'Busque un nombre de dominio o elija entre nuestros dominios destacados', 13, 'es'),
(219, 'Buscar', 14, 'es'),
(220, 'Alojamiento de Dominio', 15, 'es'),
(221, 'Mantenga su nombre de dominio seguro y protegido con nuestros servicios de alojamiento confiables. Nuestro equipo de expertos lo ayudará a encontrar el dominio perfecto y a mantenerlo funcionando sin problemas.', 16, 'es'),
(222, 'Lo tenemos cubierto', 17, 'es'),
(223, 'No te preocupes por los problemas que puedas tener. Nuestro equipo de expertos está aquí para ayudarlo con cualquier problema que pueda tener, grande o pequeño.', 18, 'es'),
(224, '¿Por qué elegirnos?', 19, 'es'),
(225, 'Ofrecemos los mejores precios y tarifas en la industria. Nuestro equipo trabaja arduamente para negociar las mejores ofertas para nuestros clientes, asegurándose de que obtenga el mejor valor por su dinero.', 20, 'es'),
(226, 'Suscríbete a nuestro boletín', 21, 'es'),
(227, 'Recibe las últimas noticias y actualizaciones de nuestro equipo.', 22, 'es'),
(228, 'Introduce su correo electrónico', 23, 'es'),
(229, 'Suscribir', 24, 'es'),
(230, '¡Gracias por su subscripción!', 25, 'es'),
(231, 'Por favor introduzca un correo válido.', 26, 'es'),
(232, 'Ya està suscrito.', 27, 'es'),
(233, 'Por favor introduzca como mínimo 3 caracteres!', 28, 'es'),
(234, 'Sobre nosotros', 29, 'es'),
(235, 'Somos un pequeño equipo de personas apasionadas que se dedican a brindar el mejor servicio posible. Creemos en la honestidad, la transparencia y en ir más allá para asegurarnos de que nuestros clientes están satisfechos.', 30, 'es'),
(236, 'Nuestro negocio', 31, 'es'),
(237, 'Nuestro negocio se centra en proporcionar servicios de alojamiento de dominios de alta calidad. Hemos estado en la industria durante más de 10 años y tenemos una reputación de confiabilidad y excelente atención al cliente.', 32, 'es'),
(238, 'Contacte con nosotros', 33, 'es'),
(239, '¡Nos encantaría saber de usted! Puede comunicarse con nosotros por teléfono al (123) 456-7890 o por correo electrónico a info@isphero.com.', 34, 'es'),
(240, 'Nuestra oficina está ubicada en 1820 NW 56th St, Miami, Florida (FL), 33142.', 35, 'es'),
(241, 'Estamos abiertos de lunes a viernes de 9:00 am a 5:00 pm EST.', 36, 'es'),
(242, 'Nuestro equipo', 37, 'es'),
(243, 'Fundador de ISP Hero', 38, 'es'),
(244, '¡Nos encantaría saber de usted! Utilice el siguiente formulario para enviarnos un mensaje.', 39, 'es'),
(245, 'Nuestra localición', 40, 'es'),
(246, 'Mensaje', 41, 'es'),
(247, 'Enviar mensaje', 42, 'es'),
(248, 'Nuestra oficina está ubicada en 1820 NW 56th St, Miami, Florida (FL), 33142.', 43, 'es'),
(249, 'Estamos abiertos de lunes a viernes de 9:00 am a 5:00 pm EST.', 44, 'es'),
(250, 'Sus resoluciones digitales', 45, 'es'),
(251, 'Sostenible y escalable', 46, 'es'),
(252, 'Seguro y flexible', 47, 'es'),
(253, 'Competente y personalizable', 48, 'es'),
(254, 'Dominios registrados', 49, 'es'),
(255, 'Clientes', 50, 'es'),
(256, 'Servidores', 51, 'es'),
(257, 'Colaboradores', 52, 'es'),
(258, 'Español', 53, 'es'),
(259, 'Bienvenido de nuevo', 54, 'es'),
(260, 'Inicio', 55, 'es'),
(261, 'Perfil', 56, 'es'),
(262, 'Facturas', 57, 'es'),
(263, 'Esperando', 58, 'es'),
(264, 'Tus servicios', 59, 'es'),
(265, 'Fecha de caducidad', 60, 'es'),
(266, 'Activo', 61, 'es'),
(267, 'Eliminar', 62, 'es'),
(268, 'No', 63, 'es'),
(269, 'Sí', 64, 'es'),
(270, 'Información personal', 65, 'es'),
(271, 'Nombre', 66, 'es'),
(272, 'Apellido', 67, 'es'),
(273, 'Segundo apellido', 68, 'es'),
(274, 'Correo electrónico', 69, 'es'),
(275, 'País', 70, 'es'),
(276, 'Elegir país', 71, 'es'),
(277, 'Ciudad', 72, 'es'),
(278, 'Dirección', 73, 'es'),
(279, 'Código postal', 74, 'es'),
(280, 'Editar', 75, 'es'),
(281, 'Guardar', 76, 'es'),
(282, 'Cancelar', 77, 'es'),
(283, 'Cambiar contraseña', 78, 'es'),
(284, 'Contraseña anterior', 79, 'es'),
(285, 'Nueva contraseña', 80, 'es'),
(286, 'Confirmar contraseña', 81, 'es'),
(287, 'Cambiar contraseña', 82, 'es'),
(288, 'Información de pago', 83, 'es'),
(289, 'No tiene ningún nombre de dominio que esté esperando.', 84, 'es'),
(290, 'Aún no tiene ningún servicio contratado.', 85, 'es'),
(291, 'À propos', 1, 'fr'),
(292, 'Contact', 2, 'fr'),
(293, 'Compte', 3, 'fr'),
(294, 'Panier', 4, 'fr'),
(295, 'À propos de nous', 5, 'fr'),
(296, 'Nous sommes une petite équipe de personnes passionnées qui se consacrent à fournir le meilleur service possible. Nous croyons en l\'honnêteté, la transparence et allons au-delà pour nous assurer que nos clients sont satisfaits.', 6, 'fr'),
(297, 'Politique de confidentialité', 7, 'fr'),
(298, 'Conditions d\'utilisation', 8, 'fr'),
(299, 'Politique relative aux cookies', 9, 'fr'),
(300, 'Trouver nom de domaine', 10, 'fr'),
(301, 'Trouvez', 11, 'fr'),
(302, 'ta domain livre', 12, 'fr'),
(303, 'Recherchez un nom de domaine', 13, 'fr'),
(304, 'Rechercher', 14, 'fr'),
(305, 'Hébergement de domaine', 15, 'fr'),
(306, 'Gardez votre nom de domaine en toute sécurité grâce à nos services d\'hébergement fiables. Notre équipe d\'experts vous aidera à trouver le domaine parfait et à assurer son bon fonctionnement.', 16, 'fr'),
(307, 'Nous avons ce qu\'il vous faut', 17, 'fr'),
(308, 'Ne vous inquiétez pas des problèmes que vous pourriez avoir. Notre équipe d\'experts est là pour vous aider avec n\'importe quel problème que vous pourriez avoir, petit ou grand.', 18, 'fr'),
(309, 'Pourquoi nous choisir ?', 19, 'fr'),
(310, 'Nous offrons les meilleurs prix et tarifs du secteur. Notre équipe travaille dur pour négocier les meilleures offres pour nos clients, en veillant à ce que vous obteniez le meilleur rapport qualité-prix.', 20, 'fr'),
(311, 'Inscrivez-vous à notre newsletter', 21, 'fr'),
(312, 'Recevez les dernières nouvelles et mises à jour de notre équipe.', 22, 'fr'),
(313, 'Entrez votre adresse e-mail', 23, 'fr'),
(314, 'S\'abonner', 24, 'fr'),
(315, 'Merci de vous être abonné !', 25, 'fr'),
(316, 'Veuillez saisir une adresse e-mail valide.', 26, 'fr'),
(317, 'Vous êtes déjà abonné.', 27, 'fr'),
(318, 'Veuillez entrer au moins 3 caractères !', 28, 'fr'),
(319, 'À propos de nous', 29, 'fr'),
(320, 'Nous sommes une petite équipe de personnes passionnées qui se consacrent à fournir le meilleur service possible. Nous croyons en l\'honnêteté, la transparence et allons au-delà pour nous assurer que nos clients sont satisfaits.', 30, 'fr'),
(321, 'Notre affaire', 31, 'fr'),
(322, 'Notre activité se concentre sur la fourniture de services d\'hébergement de domaine de haute qualité. Nous sommes dans l\'industrie depuis plus de 10 ans et sommes reputes pour notre fiabilité et notre excellent service client.', 32, 'fr'),
(323, 'Contactez avec nous', 33, 'fr'),
(324, 'Nous aimerions avoir de vos nouvelles ! Vous pouvez nous joindre par telephone au (123) 456-7890 ou par courriel à info@isphero.com.', 34, 'fr'),
(325, 'Notre bureau est situé au 1820 NW 56th St, Miami, Floride (FL), 33142.', 35, 'fr'),
(326, 'Nous sommes ouverts du lundi au vendredi de 9 h à 17 h HNE. de ISP Hero', 36, 'fr'),
(327, 'Notre equipe', 37, 'fr'),
(328, 'Fondateur de ISP Hero', 38, 'fr'),
(329, 'Nous aimerions avoir de vos nouvelles ! Veuillez utiliser le formulaire ci-dessous pour nous envoyer un message.', 39, 'fr'),
(330, 'Notre localisation', 40, 'fr'),
(331, 'Message', 41, 'fr'),
(332, 'Envoyer message', 42, 'fr'),
(333, 'Notre bureau est situé au 1820 NW 56th St, Miami, Floride (FL), 33142.', 43, 'fr'),
(334, 'Nous sommes ouverts du lundi au vendredi de 9h00 à 17h00 HNE.', 44, 'fr'),
(335, 'Votre resolutions digitals', 45, 'fr'),
(336, 'Durable et évolutif', 46, 'fr'),
(337, 'Sûr et flexible', 47, 'fr'),
(338, 'Compétent et personnalisable', 48, 'fr'),
(339, 'Domaines enregistrés', 49, 'fr'),
(340, 'Clients', 50, 'fr'),
(341, 'Serveurs en ligne', 51, 'fr'),
(342, 'Collaborateurs', 52, 'fr'),
(343, 'Français', 53, 'fr'),
(344, 'Bienvenue', 54, 'fr'),
(345, 'Accueil', 55, 'fr'),
(346, 'Profil', 56, 'fr'),
(347, 'Factures', 57, 'fr'),
(348, 'En attente', 58, 'fr'),
(349, 'Vos services', 59, 'fr'),
(350, 'Date d\'expiration', 60, 'fr'),
(351, 'Actif', 61, 'fr'),
(352, 'Supprimer', 62, 'fr'),
(353, 'Non', 63, 'fr'),
(354, 'Oui', 64, 'fr'),
(355, 'Informations personnelles', 65, 'fr'),
(356, 'Prénom', 66, 'fr'),
(357, 'Nom de famille', 67, 'fr'),
(358, 'Deuxième nom de famille', 68, 'fr'),
(359, 'E-mail', 69, 'fr'),
(360, 'Pays', 70, 'fr'),
(361, 'Choisir le pays', 71, 'fr'),
(362, 'Ville', 72, 'fr'),
(363, 'Adresse', 73, 'fr'),
(364, 'Code postal', 74, 'fr'),
(365, 'Modifier', 75, 'fr'),
(366, 'Enregistrer', 76, 'fr'),
(367, 'Annuler', 77, 'fr'),
(368, 'Modifier le mot de passe', 78, 'fr'),
(369, 'Ancien mot de passe', 79, 'fr'),
(370, 'Nouveau mot de passe', 80, 'fr'),
(371, 'Confirmer le mot de passe', 81, 'fr'),
(372, 'Modifier le mot de passe', 82, 'fr'),
(373, 'Informations de paiement', 83, 'fr'),
(374, 'Vous n\'avez aucun nom de domaine que vous attendez.', 84, 'fr'),
(375, 'You don\'t have any services.', 85, 'fr'),
(376, 'The .es is a well-known TLD, it is a good option for Spanish companies, websites and individuals as it gives them a sense of location, identity and trust. It is a stable and reliable TLD, with good support and security measures.', 86, 'en'),
(377, 'The .cat TLD is administered by the Fundació puntCAT, a non-profit organization created by the Government of Catalonia and the Catalan Internet community. It is a stable and reliable TLD, and it is a good option for Catalan companies, websites and individuals as i t gives them a sense of location, identity and trust.', 87, 'en'),
(378, 'The .tv is a TLD that is intended for use with television-related websites. .tv is the country code TLD for Tuvalu, a small island nation in the Pacific Ocean. However, it is marketed to be used for creating video-based websites, streaming platforms, and other media-related websites.', 88, 'en'),
(379, 'Die .es ist eine bekannte TLD und eine gute Option für spanische Unternehmen, Websites und Einzelpersonen, da sie ihnen ein Gefühl von Standort, Identität und Vertrauen vermittelt. Es ist eine stabile und zuverlässige TLD mit guter Unterstützung und Sicherheitsmaßnahmen.', 86, 'de'),
(380, 'Die .cat-TLD wird von der Fundació puntCAT verwaltet, einer gemeinnützigen Organisation, die von der katalanischen Regierung und der katalanischen Internet-Community gegründet wurde. Es ist eine stabile und zuverlässige TLD und eine gute Option für katalanische Unternehmen, Websites und Einzelpersonen, da es ihnen ein Gefühl von Standort, Identität und Vertrauen vermittelt.', 87, 'de'),
(381, '.tv ist eine TLD, die für die Verwendung mit fernsehbezogenen Websites vorgesehen ist. .tv ist die Ländercode-TLD für Tuvalu, einen kleinen Inselstaat im Pazifischen Ozean. Es wird jedoch für die Erstellung videobasierter Websites, Streaming-Plattformen und anderer medienbezogener Websites vermarktet.', 88, 'de'),
(382, 'El .es es un TLD muy conocido, es una buena opción para empresas, sitios web y particulares españoles, ya que les da un sentido de ubicación, identidad y confianza. Es un TLD estable y confiable, con buen soporte y medidas de seguridad.', 86, 'es'),
(383, 'El TLD .cat es administrado por la Fundació puntCAT, una organización sin ánimo de lucro creada por la Generalitat de Cataluña y la comunidad catalana de Internet. Es un TLD estable y fiable, y es una buena opción para empresas, webs y particulares catalanes ya que les da sensación de ubicación, identidad y confianza.', 87, 'es'),
(384, 'El .tv es un TLD que está diseñado para usarse con sitios web relacionados con la televisión. .tv es el código de país TLD para Tuvalu, una pequeña nación insular en el Océano Pacífico. Sin embargo, se comercializa para crear sitios web basados en videos, plataformas de transmisión y otros sitios web relacionados con los medios.', 88, 'es'),
(385, 'Le .es est un TLD bien connu, c\'est une bonne option pour les entreprises, les sites Web et les particuliers espagnols car il leur donne un sentiment d\'emplacement, d\'identité et de confiance. C\'est un TLD stable et fiable, avec un bon support et des mesures de sécurité.', 86, 'fr'),
(386, 'Le TLD .cat est administré par la Fundació puntCAT, une organisation à but non lucratif créée par le gouvernement de Catalogne et la communauté Internet catalane. C\'est un TLD stable et fiable, et c\'est une bonne option pour les entreprises catalanes, les sites Web et les particuliers car il leur donne un sentiment d\'emplacement, d\'identité et de confiance.', 87, 'fr'),
(387, 'Le .tv est un TLD destiné à être utilisé avec des sites Web liés à la télévision. .tv est le TLD de code de pays pour Tuvalu, une petite nation insulaire de l\'océan Pacifique. Cependant, il est commercialisé pour être utilisé pour créer des sites Web basés sur la vidéo, des plateformes de streaming et d\'autres sites Web liés aux médias.', 88, 'fr'),
(388, 'The .com TLD is the most widely used and recognized TLD in the world. It is often used for commercial websites and is considered the most professional choice for businesses.', 89, 'en'),
(389, 'The .org TLD is typically used by non-profit organizations and educational institutions. It is often considered a more trustworthy and credible choice for these types of websites.', 90, 'en'),
(390, 'The .info TLD is a generic TLD that can be used for any type of website. It is often used for informational websites, such as blogs and news sites.', 91, 'en'),
(391, 'Die TLD .com ist die am weitesten verbreitete und anerkannteste TLD der Welt. Sie wird häufig für kommerzielle Websites verwendet und gilt als die professionellste Wahl für Unternehmen.', 89, 'de'),
(392, 'Die TLD .org wird in der Regel von gemeinnützigen Organisationen und Bildungseinrichtungen verwendet. Sie wird oft als vertrauenswürdigere und glaubwürdigere Wahl für diese Art von Websites angesehen.“', 90, 'de'),
(393, 'Die .info-TLD ist eine generische TLD, die für jede Art von Website verwendet werden kann. Sie wird häufig für Informations-Websites wie Blogs und Nachrichtenseiten verwendet.', 91, 'de'),
(394, 'El TLD .com es el TLD más utilizado y reconocido en el mundo. A menudo se usa para sitios web comerciales y se considera la opción más profesional para las empresas.', 89, 'es'),
(395, 'El TLD .org suele ser utilizado por organizaciones sin fines de lucro e instituciones educativas. A menudo se considera una opción más confiable y creíble para este tipo de sitios web.', 90, 'es'),
(396, 'El TLD .info es un TLD genérico que se puede utilizar para cualquier tipo de sitio web. A menudo se usa para sitios web informativos, como blogs y sitios de noticias.', 91, 'es'),
(397, 'Le TLD .com est le TLD le plus utilisé et le plus reconnu au monde. Il est souvent utilisé pour les sites Web commerciaux et est considéré comme le choix le plus professionnel pour les entreprises.', 89, 'fr'),
(398, 'Le TLD .org est généralement utilisé par les organisations à but non lucratif et les établissements d\'enseignement. Il est souvent considéré comme un choix plus fiable et crédible pour ces types de sites Web.', 90, 'fr'),
(399, 'Le TLD .info est un TLD générique qui peut être utilisé pour tout type de site Web. Il est souvent utilisé pour les sites Web d\'information, tels que les blogs et les sites d\'actualités.', 91, 'fr'),
(400, 'Technical specifications', 92, 'en'),
(401, 'Our domain servers are built on state-of-the-art technology to provide a fast and reliable service for our customers. Our servers are powered by Intel Xeon processors and use DDR4 memory to ensure high performance and low latency. The servers are connected to a high-speed network with redundant connections to multiple Tier-1 providers', 93, 'en'),
(402, 'Control panel', 94, 'en'),
(403, 'Our domain servers are running the latest version of the industry-standard control panel, cPanel (modified by us), which allows customers to easily manage their domains, email accounts, and web hosting services. The servers are also equipped with the latest version of the Apache web server, PHP, and MySQL to support a wide range of web applications and frameworks.', 95, 'en'),
(404, 'Support', 96, 'en'),
(405, 'We have a team of experienced system administrators who are available 24/7 to monitor the servers and ensure that they are running smoothly. In case of any issues, our team will take the necessary actions to resolve them as quickly as possible.', 97, 'en'),
(406, 'Learn more', 98, 'en'),
(407, 'Technische Spezifikationen', 92, 'de'),
(408, 'Unsere Domain-Server basieren auf modernster Technologie, um unseren Kunden einen schnellen und zuverlässigen Service zu bieten. Unsere Server werden von Intel Xeon-Prozessoren angetrieben und verwenden DDR4-Speicher, um eine hohe Leistung und geringe Latenz zu gewährleisten. Die Server sind mit einem Hochgeschwindigkeitsnetzwerk mit redundanten Verbindungen zu mehreren Tier-1-Anbietern verbunden', 93, 'de'),
(409, 'Control Panel', 94, 'de'),
(410, 'Auf unseren Domain-Servern läuft die neueste Version des branchenüblichen Control Panels cPanel (von uns modifiziert), mit dem Kunden ihre Domains, E-Mail-Konten und Webhosting-Dienste einfach verwalten können. Die Server sind außerdem mit der neuesten Version des Apache-Webservers, PHP und MySQL ausgestattet, um eine breite Palette von Webanwendungen und Frameworks zu unterstützen.', 95, 'de'),
(411, 'Support', 96, 'de'),
(412, 'Wir haben ein Team erfahrener Systemadministratoren, die rund um die Uhr verfügbar sind, um die Server zu überwachen und sicherzustellen, dass sie reibungslos laufen. Im Falle von Problemen wird unser Team die notwendigen Maßnahmen ergreifen, um sie so schnell wie möglich zu lösen.', 97, 'de'),
(413, 'Mehr...', 98, 'de'),
(414, 'Especificaciones técnicas', 92, 'es'),
(415, 'Nuestros servidores de dominio están construidos con tecnología de punta para brindar un servicio rápido y confiable a nuestros clientes. Nuestros servidores cuentan con procesadores Intel Xeon y utilizan memoria DDR4 para garantizar un alto rendimiento y una baja latencia. Los servidores están conectados a una red de alta velocidad con conexiones redundantes a múltiples proveedores de nivel 1', 93, 'es'),
(416, 'Panel de control', 94, 'es'),
(417, 'Nuestros servidores de dominio ejecutan la última versión del panel de control estándar de la industria, cPanel (modificado por nosotros), que permite a los clientes administrar fácilmente sus dominios, cuentas de correo electrónico y servicios de alojamiento web. Los servidores también están equipados con la última versión del servidor web Apache, PHP y MySQL para admitir una amplia gama de marcos y aplicaciones web.', 95, 'es'),
(418, 'Soporte', 96, 'es'),
(419, 'Contamos con un equipo de administradores de sistemas experimentados que están disponibles las 24 horas del día, los 7 días de la semana para monitorear los servidores y garantizar que funcionen sin problemas. En caso de cualquier problema, nuestro equipo tomará las medidas necesarias para resolverlo lo más rápido posible.', 97, 'es'),
(420, 'Más...', 98, 'es'),
(421, 'Spécifications techniques', 92, 'fr'),
(422, 'Nos serveurs de domaine sont construits sur une technologie de pointe pour fournir un service rapide et fiable à nos clients. Nos serveurs sont alimentés par des processeurs Intel Xeon et utilisent de la mémoire DDR4 pour garantir des performances élevées et une faible latence. Les serveurs sont connectés à un réseau haut débit avec des connexions redondantes à plusieurs fournisseurs de niveau 1', 93, 'fr'),
(423, 'Panneau de commande', 94, 'fr'),
(424, 'Nos serveurs de domaine exécutent la dernière version du panneau de contrôle standard de l\'industrie, cPanel (modifié par nous), qui permet aux clients de gérer facilement leurs domaines, comptes de messagerie et services d\'hébergement Web. Les serveurs sont également équipés de la dernière version du serveur Web Apache, PHP et MySQL pour prendre en charge une large gamme d\'applications et de cadres Web.', 95, 'fr'),
(425, 'Support', 96, 'fr'),
(426, 'Nous avons une équipe d\'administrateurs système expérimentés qui sont disponibles 24h/24 et 7j/7 pour surveiller les serveurs et s\'assurer qu\'ils fonctionnent correctement. En cas de problème, notre équipe prendra les mesures nécessaires pour les résoudre dans les plus brefs délais.', 97, 'fr'),
(427, 'Plus', 98, 'fr'),
(428, 'Select the <span class=\"text-primary\">mailing service</span> which most suits you!', 99, 'en'),
(429, 'Wählen Sie den <span class=\"text-primary\">Mailing-Service</span>, der am besten zu Ihnen passt!', 99, 'de'),
(430, '¡Seleccione el <span class=\"text-primary\">servicio de correo</span> que más le convenga!', 99, 'es'),
(431, 'Sélectionnez le <span class=\"text-primary\">service de messagerie</span> qui vous convient le mieux !', 99, 'fr'),
(432, 'Single mail account', 100, 'en'),
(433, 'Our Basic Service is perfect for those who are just starting out and need a simple and reliable solution for their business mailing', 101, 'en'),
(434, 'Personalized E-Mail account', 102, 'en'),
(435, 'Add it to your existing domains', 103, 'en'),
(436, '24/7 customer support', 104, 'en'),
(437, 'Anti Spam and virus protection', 105, 'en'),
(438, 'Mail account(s)', 106, 'en'),
(439, 'year', 107, 'en'),
(440, 'Einzelnes E-Mail-Konto', 100, 'de'),
(441, 'Unser Basis-Service ist perfekt für Einsteiger, die eine einfache und zuverlässige Lösung für ihr Geschäftsmailing benötigen', 101, 'de'),
(442, 'Personalisiertes E-Mail-Konto', 102, 'de'),
(443, 'Fügen Sie es zu Ihren bestehenden Domains hinzu', 103, 'de'),
(444, '24/7 Kundensupport', 104, 'de'),
(445, 'Spam- und Virenschutz', 105, 'de'),
(446, 'E-Mail-Konto', 106, 'de'),
(447, 'Jahr', 107, 'de'),
(448, 'Cuenta de correo electrónico única', 100, 'es'),
(449, 'Nuestro servicio básico es perfecto para principiantes que necesitan una solución simple y confiable para su correo comercial.', 101, 'es'),
(450, 'Cuenta de correo personalizada', 102, 'es'),
(451, 'Agréguelo a sus dominios existentes', 103, 'es'),
(452, 'Atención al cliente 24/7', 104, 'es'),
(453, 'Protección contra spam y virus', 105, 'es'),
(454, 'cuenta(s) de correo electrónico', 106, 'es'),
(455, 'Año', 107, 'es'),
(456, 'Compte de messagerie unique', 100, 'fr'),
(457, 'Notre service de base est parfait pour les débutants qui ont besoin d\'une solution simple et fiable pour leur mailing professionnel', 101, 'fr'),
(458, 'Compte de messagerie personnalisé', 102, 'fr'),
(459, 'Ajoutez-le à vos domaines existants', 103, 'fr'),
(460, 'Assistance client 24h/24 et 7j/7', 104, 'fr'),
(461, 'Protection anti-spam et antivirus', 105, 'fr'),
(462, 'compte de messagerie', 106, 'fr'),
(463, 'An.', 107, 'fr'),
(464, 'Add to cart', 108, 'en'),
(465, 'In den Warenkorb', 108, 'de'),
(466, 'Añadir al carrito', 108, 'es'),
(467, 'Ajouter au panier', 108, 'fr'),
(468, 'Professional Mailing', 109, 'en'),
(469, 'Our Advanced Service is perfect for those who have more complex needs and require more advanced features and resources.', 110, 'en'),
(470, 'Customizable resources and settings', 111, 'en'),
(471, 'Advanced security features', 112, 'en'),
(472, '100% free of ads', 113, 'en'),
(473, 'Integrated tools for working as a group', 114, 'en'),
(474, 'Mail accounts', 115, 'en'),
(475, 'Professionelles Mailing', 109, 'de'),
(476, 'Unser erweiterter Service ist perfekt für diejenigen, die komplexere Anforderungen haben.', 110, 'de'),
(477, 'Anpassbare Ressourcen und Einstellungen', 111, 'de'),
(478, 'Erweiterte Sicherheitsfunktionen', 112, 'de'),
(479, '100% werbefrei', 113, 'de'),
(480, 'Integrierte Tools für die Arbeit als Gruppe', 114, 'de'),
(481, 'E-Mail-Konten', 115, 'de'),
(482, 'Correo profesional', 109, 'es'),
(483, 'Nuestro Servicio Avanzado es perfecto para aquellos que tienen necesidades más complejas y requieren funciones más avanzados.', 110, 'es'),
(484, 'Recursos y configuraciones personalizables', 111, 'es'),
(485, 'Características de seguridad avanzadas', 112, 'es'),
(486, '100% libre de anuncios', 113, 'es'),
(487, 'Herramientas integradas para trabajar en grupo', 114, 'es'),
(488, 'cuentas de correo', 115, 'es'),
(489, 'Envoi professionnel', 109, 'fr'),
(490, 'Notre service avancé est parfait pour ceux qui ont des besoins plus complexes et qui ont besoin de fonctionnalités.', 110, 'fr'),
(491, 'Ressources et paramètres personnalisables', 111, 'fr'),
(492, 'Fonctions de sécurité avancées', 112, 'fr'),
(493, '100% sans publicité', 113, 'fr'),
(494, 'Des outils intégrés pour travailler en groupe', 114, 'fr'),
(495, 'Comptes de messagerie', 115, 'fr'),
(496, 'Select the', 116, 'en'),
(497, 'hosting service', 117, 'en'),
(498, 'which most suits you!', 118, 'en'),
(499, 'Basic Service', 119, 'en'),
(500, 'Our Basic Service is perfect for those who are just starting out and need a simple and reliable solution for their domain and hosting needs.', 120, 'en'),
(501, 'Affordable pricing', 121, 'en'),
(502, 'Easy to use control panel', 122, 'en'),
(503, '24/7 customer support', 123, 'en'),
(504, 'GB free traffic', 124, 'en'),
(505, 'GB capacity', 125, 'en'),
(506, 'Advanced Service', 126, 'en'),
(507, 'Our Advanced Service is perfect for those who have more complex needs and require more advanced features and resources.', 127, 'en'),
(508, 'Customizable resources and settings', 128, 'en'),
(509, 'Advanced security features', 129, 'en'),
(510, 'Dedicated IP and SSL options', 130, 'en'),
(511, 'Wählen Sie den', 116, 'de'),
(512, 'Hosting-Service', 117, 'de'),
(513, 'der am besten zu dir passt!', 118, 'de'),
(514, 'Basis', 119, 'de'),
(515, 'Unser Basis-Service ist perfekt für diejenigen, die gerade erst anfangen und eine einfache und zuverlässige Lösung für ihre Domain- und Hosting-Anforderungen benötigen.', 120, 'de'),
(516, 'Erschwingliche Preise', 121, 'de'),
(517, 'Einfach zu bedienendes Bedienfeld', 122, 'de'),
(518, '24/7 Kundensupport', 123, 'de'),
(519, 'GB kostenloser Datenverkehr', 124, 'de'),
(520, 'GB-Kapazität', 125, 'de'),
(521, 'Erweiterter Service', 126, 'de'),
(522, 'Unser erweiterter Service ist perfekt für diejenigen, die komplexere Anforderungen haben und erweiterte Funktionen und Ressourcen benötigen.', 127, 'de'),
(523, 'Anpassbare Ressourcen und Einstellungen', 128, 'de'),
(524, 'Erweiterte Sicherheitsfunktionen', 129, 'de'),
(525, 'Dedizierte IP- und SSL-Optionen', 130, 'de'),
(526, 'Selecciona el', 116, 'es'),
(527, 'servicio de hosting', 117, 'es'),
(528, 'que más le convenga!', 118, 'es'),
(529, 'Servicio Básico', 119, 'es'),
(530, 'Nuestro Servicio Básico es perfecto para aquellos que recién comienzan y necesitan una solución simple y confiable para sus necesidades de dominio y hosting.', 120, 'es'),
(531, 'Precios asequibles', 121, 'es'),
(532, 'Panel de control fácil de usar', 122, 'es'),
(533, 'Atención al cliente 24/7', 123, 'es'),
(534, 'GB tráfico libre', 124, 'es'),
(535, 'GB de capacidad', 125, 'es'),
(536, 'Servicio Avanzado', 126, 'es'),
(537, 'Nuestro Servicio Avanzado es perfecto para aquellos que tienen necesidades más complejas y requieren funciones y recursos más avanzados.', 127, 'es'),
(538, 'Recursos y configuraciones personalizables', 128, 'es'),
(539, 'Características de seguridad avanzadas', 129, 'es'),
(540, 'Opciones de IP dedicada y SSL', 130, 'es'),
(546, 'Sélectionnez le', 116, 'fr'),
(547, 'service d\'hosting', 117, 'fr'),
(548, 'qui vous convient le mieux !', 118, 'fr'),
(549, 'Service de base', 119, 'fr'),
(550, 'Notre service de base est parfait pour ceux qui débutent et qui ont besoin d\'une solution simple et fiable pour leurs besoins en matière de domaine et d\'hébergement.', 120, 'fr'),
(551, 'Prix abordable', 121, 'fr'),
(552, 'Panneau de commande facile à utiliser', 122, 'fr'),
(553, 'Assistance client 24h/24 et 7j/7', 123, 'fr'),
(554, 'Go de trafic gratuit', 124, 'fr'),
(555, 'Capacité en Go', 125, 'fr'),
(556, 'Service avancé', 126, 'fr'),
(557, 'Notre service avancé est parfait pour ceux qui ont des besoins plus complexes et qui ont besoin de fonctionnalités et de ressources plus avancées.', 127, 'fr'),
(558, 'Ressources et paramètres personnalisables', 128, 'fr'),
(559, 'Fonctions de sécurité avancées', 129, 'fr'),
(560, 'Options IP et SSL dédiées', 130, 'fr'),
(561, 'Name', 131, 'en'),
(562, 'Enter your name', 132, 'en'),
(563, 'Enter your email', 133, 'en'),
(564, 'Name', 131, 'de'),
(565, 'Bitte geben Sie ihren Namen ein', 132, 'de'),
(566, 'Bitte geben Sie ihre E-Mail ein', 133, 'de'),
(567, 'Nombre', 131, 'es'),
(568, 'Introduzca su nombre', 132, 'es'),
(569, 'Introduzca su correo', 133, 'es'),
(570, 'Nom', 131, 'fr'),
(571, 'Entrez votre nom', 132, 'fr'),
(572, 'Entre votre Email', 133, 'fr'),
(573, 'Username', 134, 'en'),
(574, 'Password', 135, 'en'),
(575, 'Login', 136, 'en'),
(576, 'Register', 137, 'en'),
(577, 'Login with Google', 138, 'en'),
(578, 'Login with Facebook', 139, 'en'),
(579, 'Forgot your password?', 140, 'en'),
(580, 'Nutzername', 134, 'de'),
(581, 'Passwort', 135, 'de'),
(582, 'Login', 136, 'de'),
(583, 'Registrieren', 137, 'de'),
(584, 'Mit Google anmelden', 138, 'de'),
(585, 'Mit Facebook anmelden', 139, 'de'),
(586, 'Haben Sie Ihr Passwort vergessen?', 140, 'de'),
(587, 'Nombre de usuario', 134, 'es'),
(588, 'Contraseña', 135, 'es'),
(589, 'Login', 136, 'es'),
(590, 'Registro', 137, 'es'),
(591, 'Iniciar sesión con Google', 138, 'es'),
(592, 'Iniciar sesión con Facebook', 139, 'es'),
(593, '¿Olvidaste tu contraseña?', 140, 'es'),
(594, 'Nom d\'utilisateur', 134, 'fr'),
(595, 'Mot de passe', 135, 'fr'),
(596, 'Login', 136, 'fr'),
(597, 'Enregistrer', 137, 'fr'),
(598, 'Connectez-vous avec Google', 138, 'fr'),
(599, 'Se connecter avec Facebook', 139, 'fr'),
(600, 'Mot de passe oublié?', 140, 'fr'),
(601, 'Your cart is empty', 141, 'en'),
(602, 'Add something to make me happy!', 142, 'en'),
(603, 'Continue shopping', 143, 'en'),
(604, 'Ihr Warenkorb ist leer', 141, 'de'),
(605, 'Füge etwas hinzu, um mich glücklich zu machen!', 142, 'de'),
(606, 'Mit dem Einkaufen fortfahren', 143, 'de'),
(607, 'Tu carrito esta vacío', 141, 'es'),
(608, '¡Añade algo que me haga feliz!', 142, 'es'),
(609, 'Seguir comprando', 143, 'es'),
(610, 'Votre panier est vide', 141, 'fr'),
(611, 'Ajoutez quelque chose pour me faire plaisir !', 142, 'fr'),
(612, 'Continuer vos achats', 143, 'fr'),
(617, 'Repeat password', 144, 'en'),
(618, 'Password wiederholen', 144, 'de'),
(619, 'Repetir contraseña', 144, 'es'),
(620, 'Répéter le mot de passe', 144, 'fr'),
(621, 'Already registered?', 145, 'en'),
(622, 'Login here', 146, 'en'),
(623, 'You have been registered!', 147, 'en'),
(624, 'We have sent you an email to', 148, 'en'),
(625, 'to confirm your registration. Please check your inbox.', 149, 'en'),
(626, 'Go to homepage', 150, 'en'),
(627, 'Bereits registriert?', 145, 'de'),
(628, 'Hier anmelden', 146, 'de'),
(629, 'Sie wurden registriert!', 147, 'de'),
(630, 'Wir haben Ihnen eine E-Mail an gesendet', 148, 'de'),
(631, 'um Ihre Anmeldung zu bestätigen. Bitte überprüfen Sie Ihren Posteingang.', 149, 'de'),
(632, 'Gehen Sie zur Homepage', 150, 'de'),
(633, '¿Ya registrado?', 145, 'es'),
(634, 'Entre aquí', 146, 'es'),
(635, '¡Has sido registrado!', 147, 'es'),
(636, 'Te hemos enviado un email a', 148, 'es'),
(637, 'para confirmar su registro. Por favor revise su bandeja de entrada.', 149, 'es'),
(638, 'Ir a la página de inicio', 150, 'es'),
(639, 'Déjà enregistré?', 145, 'fr'),
(640, 'Connectez-vous ici', 146, 'fr'),
(641, 'Vous avez été enregistré!', 147, 'fr'),
(642, 'Nous vous avons envoyé un e-mail à', 148, 'fr'),
(643, 'pour confirmer votre inscription. Veuillez vérifier votre boîte de réception.', 149, 'fr'),
(644, 'Aller à la page d\'accueil', 150, 'fr'),
(645, 'Register now!', 151, 'en'),
(646, 'Jetzt registrieren!', 151, 'de'),
(647, 'Registrar ahora!', 151, 'es'),
(648, 'Enregistrer maintenant!', 151, 'fr'),
(649, 'だいたい', 1, 'jp'),
(650, 'コンタクト', 2, 'jp'),
(651, 'アカウント', 3, 'jp'),
(652, 'カート', 4, 'jp'),
(653, '私たちに関しては', 5, 'jp'),
(654, '「私たちは、可能な限り最高のサービスを提供することに専念している情熱的な個人の小さなチームです。私たちは、顧客が満足していることを確認するために、誠実さ、透明性、そしてそれ以上のことを信じています。」', 6, 'jp'),
(655, 'プライバシーポリシー', 7, 'jp'),
(656, '利用規約', 8, 'jp'),
(657, 'クッキーポリシー', 9, 'jp'),
(658, 'ドメインを探す', 10, 'jp'),
(659, '検索して購入', 11, 'jp'),
(660, '無料ドメイン', 12, 'jp'),
(661, 'ドメイン名を検索する', 13, 'jp'),
(662, '検索', 14, 'jp'),
(663, 'ドメインホスティング', 15, 'jp'),
(664, '信頼性の高いホスティング サービスを使用して、ドメイン名を安全に保ちます。 当社の専門家チームが、最適なドメインを見つけてスムーズに運用できるようにお手伝いします。', 16, 'jp'),
(665, '私たちはあなたをカバーしました', 17, 'jp'),
(666, 'どんな問題があっても心配しないでください。 私たちの専門家チームは、あなたが抱えている問題を解決するためにここにいます', 18, 'jp'),
(667, 'なぜ私たちを選ぶのですか?', 19, 'jp'),
(668, '「私たちは業界で最高の価格とレートを提供しています。私たちのチームは、お客様がお金に見合った最高の価値を得られるように、お客様にとって最高の取引を交渉するために懸命に働いています.」', 20, 'jp'),
(669, 'ニュースレターを購読する', 21, 'jp'),
(670, '私たちのチームから最新のニュースとアップデートを入手してください。', 22, 'jp'),
(671, 'メールアドレスを入力して', 23, 'jp'),
(672, '購読', 24, 'jp'),
(673, '登録ありがとうございます！', 25, 'jp'),
(674, '有効なメールアドレスを入力してください。', 26, 'jp'),
(675, 'あなたはすでに加入しています。', 27, 'jp'),
(676, '有効なメールアドレスを入力してください。', 28, 'jp'),
(677, '私たちに関しては', 29, 'jp'),
(678, '「私たちは、可能な限り最高のサービスを提供することに専念している情熱的な個人の小さなチームです。私たちは、顧客が満足していることを確認するために、誠実さ、透明性、そしてそれ以上のことを信じています。」', 30, 'jp'),
(679, '私たちのビジネス', 31, 'jp'),
(680, '当社の事業は、高品質のドメイン ホスティング サービスの提供に重点を置いています。 当社は業界に 10 年以上携わっており、信頼性と優れたカスタマー サポートで定評があります。', 32, 'jp'),
(681, 'お問い合わせ', 33, 'jp'),
(682, 'ご連絡をお待ちしております。 電話 (123) 456-7890 または電子メール info@isphero.com でご連絡ください。', 34, 'jp'),
(683, '私たちのオフィスは、1820 NW 56th St にあります。', 35, 'jp'),
(684, '月曜日から金曜日の午前 9 時から午後 5 時まで営業しています。', 36, 'jp'),
(685, '私たちのチーム', 37, 'jp'),
(686, 'ISPヒーローの創設者', 38, 'jp'),
(687, 'ご連絡をお待ちしております。 以下のフォームを使用してメッセージを送信してください。', 39, 'jp'),
(688, '私たちの場所', 40, 'jp'),
(689, 'メッセージ', 41, 'jp'),
(690, 'メッセージを送る', 42, 'jp'),
(691, '私たちのオフィスは、1820 NW 56th St にあります。', 43, 'jp'),
(692, '月曜日から金曜日の午前 9 時から午後 5 時まで営業しています。', 44, 'jp'),
(693, 'あなたのデジタルソリューション', 45, 'jp'),
(694, '持続可能でスケーラブル', 46, 'jp'),
(695, '安全で柔軟', 47, 'jp'),
(696, '有能でカスタマイズ可能', 48, 'jp'),
(697, '登録されたドメイン', 49, 'jp'),
(698, 'クライアントがサービスを提供', 50, 'jp'),
(699, 'サーバーオンライン', 51, 'jp'),
(700, '協力者', 52, 'jp'),
(701, '英語', 53, 'jp'),
(702, 'おかえり', 54, 'jp'),
(703, '家', 55, 'jp'),
(704, 'プロフィール', 56, 'jp'),
(705, '請求書', 57, 'jp'),
(706, '待っている', 58, 'jp'),
(707, 'あなたのサービス', 59, 'jp'),
(708, '有効期限', 60, 'jp'),
(709, 'アクティブ', 61, 'jp'),
(710, '消去', 62, 'jp'),
(711, 'いいえ', 63, 'jp'),
(712, 'はい', 64, 'jp'),
(713, '個人情報', 65, 'jp'),
(714, 'ファーストネーム', 66, 'jp'),
(715, '苗字', 67, 'jp'),
(716, '2 番目の姓', 68, 'jp'),
(717, 'Eメール', 69, 'jp'),
(718, '国', 70, 'jp'),
(719, '国を選択します', 71, 'jp'),
(720, '街', 72, 'jp'),
(721, '住所', 73, 'jp'),
(722, '郵便番号', 74, 'jp'),
(723, '編集', 75, 'jp'),
(724, '保存', 76, 'jp'),
(725, 'キャンセル', 77, 'jp'),
(726, 'パスワードを変更する', 78, 'jp'),
(727, '以前のパスワード', 79, 'jp'),
(728, '新しいパスワード', 80, 'jp'),
(729, 'パスワードを認証する', 81, 'jp'),
(730, 'パスワードを変更する', 82, 'jp'),
(731, '支払情報', 83, 'jp'),
(732, '待っているドメイン名はありません。', 84, 'jp'),
(733, 'サービスはありません。', 85, 'jp'),
(734, '「.es は有名な TLD です。スペインの企業、ウェブサイト、個人にとって、場所、アイデンティティ、信頼の感覚を与えるための良い選択肢です。安定した信頼性の高い TLD であり、優れたサポートとセキュリティ対策を備えています。 .\"', 86, 'jp'),
(735, '「.cat TLD は、カタロニア政府とカタロニアのインターネット コミュニティによって作成された非営利組織である Fundació puntCAT によって管理されています。これは、安定した信頼できる TLD であり、カタロニアの企業、ウェブサイト、および個人にとって優れた選択肢です。 場所、アイデンティティ、信頼の感覚を彼らに与えるからです。」', 87, 'jp'),
(736, '「.tv は、テレビ関連の Web サイトでの使用を目的とした TLD です。.tv は、太平洋の小さな島国であるツバルの国コード TLD です。ただし、ビデオベースのコンテンツの作成に使用するために販売されています。 Web サイト、ストリーミング プラットフォーム、およびその他のメディア関連の Web サイト。」', 88, 'jp'),
(737, '.com TLD は、世界で最も広く使用され、認知されている TLD です。 多くの場合、商用 Web サイトで使用され、ビジネスにとって最もプロフェッショナルな選択肢と見なされています。', 89, 'jp'),
(738, '.org TLD は通常、非営利組織や教育機関で使用されます。 多くの場合、これらのタイプの Web サイトでは、より信頼できる信頼できる選択肢と見なされます。', 90, 'jp'),
(739, '「.info TLD は、あらゆる種類の Web サイトに使用できる汎用 TLD です。ブログやニュース サイトなどの情報 Web サイトによく使用されます。」', 91, 'jp'),
(740, '技術仕様', 92, 'jp'),
(741, '当社のドメイン サーバーは最先端の技術に基づいて構築されており、お客様に高速で信頼性の高いサービスを提供します。 当社のサーバーは Intel Xeon プロセッサを搭載し、DDR4 メモリを使用して高性能と低遅延を保証します。 サーバーは、複数の Tier-1 プロバイダーへの冗長接続を備えた高速ネットワークに接続されています。', 93, 'jp'),
(742, 'コントロールパネル', 94, 'jp'),
(743, '「当社のドメイン サーバーでは、業界標準のコントロール パネルである cPanel (当社が修正) の最新バージョンを実行しています。これにより、顧客はドメイン、電子メール アカウント、および Web ホスティング サービスを簡単に管理できます。サーバーには最新バージョンも搭載されています。 Apache Web サーバー、PHP、および MySQL を組み合わせて、幅広い Web アプリケーションとフレームワークをサポートします。」', 95, 'jp'),
(744, 'サポート', 96, 'jp'),
(745, '「私たちには、24 時間年中無休でサーバーを監視し、サーバーがスムーズに稼働していることを確認できる経験豊富なシステム管理者のチームがあります。問題が発生した場合、私たちのチームはできるだけ早く解決するために必要な措置を講じます。」', 97, 'jp'),
(746, 'もっと詳しく知る', 98, 'jp'),
(747, 'あなたに最も適した<span class=\"text-primary\">メール サービス</span>を選択してください!', 99, 'jp'),
(748, 'シングルメールアカウント', 100, 'jp'),
(749, '当社のベーシック サービスは、ビジネス メーリングを始めたばかりで、シンプルで信頼性の高いソリューションを必要としている方に最適です。', 101, 'jp'),
(750, 'パーソナライズされた電子メール アカウント', 102, 'jp'),
(751, '既存のドメインに追加する', 103, 'jp'),
(752, '年中無休のカスタマーサポート', 104, 'jp'),
(753, 'アンチスパムおよびウイルス保護', 105, 'jp'),
(754, 'メールアカウント', 106, 'jp'),
(755, '年', 107, 'jp'),
(756, 'カートに追加', 108, 'jp'),
(757, 'プロの郵送', 109, 'jp'),
(758, '当社の高度なサービスは、より複雑なニーズを持ち、より高度な機能とリソースを必要とするお客様に最適です。', 110, 'jp'),
(759, 'カスタマイズ可能なリソースと設定', 111, 'jp'),
(760, '高度なセキュリティ機能', 112, 'jp'),
(761, '100% 広告なし', 113, 'jp'),
(762, 'グループで作業するための統合ツール', 114, 'jp'),
(763, 'メールアカウント', 115, 'jp'),
(764, 'を選択', 116, 'jp'),
(765, 'ホスティング サービス', 117, 'jp'),
(766, 'どれがあなたに一番合っていますか！', 118, 'jp'),
(767, '基本サービス', 119, 'jp'),
(768, '私たちの基本サービスは、ドメインとホスティングのニーズに合わせてシンプルで信頼性の高いソリューションを必要としている初心者に最適です。', 120, 'jp'),
(769, '手頃な価格', 121, 'jp'),
(770, '使いやすいコントロールパネル', 122, 'jp'),
(771, '年中無休のカスタマーサポート', 123, 'jp'),
(772, 'GB の空きトラフィック', 124, 'jp'),
(773, 'GB 容量', 125, 'jp'),
(774, '高度なサービス', 126, 'jp'),
(775, '当社の高度なサービスは、より複雑なニーズを持ち、より高度な機能とリソースを必要とするお客様に最適です。', 127, 'jp'),
(776, 'カスタマイズ可能なリソースと設定', 128, 'jp'),
(777, '高度なセキュリティ機能', 129, 'jp'),
(778, '専用 IP および SSL オプション', 130, 'jp'),
(779, '名前', 131, 'jp'),
(780, 'あなたの名前を入力してください', 132, 'jp'),
(781, 'メールアドレスを入力', 133, 'jp'),
(782, 'ユーザー名', 134, 'jp'),
(783, 'パスワード', 135, 'jp'),
(784, 'ログイン', 136, 'jp'),
(785, '登録', 137, 'jp'),
(786, 'Google でログイン', 138, 'jp'),
(787, 'Facebookでログイン', 139, 'jp'),
(788, 'パスワードをお忘れですか？', 140, 'jp'),
(789, 'あなたのカートは空です', 141, 'jp'),
(790, '私を幸せにする何かを追加してください！', 142, 'jp'),
(791, 'ショッピングを続ける', 143, 'jp'),
(792, 'パスワードを再度入力してください。', 144, 'jp'),
(793, 'すでに登録？', 145, 'jp'),
(794, 'ここでログイン', 146, 'jp'),
(795, '登録されました！', 147, 'jp'),
(796, 'にメールを送信しました', 148, 'jp'),
(797, '登録を確認します。 受信トレイを確認してください。', 149, 'jp'),
(798, 'ホームページへ', 150, 'jp'),
(799, '今すぐ登録！', 151, 'jp'),
(800, '에 대한', 1, 'kr'),
(801, '연락하다', 2, 'kr'),
(802, '계정', 3, 'kr'),
(803, '카트', 4, 'kr'),
(804, '회사 소개', 5, 'kr'),
(805, '우리는 가능한 최고의 서비스를 제공하기 위해 헌신하는 열정적인 개인들로 구성된 소규모 팀입니다. 우리는 정직과 투명성을 믿으며 고객이 만족할 수 있도록 최선을 다합니다.', 6, 'kr'),
(806, '개인 정보 정책', 7, 'kr'),
(807, '서비스 약관', 8, 'kr'),
(808, '쿠키 정책', 9, 'kr'),
(809, '도메인 찾기', 10, 'kr'),
(810, '검색 및 구매', 11, 'kr'),
(811, '무료 도메인', 12, 'kr'),
(812, '도메인 이름 검색', 13, 'kr'),
(813, '찾다', 14, 'kr'),
(814, '도메인 호스팅', 15, 'kr'),
(815, '신뢰할 수 있는 호스팅 서비스로 도메인 이름을 안전하게 보호하세요. 전문가 팀이 완벽한 도메인을 찾고 원활하게 운영되도록 도와드립니다.', 16, 'kr'),
(816, '우리는 당신을 덮었습니다', 17, 'kr'),
(817, '당신이 가질 수있는 문제에 대해 걱정하지 마십시오. 우리의 전문가 팀은 당신이 가질 수 있는 모든 문제를 돕기 위해 여기 있습니다.', 18, 'kr'),
(818, '왜 우리를 선택 했습니까?', 19, 'kr'),
(819, '우리는 업계 최고의 가격과 요율을 제공합니다. 우리 팀은 고객이 비용 대비 최고의 가치를 얻을 수 있도록 최선의 거래를 협상하기 위해 열심히 노력하고 있습니다.', 20, 'kr'),
(820, '뉴스레터 구독', 21, 'kr'),
(821, '우리 팀의 최신 뉴스와 업데이트를 받으세요.', 22, 'kr'),
(822, '이메일 입력', 23, 'kr'),
(823, '구독하다', 24, 'kr'),
(824, '구독해주셔서 감사합니다!', 25, 'kr'),
(825, '유효한 이메일 주소를 입력하세요.', 26, 'kr'),
(826, '이미 구독 중입니다.', 27, 'kr'),
(827, '유효한 이메일 주소를 입력하세요.', 28, 'kr'),
(828, '회사 소개', 29, 'kr'),
(829, '우리는 가능한 최고의 서비스를 제공하기 위해 헌신하는 열정적인 개인들로 구성된 소규모 팀입니다. 우리는 정직과 투명성을 믿으며 고객이 만족할 수 있도록 최선을 다합니다.', 30, 'kr'),
(830, '우리 사업', 31, 'kr'),
(831, '우리 사업은 고품질 도메인 호스팅 서비스를 제공하는 데 중점을 둡니다. 우리는 10년 이상 업계에 종사해 왔으며 신뢰성과 탁월한 고객 지원으로 명성이 높습니다.', 32, 'kr'),
(832, '문의하기', 33, 'kr'),
(833, '우리는 당신의 의견을 듣고 싶습니다! (123) 456-7890으로 전화하거나 info@isphero.com으로 이메일을 보내 연락할 수 있습니다.', 34, 'kr'),
(834, '저희 사무실은 1820 NW 56th St에 있습니다.', 35, 'kr'),
(835, '월요일부터 금요일까지 오전 9시부터 오후 5시(동부 표준시)까지 영업합니다.', 36, 'kr'),
(836, '우리 팀', 37, 'kr'),
(837, 'ISP 히어로 창립자', 38, 'kr'),
(838, '우리는 당신의 의견을 듣고 싶습니다! 아래 양식을 사용하여 메시지를 보내주십시오.', 39, 'kr'),
(839, '우리 위치', 40, 'kr'),
(840, '메시지', 41, 'kr'),
(841, '문자 보내', 42, 'kr'),
(842, '저희 사무실은 1820 NW 56th St에 있습니다.', 43, 'kr'),
(843, '월요일부터 금요일까지 오전 9시부터 오후 5시(동부 표준시)까지 영업합니다.', 44, 'kr'),
(844, '디지털 솔루션', 45, 'kr'),
(845, '지속 가능하고 확장 가능', 46, 'kr'),
(846, '안전하고 유연한', 47, 'kr'),
(847, '유능하고 사용자 정의 가능', 48, 'kr'),
(848, '등록된 도메인', 49, 'kr'),
(849, '고객 서비스', 50, 'kr'),
(850, '온라인 서버', 51, 'kr'),
(851, '협력자', 52, 'kr'),
(852, '영어', 53, 'kr'),
(853, '다시 오신 것을 환영합니다', 54, 'kr'),
(854, '집', 55, 'kr'),
(855, '프로필', 56, 'kr'),
(856, '인보이스', 57, 'kr'),
(857, '대기 중', 58, 'kr'),
(858, '귀하의 서비스', 59, 'kr'),
(859, '만료일', 60, 'kr'),
(860, '활동적인', 61, 'kr'),
(861, '삭제', 62, 'kr'),
(862, '아니요', 63, 'kr'),
(863, '예', 64, 'kr'),
(864, '개인 정보', 65, 'kr'),
(865, '이름', 66, 'kr'),
(866, '성', 67, 'kr'),
(867, '두 번째 성', 68, 'kr'),
(868, '이메일', 69, 'kr'),
(869, '국가', 70, 'kr'),
(870, '국가 선택', 71, 'kr'),
(871, '도시', 72, 'kr'),
(872, '주소', 73, 'kr'),
(873, '우편 번호', 74, 'kr'),
(874, '편집하다', 75, 'kr'),
(875, '구하다', 76, 'kr'),
(876, '취소', 77, 'kr'),
(877, '비밀번호 변경', 78, 'kr'),
(878, '기존 비밀번호', 79, 'kr'),
(879, '새 비밀번호', 80, 'kr'),
(880, '비밀번호 확인', 81, 'kr'),
(881, '비밀번호 변경', 82, 'kr'),
(882, '결제 정보', 83, 'kr'),
(883, '기다리고 있는 도메인 이름이 없습니다.', 84, 'kr'),
(884, '서비스가 없습니다.', 85, 'kr'),
(885, '.es는 잘 알려진 TLD이며 위치, 신원 및 신뢰감을 제공하므로 스페인 기업, 웹 사이트 및 개인에게 좋은 옵션입니다. 안정적이고 신뢰할 수 있는 TLD이며 우수한 지원 및 보안 조치가 제공됩니다. .', 86, 'kr'),
(886, '.cat TLD는 카탈로니아 정부와 카탈로니아 인터넷 커뮤니티에서 만든 비영리 조직인 Fundació puntCAT에서 관리합니다. 안정적이고 신뢰할 수 있는 TLD이며 카탈루냐 기업, 웹사이트 및 개인에게 좋은 옵션입니다. 그것은 그들에게 위치, 정체성 및 신뢰감을 제공하기 때문입니다.', 87, 'kr'),
(887, '.tv는 텔레비전 관련 웹 사이트에서 사용하기 위한 TLD입니다. .tv는 태평양의 작은 섬나라인 투발루의 국가 코드 TLD입니다. 그러나 비디오 기반 제작에 사용하도록 마케팅됩니다. 웹사이트, 스트리밍 플랫폼 및 기타 미디어 관련 웹사이트.', 88, 'kr'),
(888, '.com TLD는 세계에서 가장 널리 사용되고 인정받는 TLD입니다. 상업용 웹 사이트에 자주 사용되며 비즈니스를 위한 가장 전문적인 선택으로 간주됩니다.', 89, 'kr'),
(889, '.org TLD는 일반적으로 비영리 조직 및 교육 기관에서 사용합니다. 이러한 유형의 웹 사이트에 대해 더 신뢰할 수 있고 신뢰할 수 있는 선택으로 간주되는 경우가 많습니다.', 90, 'kr');
INSERT INTO `translate_page` (`id`, `translate`, `key_text_id`, `lang_code`) VALUES
(890, '.info TLD는 모든 유형의 웹사이트에 사용할 수 있는 일반 TLD입니다. 블로그 및 뉴스 사이트와 같은 정보 제공 웹사이트에 자주 사용됩니다.', 91, 'kr'),
(891, '기술 사양', 92, 'kr'),
(892, '당사의 도메인 서버는 고객에게 빠르고 안정적인 서비스를 제공하기 위해 최첨단 기술을 기반으로 구축되었습니다. 당사의 서버는 Intel Xeon 프로세서로 구동되며 DDR4 메모리를 사용하여 고성능과 짧은 대기 시간을 보장합니다. 서버는 여러 Tier-1 공급자에 대한 중복 연결을 통해 고속 네트워크에 연결됩니다.', 93, 'kr'),
(893, '제어판', 94, 'kr'),
(894, '저희 도메인 서버는 고객이 도메인, 이메일 계정 및 웹 호스팅 서비스를 쉽게 관리할 수 있는 업계 표준 제어판인 cPanel(저희가 수정)의 최신 버전을 실행하고 있습니다. 서버에도 최신 버전이 장착되어 있습니다. Apache 웹 서버, PHP 및 MySQL의 다양한 웹 애플리케이션 및 프레임워크를 지원합니다.', 95, 'kr'),
(895, '지원하다', 96, 'kr'),
(896, '우리는 연중무휴 24시간 서버를 모니터링하고 서버가 원활하게 실행되는지 확인할 수 있는 숙련된 시스템 관리자 팀을 보유하고 있습니다. 문제가 발생할 경우 우리 팀은 가능한 한 빨리 문제를 해결하기 위해 필요한 조치를 취할 것입니다.', 97, 'kr'),
(897, '더 알아보기', 98, 'kr'),
(898, '가장 적합한 <span class=\"text-primary\">메일링 서비스</span>를 선택하세요!', 99, 'kr'),
(899, '단일 메일 계정', 100, 'kr'),
(900, '당사의 기본 서비스는 이제 막 사업을 시작했으며 비즈니스 메일링을 위한 간단하고 안정적인 솔루션이 필요한 사람들에게 적합합니다.', 101, 'kr'),
(901, '개인화된 이메일 계정', 102, 'kr'),
(902, '기존 도메인에 추가', 103, 'kr'),
(903, '연중무휴 고객 지원', 104, 'kr'),
(904, '스팸 방지 및 바이러스 보호', 105, 'kr'),
(905, '메일 계정', 106, 'kr'),
(906, '년도', 107, 'kr'),
(907, '장바구니에 담기', 108, 'kr'),
(908, '전문 우편', 109, 'kr'),
(909, '당사의 고급 서비스는 더 복잡한 요구 사항이 있고 고급 기능과 리소스가 필요한 사용자에게 적합합니다.', 110, 'kr'),
(910, '사용자 지정 가능한 리소스 및 설정', 111, 'kr'),
(911, '고급 보안 기능', 112, 'kr'),
(912, '100% 광고 없음', 113, 'kr'),
(913, '그룹으로 작업하기 위한 통합 도구', 114, 'kr'),
(914, '메일 계정', 115, 'kr'),
(915, '선택', 116, 'kr'),
(916, '호스팅 서비스', 117, 'kr'),
(917, '당신에게 가장 적합한!', 118, 'kr'),
(918, '기본 서비스', 119, 'kr'),
(919, '당사의 기본 서비스는 이제 막 시작하여 도메인 및 호스팅 요구 사항에 대한 간단하고 안정적인 솔루션이 필요한 사용자에게 적합합니다.', 120, 'kr'),
(920, '저렴한 가격', 121, 'kr'),
(921, '사용하기 쉬운 제어판', 122, 'kr'),
(922, '연중무휴 고객 지원', 123, 'kr'),
(923, 'GB 무료 트래픽', 124, 'kr'),
(924, 'GB 용량', 125, 'kr'),
(925, '고급 서비스', 126, 'kr'),
(926, '당사의 고급 서비스는 더 복잡한 요구 사항이 있고 고급 기능과 리소스가 필요한 사용자에게 적합합니다.', 127, 'kr'),
(927, '사용자 지정 가능한 리소스 및 설정', 128, 'kr'),
(928, '고급 보안 기능', 129, 'kr'),
(929, '전용 IP 및 SSL 옵션', 130, 'kr'),
(930, '이름', 131, 'kr'),
(931, '당신의 이름을 입력', 132, 'kr'),
(932, '이메일을 입력하세요', 133, 'kr'),
(933, '사용자 이름', 134, 'kr'),
(934, '비밀번호', 135, 'kr'),
(935, '로그인', 136, 'kr'),
(936, '등록하다', 137, 'kr'),
(937, 'Google로 로그인', 138, 'kr'),
(938, '페이스북으로 로그인', 139, 'kr'),
(939, '비밀번호를 잊어 버렸습니까?', 140, 'kr'),
(940, '장바구니가 비어 있습니다.', 141, 'kr'),
(941, '나를 행복하게 만드는 것을 추가하십시오!', 142, 'kr'),
(942, '쇼핑을 계속', 143, 'kr'),
(943, '비밀번호 반복', 144, 'kr'),
(944, '이미 등록?', 145, 'kr'),
(945, '여기에서 로그인', 146, 'kr'),
(946, '등록되었습니다!', 147, 'kr'),
(947, '다음 주소로 이메일을 보냈습니다.', 148, 'kr'),
(948, '등록을 확인합니다. 받은편지함을 확인하세요.', 149, 'kr'),
(949, '홈페이지로 이동', 150, 'kr'),
(950, '지금 등록하세요!', 151, 'kr'),
(952, 'from', 152, 'en'),
(953, 'ab', 152, 'de'),
(954, 'a partir de', 152, 'es'),
(955, 'a partir de', 152, 'fr'),
(956, 'から', 152, 'jp'),
(957, '~에서', 152, 'kr'),
(958, 'Complete your personal data first', 153, 'en'),
(959, 'Complete now', 154, 'en'),
(960, 'You need to be logged in to purchase.', 155, 'en'),
(961, 'Vervollständigen Sie zuerst Ihre persönlichen Daten', 153, 'de'),
(962, 'Jetzt vervollständigen', 154, 'de'),
(963, 'Sie müssen eingeloggt sein, um einzukaufen.', 155, 'de'),
(964, 'Complete primero sus datos personales', 153, 'es'),
(965, 'Complete ahora', 154, 'es'),
(966, 'Necessita estar registrado para comprar.', 155, 'es'),
(967, 'Remplissez d\'abord vos données personnelles', 153, 'fr'),
(968, 'Terminer maintenant', 154, 'fr'),
(969, 'Vous devez être connecté pour acheter.', 155, 'fr'),
(970, '最初に個人データを完成させます', 153, 'jp'),
(971, '今すぐ完了', 154, 'jp'),
(972, '購入するにはログインが必要です。', 155, 'jp'),
(973, '먼저 개인 데이터를 작성하십시오', 153, 'kr'),
(974, '지금 완료', 154, 'kr'),
(975, '구매를 위해서는 로그인이 필요합니다.', 155, 'kr'),
(1603, 'Duration', 156, 'en'),
(1604, 'Zeitraum', 156, 'de'),
(1605, 'Duración', 156, 'es'),
(1606, 'Durée', 156, 'fr'),
(1607, '間隔', 156, 'jp'),
(1608, '지속', 156, 'kr'),
(1611, 'Add to list', 157, 'en'),
(1612, 'Zur liste', 157, 'de'),
(1613, 'Añadir a lista', 157, 'es'),
(1614, 'Ajouter à la liste', 157, 'fr'),
(1615, 'リストに追加する', 157, 'jp'),
(1616, '목록에 추가', 157, 'kr'),
(1618, 'Delete from list', 158, 'en'),
(1619, 'Von Liste entfernen', 158, 'de'),
(1620, 'Borrar de lista', 158, 'es'),
(1621, 'Supprimer de la liste', 158, 'fr'),
(1622, 'リストから削除', 158, 'jp'),
(1623, '목록에서 삭제', 158, 'kr'),
(1625, 'Choose your free', 159, 'en'),
(1626, 'domain', 160, 'en'),
(1627, 'Wählen Sie ihre', 159, 'de'),
(1628, 'Domain', 160, 'de'),
(1629, 'Elige su', 159, 'es'),
(1630, 'dominio', 160, 'es'),
(1631, 'Choisissez votre', 159, 'fr'),
(1632, ' domaine', 160, 'fr'),
(1633, 'ドメイン', 159, 'jp'),
(1634, 'を選択してください', 160, 'jp'),
(1635, '도메인을', 159, 'kr'),
(1636, '선택하세요', 160, 'kr'),
(1639, 'Hosting', 161, 'en'),
(1640, 'You have', 162, 'en'),
(1641, 'item(s) in your cart', 163, 'en'),
(1645, 'Hosting', 161, 'de'),
(1646, 'Sie haben', 162, 'de'),
(1647, 'Produkt(e) in Ihrem Einkaufswagen', 163, 'de'),
(1648, 'Hosting', 161, 'es'),
(1649, 'Tienes', 162, 'es'),
(1650, 'objeto(s) en tu carro de compras', 163, 'es'),
(1651, 'Hosting', 161, 'fr'),
(1652, 'Tu as', 162, 'fr'),
(1653, 'article(s) dans votre panier', 163, 'fr'),
(1654, 'ホスティング', 161, 'jp'),
(1655, 'あなたが持っている', 162, 'jp'),
(1656, 'カート内のアイテム', 163, 'jp'),
(1657, '호스팅', 161, 'kr'),
(1658, '당신은', 162, 'kr'),
(1659, '장바구니에 담긴 상품', 163, 'kr'),
(1660, 'The service you are trying to buy requires an associated domain. Please select one in use or buy a new one.', 164, 'en'),
(1661, 'Der Dienst, den Sie kaufen möchten, erfordert eine zugehörige Domain. Bitte wählen Sie eine in Gebrauch aus oder kaufen Sie eine neuen.', 164, 'de'),
(1662, 'El servicio que está intentando comprar requiere un dominio asociado. Seleccione uno en uso o compre uno nuevo.', 164, 'es'),
(1663, 'Le service que vous essayez d\'acheter nécessite un domaine associé. Veuillez en sélectionner un en cours d\'utilisation ou en acheter un nouveau.', 164, 'fr'),
(1664, '구입하려는 서비스에는 연결된 도메인이 필요합니다. 사용 중인 것을 선택하거나 새 것을 구입하십시오.', 164, 'kr'),
(1665, '購入しようとしているサービスには、関連付けられたドメインが必要です。 使用中のものを選択するか、新しいものを購入してください。', 164, 'jp'),
(1667, 'Order summary', 165, 'en'),
(1668, 'Bestellübersicht', 165, 'de'),
(1669, 'Resumen del pedido', 165, 'es'),
(1670, 'Récapitulatif de la commande', 165, 'fr'),
(1671, '注文の概要', 165, 'jp'),
(1672, '주문 요약', 165, 'kr'),
(2334, 'سياسة الخصوصية', 7, 'ar'),
(2335, 'نحن فريق صغير من الأفراد المتحمسين الذين يكرسون جهودهم لتقديم أفضل خدمة ممكنة. نحن نؤمن بالصدق والشفافية والذهاب إلى أبعد من ذلك للتأكد من رضا عملائنا.', 6, 'ar'),
(2336, 'اتصال', 2, 'ar'),
(2337, 'عن', 1, 'ar'),
(2338, 'حساب', 3, 'ar'),
(2339, 'عربة التسوق', 4, 'ar'),
(2340, 'شروط الخدمة', 8, 'ar'),
(2341, 'معلومات عنا', 5, 'ar'),
(2342, 'البحث عن المجالات', 10, 'ar'),
(2343, 'البحث والشراء', 11, 'ar'),
(2344, 'المجال المجاني الخاص بك', 12, 'ar'),
(2345, 'سياسة ملفات الارتباط', 9, 'ar'),
(2346, 'ابحث عن اسم المجال', 13, 'ar'),
(2347, 'يبحث', 14, 'ar'),
(2348, 'استضافة المجال', 15, 'ar'),
(2349, 'لماذا أخترتنا؟', 19, 'ar'),
(2350, 'حافظ على اسم المجال الخاص بك آمنًا ومأمونًا من خلال خدمات الاستضافة الموثوقة لدينا. سيساعدك فريق الخبراء لدينا في العثور على النطاق المثالي والحفاظ عليه يعمل بسلاسة.', 16, 'ar'),
(2351, 'لقد حصلت على تغطيتها', 17, 'ar'),
(2352, 'لا تقلق بشأن أي مشاكل قد تكون لديك. فريق الخبراء لدينا هنا لمساعدتك في أي مشكلة قد تواجهك', 18, 'ar'),
(2353, 'اشترك في نشرتنا الإخبارية', 21, 'ar'),
(2354, 'نحن نقدم أفضل الأسعار والأسعار في الصناعة. يعمل فريقنا بجد للتفاوض بشأن أفضل الصفقات لعملائنا ، مما يضمن حصولك على أفضل قيمة مقابل أموالك.', 20, 'ar'),
(2355, 'أدخل البريد الإلكتروني', 23, 'ar'),
(2356, 'أنك بالفعل مشترك.', 27, 'ar'),
(2357, 'شكرا لك على الاشتراك!', 25, 'ar'),
(2358, 'احصل على آخر الأخبار والتحديثات من فريقنا.', 22, 'ar'),
(2359, 'يرجى إدخال عنوان بريد إلكتروني صالح.', 26, 'ar'),
(2360, 'يشترك', 24, 'ar'),
(2361, 'يرجى إدخال عنوان بريد إلكتروني صالح.', 28, 'ar'),
(2362, 'عملنا', 31, 'ar'),
(2363, 'نحن فريق صغير من الأفراد المتحمسين الذين يكرسون جهودهم لتقديم أفضل خدمة ممكنة. نحن نؤمن بالصدق والشفافية والذهاب إلى أبعد من ذلك للتأكد من رضا عملائنا.', 30, 'ar'),
(2364, 'معلومات عنا', 29, 'ar'),
(2365, 'يركز عملنا على تقديم خدمات استضافة مجال عالية الجودة. لقد كنا في الصناعة لأكثر من 10 سنوات ولدينا سمعة طيبة من حيث الموثوقية ودعم العملاء الممتاز.', 32, 'ar'),
(2366, 'اتصل بنا', 33, 'ar'),
(2367, 'موقعنا', 40, 'ar'),
(2368, 'كنا نحب أن نسمع منك! يمكنك التواصل معنا عبر الهاتف على (123) 456-7890 أو عبر البريد الإلكتروني info@isphero.com.', 34, 'ar'),
(2369, 'نحن منفتحون من الاثنين إلى الجمعة من 9:00 صباحًا إلى 5:00 مساءً بتوقيت شرق الولايات المتحدة.', 36, 'ar'),
(2370, 'يقع مكتبنا في 1820 NW 56th St', 35, 'ar'),
(2371, 'مؤسس ISP Hero', 38, 'ar'),
(2372, 'فريقنا', 37, 'ar'),
(2373, 'كنا نحب أن نسمع منك! الرجاء استخدام النموذج أدناه لإرسال رسالة إلينا.', 39, 'ar'),
(2374, 'رسالة', 41, 'ar'),
(2375, 'يقع مكتبنا في 1820 NW 56th St', 43, 'ar'),
(2376, 'نحن منفتحون من الاثنين إلى الجمعة من 9:00 صباحًا إلى 5:00 مساءً بتوقيت شرق الولايات المتحدة.', 44, 'ar'),
(2377, 'أرسل رسالة', 42, 'ar'),
(2378, 'حلولك الرقمية', 45, 'ar'),
(2379, 'آمن ومرن', 47, 'ar'),
(2380, 'مستدام وقابل للتطوير', 46, 'ar'),
(2381, 'خدم العملاء', 50, 'ar'),
(2382, 'الخوادم على الإنترنت', 51, 'ar'),
(2383, 'المتعاونون', 52, 'ar'),
(2384, 'المختصة وقابلة للتخصيص', 48, 'ar'),
(2385, 'إنجليزي', 53, 'ar'),
(2386, 'مرحبًا بعودتك', 54, 'ar'),
(2387, 'حساب تعريفي', 56, 'ar'),
(2388, 'بيت', 55, 'ar'),
(2389, 'خدماتك', 59, 'ar'),
(2390, 'نشيط', 61, 'ar'),
(2391, 'تاريخ الانتهاء', 60, 'ar'),
(2392, 'منتظر', 58, 'ar'),
(2393, 'المجالات المسجلة', 49, 'ar'),
(2394, 'الفواتير', 57, 'ar'),
(2395, 'يمسح', 62, 'ar'),
(2396, 'لا', 63, 'ar'),
(2397, 'اسم العائلة', 67, 'ar'),
(2398, 'معلومات شخصية', 65, 'ar'),
(2399, 'نعم', 64, 'ar'),
(2400, 'الاسم الأول', 66, 'ar'),
(2401, 'الاسم الأخير الثاني', 68, 'ar'),
(2402, 'بريد إلكتروني', 69, 'ar'),
(2403, 'دولة', 70, 'ar'),
(2404, 'رمز بريدي', 74, 'ar'),
(2405, 'اختر الدولة', 71, 'ar'),
(2406, 'يحفظ', 76, 'ar'),
(2407, 'يحرر', 75, 'ar'),
(2408, 'مدينة', 72, 'ar'),
(2409, 'يلغي', 77, 'ar'),
(2410, 'عنوان', 73, 'ar'),
(2411, 'كلمة المرور القديمة', 79, 'ar'),
(2412, 'تغيير كلمة المرور', 78, 'ar'),
(2413, 'تأكيد كلمة المرور', 81, 'ar'),
(2414, 'معلومات الدفع', 83, 'ar'),
(2415, 'تغيير كلمة المرور', 82, 'ar'),
(2416, 'كلمة المرور الجديدة', 80, 'ar'),
(2417, 'ليس لديك أي أسماء نطاقات تنتظرها.', 84, 'ar'),
(2418, 'يتم إدارة نطاق .cat TLD بواسطة Fundació puntCAT ، وهي منظمة غير ربحية أنشأتها حكومة كاتالونيا ومجتمع الإنترنت في كتالونيا. إنه TLD مستقر وموثوق به ، وهو خيار جيد للشركات والمواقع الإلكترونية والأفراد الكتالونيين لأنه يمنحهم إحساسًا بالموقع والهوية والثقة.', 87, 'ar'),
(2419, 'إن .es هو نطاق TLD مشهور ، وهو خيار جيد للشركات والمواقع الإلكترونية والأفراد الإسبان لأنه يمنحهم إحساسًا بالموقع والهوية والثقة. إنه TLD مستقر وموثوق به ، مع دعم جيد وتدابير أمنية.', 86, 'ar'),
(2420, 'إن .tv هو TLD مخصص للاستخدام مع مواقع الويب المتعلقة بالتلفزيون. .tv هو رمز الدولة TLD لتوفالو ، وهي دولة جزرية صغيرة في المحيط الهادئ. ومع ذلك ، يتم تسويقه لاستخدامه في إنشاء مواقع الويب القائمة على الفيديو ومنصات البث ومواقع الويب الأخرى ذات الصلة بالوسائط.', 88, 'ar'),
(2421, 'ليس لديك أي خدمات.', 85, 'ar'),
(2422, 'يدعم', 96, 'ar'),
(2423, 'يعد .com TLD أكثر نطاقات المستوى الأعلى استخدامًا والمعترف بها في العالم. غالبًا ما يستخدم للمواقع التجارية ويعتبر الخيار الأكثر احترافًا للشركات.', 89, 'ar'),
(2424, 'عادةً ما يتم استخدام .org TLD بواسطة المنظمات غير الربحية والمؤسسات التعليمية. غالبًا ما يُعتبر خيارًا أكثر موثوقية ومصداقية لهذه الأنواع من مواقع الويب.', 90, 'ar'),
(2425, 'تعمل خوادم المجال الخاصة بنا على أحدث إصدار من لوحة التحكم المتوافقة مع معايير الصناعة ، cPanel (المعدلة من قبلنا) ، والتي تتيح للعملاء إدارة نطاقاتهم وحسابات البريد الإلكتروني وخدمات استضافة الويب بسهولة. تم تجهيز الخوادم أيضًا بأحدث إصدار من خادم الويب Apache و PHP و MySQL لدعم مجموعة واسعة من تطبيقات الويب وأطر العمل.', 95, 'ar'),
(2426, 'المواصفات الفنية', 92, 'ar'),
(2427, 'إن .info TLD هو TLD عام يمكن استخدامه لأي نوع من مواقع الويب. غالبًا ما يتم استخدامه لمواقع الويب المعلوماتية ، مثل المدونات والمواقع الإخبارية.', 91, 'ar'),
(2428, 'لوحة التحكم', 94, 'ar'),
(2429, 'تم بناء خوادم المجال الخاصة بنا على أحدث التقنيات لتقديم خدمة سريعة وموثوقة لعملائنا. يتم تشغيل خوادمنا بواسطة معالجات Intel Xeon وتستخدم ذاكرة DDR4 لضمان الأداء العالي والكمون المنخفض. الخوادم متصلة بشبكة عالية السرعة مع اتصالات متكررة بموفري Tier-1 متعددين', 93, 'ar'),
(2430, 'لدينا فريق من مسؤولي النظام ذوي الخبرة المتواجدين على مدار الساعة طوال أيام الأسبوع لمراقبة الخوادم والتأكد من أنها تعمل بسلاسة. في حالة وجود أي مشاكل ، سيتخذ فريقنا الإجراءات اللازمة لحلها في أسرع وقت ممكن.', 97, 'ar'),
(2431, 'يتعلم أكثر', 98, 'ar'),
(2432, 'قم بإضافته إلى المجالات الموجودة لديك', 103, 'ar'),
(2433, 'حساب بريد واحد', 100, 'ar'),
(2434, 'حساب بريد إلكتروني شخصي', 102, 'ar'),
(2435, 'خدمتنا الأساسية مثالية لأولئك الذين بدأوا للتو ويحتاجون إلى حل بسيط وموثوق به لإرسال بريد أعمالهم', 101, 'ar'),
(2436, 'حدد <span class=\"text-primary\">الخدمة البريدية</span> التي تناسبك أكثر!', 99, 'ar'),
(2437, 'بريد احترافي', 109, 'ar'),
(2438, '24/7 دعم العملاء', 104, 'ar'),
(2439, 'مكافحة البريد العشوائي وحماية الفيروسات', 105, 'ar'),
(2440, 'سنة', 107, 'ar'),
(2441, 'حساب (حسابات) البريد', 106, 'ar'),
(2442, 'أضف إلى السلة', 108, 'ar'),
(2443, 'ميزات الأمان المتقدمة', 112, 'ar'),
(2444, 'موارد وإعدادات قابلة للتخصيص', 111, 'ar'),
(2445, 'خدمتنا المتقدمة مثالية لأولئك الذين لديهم احتياجات أكثر تعقيدًا ويتطلبون ميزات وموارد أكثر تقدمًا.', 110, 'ar'),
(2446, 'أدوات متكاملة للعمل كمجموعة', 114, 'ar'),
(2447, 'خدمة استضافة', 117, 'ar'),
(2448, '100٪ خالية من الإعلانات', 113, 'ar'),
(2449, 'حدد ملف', 116, 'ar'),
(2450, 'حسابات البريد', 115, 'ar'),
(2451, '24/7 دعم العملاء', 123, 'ar'),
(2452, 'خدمتنا الأساسية مثالية لأولئك الذين بدأوا للتو ويحتاجون إلى حل بسيط وموثوق لنطاقهم واحتياجات الاستضافة.', 120, 'ar'),
(2453, 'لوحة تحكم سهلة الاستخدام', 122, 'ar'),
(2454, 'جيجا بايت حركة مرور مجانية', 124, 'ar'),
(2455, 'الخدمة الأساسية', 119, 'ar'),
(2456, 'الذي يناسبك أكثر!', 118, 'ar'),
(2457, 'خدمة متقدمة', 126, 'ar'),
(2458, 'سعة جيجابايت', 125, 'ar'),
(2459, 'خيارات IP و SSL مخصصة', 130, 'ar'),
(2460, 'ميزات الأمان المتقدمة', 129, 'ar'),
(2461, 'موارد وإعدادات قابلة للتخصيص', 128, 'ar'),
(2462, 'التسعير في متناول الجميع', 121, 'ar'),
(2463, 'أدخل أسمك', 132, 'ar'),
(2464, 'خدمتنا المتقدمة مثالية لأولئك الذين لديهم احتياجات أكثر تعقيدًا ويتطلبون ميزات وموارد أكثر تقدمًا.', 127, 'ar'),
(2465, 'تسجيل الدخول', 136, 'ar'),
(2466, 'تسجيل الدخول عبر جوجل', 138, 'ar'),
(2467, 'اسم', 131, 'ar'),
(2468, 'اسم المستخدم', 134, 'ar'),
(2469, 'كلمة المرور', 135, 'ar'),
(2470, 'أدخل بريدك الإلكتروني', 133, 'ar'),
(2471, 'يسجل', 137, 'ar'),
(2472, 'عربة التسوق فارغة', 141, 'ar'),
(2473, 'نسيت كلمة السر؟', 140, 'ar'),
(2474, 'أضف شيئًا لتجعلني سعيدًا!', 142, 'ar'),
(2475, 'اعد كلمة السر', 144, 'ar'),
(2476, 'تسجيل الدخول باستخدام الفيسبوك', 139, 'ar'),
(2477, 'مواصلة التسوق', 143, 'ar'),
(2478, 'مسجل بالفعل؟', 145, 'ar'),
(2479, 'لتأكيد تسجيلك. يرجى التحقق من البريد الوارد الخاص بك.', 149, 'ar'),
(2480, 'انت تملك حساب مصرفي!', 147, 'ar'),
(2481, 'لقد أرسلنا لك بريدًا إلكترونيًا إلى', 148, 'ar'),
(2482, 'تسجيل الدخول من هنا', 146, 'ar'),
(2483, 'أكمل بياناتك الشخصية أولاً', 153, 'ar'),
(2484, 'اذهب إلى الصفحة الرئيسية', 150, 'ar'),
(2485, 'سجل الان!', 151, 'ar'),
(2486, 'أكمل الآن', 154, 'ar'),
(2487, 'من', 152, 'ar'),
(2488, 'تحتاج إلى تسجيل الدخول للشراء.', 155, 'ar'),
(2489, 'حذف من القائمة', 158, 'ar'),
(2490, 'أضف إلى القائمة', 157, 'ar'),
(2491, 'مدة', 156, 'ar'),
(2492, 'اختر الخاص بك مجانا', 159, 'ar'),
(2493, 'اِختِصاص', 160, 'ar'),
(2494, 'لديك', 162, 'ar'),
(2495, 'الوحدات الموجودة فى سلة التسوق الخاصة بك', 163, 'ar'),
(2496, 'الخدمة التي تحاول شراءها تتطلب مجالًا مرتبطًا. الرجاء تحديد واحدة قيد الاستخدام أو شراء واحدة جديدة.', 164, 'ar'),
(2497, 'الاستضافة', 161, 'ar'),
(2498, 'ملخص الطلب', 165, 'ar');

-- --------------------------------------------------------

--
-- Estructura de la taula `translate_product`
--

CREATE TABLE `translate_product` (
  `id` bigint NOT NULL,
  `translation` varchar(255) DEFAULT NULL,
  `lang_code` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `translate_product`
--

INSERT INTO `translate_product` (`id`, `translation`, `lang_code`, `product_id`) VALUES
(1, 'avanzado', 'es', 6),
(2, 'advanse', 'fr', 6),
(4, 'deuch', 'de', 6);

-- --------------------------------------------------------

--
-- Estructura de la taula `translate_property`
--

CREATE TABLE `translate_property` (
  `id` bigint NOT NULL,
  `translation` varchar(255) DEFAULT NULL,
  `lang_code` varchar(255) DEFAULT NULL,
  `property_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `translate_value_property`
--

CREATE TABLE `translate_value_property` (
  `id` bigint NOT NULL,
  `translation` varchar(255) DEFAULT NULL,
  `article_id` bigint DEFAULT NULL,
  `lang_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `user`
--

CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `role`, `username`, `verified`) VALUES
(1, 'nofre1@gmail.com', '$2a$10$NlqQhMDKvHTXfyk3qN8J7uy1USUC0gshgWGgSig9m9uC8K9Alm.sK', 'ADMIN', 'nofre', 1),
(19, 'alexanderwitt97@gmail.co', '$2a$10$YBTfH/1PHiK3IHTCLG8FbORQHDIJfyPAO2PjJWUMMIDxvHZ3JWAta', 'ADMIN', 'admin', 1),
(29, 'nofre1@gmail.com', '$2a$10$KHYikQ1Nk7B9XVAoTftF2ORdUBT9mtsPgspNV4FCYcPG1DUVfW2SO', 'USER', 'nofre2', 1),
(42, 'seba85295@gmail.com', '$2a$10$QjGOo9YEuHX7Arn3QxQCaeQmXbFKURhAfkvs9NrIhm2B9uiPHPVJ6', 'USER', 'KajikaV', 0),
(44, 'apex24@web.de', '$2a$10$tcQhq56dfsYN2CkththsE.ANeE4rM6a5c1RLjMKjcCk4lZUVB5Rj2', 'USER', 'apex24', 0),
(69, 'BESTACCOUNT@NAME.YEAH', NULL, 'USER', 'BESTACCOUNTID', 0),
(81, 'melmakioui14050@alumnes.iesmanacor.cat', NULL, 'USER', 'mohamela', 0),
(91, 'baumwollexbox@outlook.com', '$2a$10$SH.TobX6jlz1tH55fDhRDu7SJbFW/6iVXVyZFqTnNpJBpR9Z50kVe', 'USER', 'baumwolle', 1),
(95, 'rexhdt7@gmail.com', '$2a$10$oBJnWsfxwXOIEHSRlyx2kur.4MXyndYeud3QnulwGXQz3dB8ZDpGO', 'USER', 'MisterGatito', 1),
(103, 'nofreruizsalom1@gmail.com', NULL, 'USER', 'nofreruizsalom', 1),
(108, 'alexanderwitt97@gmail.com', NULL, 'ADMIN', 'alexanderwitt97', 1),
(109, 'awitt15316@alumnes.iesmanacor.cat', NULL, 'ADMIN', 'awitt15316', 1),
(110, 'jcrespi@iesmanacor.cat', '$2a$10$sUifa69TgugJIfLpnBo3muuBhmFQlqyjyR9epopWST4i4WwmabJ0O', 'ADMIN', 'joana', 1),
(111, 'jgalmes1@iesmanacor.cat', '$2a$10$1SyEJ0ok31euoLhzvL0N6eVaLAd8hcOlwbrs0MQWttcBm/jkxwWjG', 'USER', 'jgalmes', 1),
(113, 'nofreruizsalom@gmail.com', '$2a$10$ENfmR1oZJ1XrYb58iwFSU.6iWlQj38Gw1WQDO0uOGoDDOO2821MuO', 'USER', 'nofre01', 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `user_data`
--

CREATE TABLE `user_data` (
  `id` bigint NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postal_code` varchar(15) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name1` varchar(255) DEFAULT NULL,
  `last_name2` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `country` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `user_data`
--

INSERT INTO `user_data` (`id`, `address`, `city`, `postal_code`, `first_name`, `last_name1`, `last_name2`, `user_id`, `country`) VALUES
(1, 'Avinguda Santa Eulalia 6', 'Can Picafort', '07458', 'Alexander', 'Witt', '', 19, NULL),
(2, 'Ramiro de Maeztu n20', 'Manacor', '07500', 'Nofre', 'Ruiz', 'Salom', 1, NULL),
(13, 'Hauptstrasse 11', 'Berlin', '11499', 'Can', 'Caman', NULL, 44, 'Germany'),
(16, 'j', 'j', NULL, 'asd', 'dasaj', NULL, NULL, NULL),
(26, 'BEST ADDRESS', 'BEST CITY', '69696', 'BEST', 'ACCOUNT', NULL, 69, NULL),
(37, NULL, 'ITALIAAA', NULL, 'Sebastiano', NULL, NULL, 42, NULL),
(39, 'No lo se', 'Palma', '07004', 'Mohamed', 'Makioui', NULL, 81, NULL),
(45, NULL, NULL, NULL, 'Felipe', NULL, NULL, 95, NULL),
(52, 'Avenida Santa Eulalia 6', 'Can Picafort', '07458', 'Alexander', 'Witt', '', 108, NULL),
(53, NULL, NULL, NULL, NULL, NULL, NULL, 109, NULL),
(54, 'Carrer Major 12', 'Sa Pobla', '07420', 'Joana', 'Crespi', 'Capo', 110, NULL),
(55, 'ranfdsa', 'manacor', '07500', 'joan', 'fas', 'fdsa', 29, NULL),
(56, 'asd', 'asd', '023123', 'Nofre', 'asd', 'asd', 113, NULL);

-- --------------------------------------------------------

--
-- Estructura de la taula `waiting_domain`
--

CREATE TABLE `waiting_domain` (
  `id` bigint NOT NULL,
  `name_domain` varchar(255) DEFAULT NULL,
  `tld_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `waiting_domain`
--

INSERT INTO `waiting_domain` (`id`, `name_domain`, `tld_id`, `user_id`) VALUES
(24, 'miquel', 1, 19);

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbxy24ht14wxvuhu2fo3w4de3b` (`product_id`),
  ADD KEY `FK8me2wm9ydxpp1xxj4n6041vac` (`property_id`),
  ADD KEY `FKsyk3qpva81ee9m8xkjkxllrmw` (`article_father_id`);

--
-- Índexs per a la taula `article_domains`
--
ALTER TABLE `article_domains`
  ADD KEY `FKn4eywqwlvt7e4s4bcxdihri3g` (`domains_id`),
  ADD KEY `FKdt81n97ffuifwo4eyy671pvct` (`tlds_id`);

--
-- Índexs per a la taula `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbbipvkktfj58jxo45dwup3hu6` (`category_father_id`);

--
-- Índexs per a la taula `category_categories_children`
--
ALTER TABLE `category_categories_children`
  ADD UNIQUE KEY `UK_mbunnxk5qrgre0t28sm8upnp2` (`categories_children_id`),
  ADD KEY `FKiuj5nv3gsi73283jrxh61hoot` (`category_id`);

--
-- Índexs per a la taula `domain_registered`
--
ALTER TABLE `domain_registered`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjunvl5maki3unqdvljk31kns3` (`user_id`);

--
-- Índexs per a la taula `invoice_line`
--
ALTER TABLE `invoice_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfnwks1ouvwbttl0fklxsem7ik` (`invoice_id`);

--
-- Índexs per a la taula `key_text`
--
ALTER TABLE `key_text`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `lang`
--
ALTER TABLE `lang`
  ADD PRIMARY KEY (`code`);

--
-- Índexs per a la taula `news_letter`
--
ALTER TABLE `news_letter`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índexs per a la taula `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índexs per a la taula `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índexs per a la taula `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índexs per a la taula `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índexs per a la taula `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índexs per a la taula `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índexs per a la taula `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índexs per a la taula `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índexs per a la taula `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índexs per a la taula `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índexs per a la taula `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índexs per a la taula `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índexs per a la taula `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índexs per a la taula `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índexs per a la taula `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índexs per a la taula `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índexs per a la taula `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- Índexs per a la taula `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`);

--
-- Índexs per a la taula `product_articles`
--
ALTER TABLE `product_articles`
  ADD UNIQUE KEY `UK_8tleigdirhjxcia35m4hhwnya` (`articles_id`),
  ADD KEY `FK18qu1i56gdqqad63k0fm9e2v1` (`product_id`);

--
-- Índexs per a la taula `profile_img`
--
ALTER TABLE `profile_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKwme7jnpu7rnvrehh5hgh5ant` (`user_id`);

--
-- Índexs per a la taula `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK776gkfh466s5se74tnbmc77ke` (`article_id`),
  ADD KEY `FK21kefim0cvfxud7lrcnxctq9r` (`user_id`);

--
-- Índexs per a la taula `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `translate_category`
--
ALTER TABLE `translate_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfnc8a5v59erlb80f8o2ifui0` (`category_id`),
  ADD KEY `FK7ag5d9ty2bsfqu0ja71a15fb0` (`lang_code`);

--
-- Índexs per a la taula `translate_page`
--
ALTER TABLE `translate_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3krsrepot113flawwnyibyfx8` (`key_text_id`),
  ADD KEY `FK1mnqgf0ipn7x0rux52jqiqjwf` (`lang_code`);

--
-- Índexs per a la taula `translate_product`
--
ALTER TABLE `translate_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6tu4yg2jcws11tb4goo5kb9rn` (`lang_code`),
  ADD KEY `FKe6dmo0xy30t0y8i56ca1arwwk` (`product_id`);

--
-- Índexs per a la taula `translate_property`
--
ALTER TABLE `translate_property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhydsbsa0bmvyio9tj58nrq3sg` (`lang_code`),
  ADD KEY `FKosx9md655m4j0kctcpa7t5pby` (`property_id`);

--
-- Índexs per a la taula `translate_value_property`
--
ALTER TABLE `translate_value_property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmpcw6ds0vihd1cp1xftc9dyaq` (`article_id`),
  ADD KEY `FKk5jbuvtijuqpysviyagd9mn34` (`lang_code`);

--
-- Índexs per a la taula `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKelmpammgqm7p72tyao7p2vb00` (`user_id`);

--
-- Índexs per a la taula `waiting_domain`
--
ALTER TABLE `waiting_domain`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK59jbap8oxrj1abu9b2md4m6od` (`user_id`),
  ADD KEY `FKp54bu6ex6u7yqbonlyw2ie6x4` (`tld_id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `article`
--
ALTER TABLE `article`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT per la taula `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `domain_registered`
--
ALTER TABLE `domain_registered`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT per la taula `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT per la taula `invoice_line`
--
ALTER TABLE `invoice_line`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT per la taula `key_text`
--
ALTER TABLE `key_text`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT per la taula `news_letter`
--
ALTER TABLE `news_letter`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT per la taula `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la taula `profile_img`
--
ALTER TABLE `profile_img`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la taula `property`
--
ALTER TABLE `property`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la taula `service`
--
ALTER TABLE `service`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT per la taula `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la taula `translate_category`
--
ALTER TABLE `translate_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `translate_page`
--
ALTER TABLE `translate_page`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2499;

--
-- AUTO_INCREMENT per la taula `translate_product`
--
ALTER TABLE `translate_product`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la taula `translate_property`
--
ALTER TABLE `translate_property`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `translate_value_property`
--
ALTER TABLE `translate_value_property`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT per la taula `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT per la taula `waiting_domain`
--
ALTER TABLE `waiting_domain`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK8me2wm9ydxpp1xxj4n6041vac` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`),
  ADD CONSTRAINT `FKbxy24ht14wxvuhu2fo3w4de3b` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKoworj0q3r2l2whjn7lp9pxg42` FOREIGN KEY (`article_father_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FKsyk3qpva81ee9m8xkjkxllrmw` FOREIGN KEY (`article_father_id`) REFERENCES `article` (`id`);

--
-- Restriccions per a la taula `article_domains`
--
ALTER TABLE `article_domains`
  ADD CONSTRAINT `FKdt81n97ffuifwo4eyy671pvct` FOREIGN KEY (`tlds_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FKn4eywqwlvt7e4s4bcxdihri3g` FOREIGN KEY (`domains_id`) REFERENCES `domain_registered` (`id`);

--
-- Restriccions per a la taula `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FKbbipvkktfj58jxo45dwup3hu6` FOREIGN KEY (`category_father_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FKhf2iwn0rceoqmwirls0jpnejk` FOREIGN KEY (`category_father_id`) REFERENCES `category` (`id`);

--
-- Restriccions per a la taula `category_categories_children`
--
ALTER TABLE `category_categories_children`
  ADD CONSTRAINT `FKiuj5nv3gsi73283jrxh61hoot` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FKmi6m6sqfuxeg0srdekegg11aj` FOREIGN KEY (`categories_children_id`) REFERENCES `category` (`id`);

--
-- Restriccions per a la taula `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `FKjunvl5maki3unqdvljk31kns3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Restriccions per a la taula `invoice_line`
--
ALTER TABLE `invoice_line`
  ADD CONSTRAINT `FKfnwks1ouvwbttl0fklxsem7ik` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`);

--
-- Restriccions per a la taula `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Restriccions per a la taula `product_articles`
--
ALTER TABLE `product_articles`
  ADD CONSTRAINT `FK18qu1i56gdqqad63k0fm9e2v1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKc6wbhpm48r7oj2hojltgf4a9g` FOREIGN KEY (`articles_id`) REFERENCES `article` (`id`);

--
-- Restriccions per a la taula `profile_img`
--
ALTER TABLE `profile_img`
  ADD CONSTRAINT `FKwme7jnpu7rnvrehh5hgh5ant` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Restriccions per a la taula `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `FK21kefim0cvfxud7lrcnxctq9r` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK776gkfh466s5se74tnbmc77ke` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

--
-- Restriccions per a la taula `translate_category`
--
ALTER TABLE `translate_category`
  ADD CONSTRAINT `FK7ag5d9ty2bsfqu0ja71a15fb0` FOREIGN KEY (`lang_code`) REFERENCES `lang` (`code`),
  ADD CONSTRAINT `FKfnc8a5v59erlb80f8o2ifui0` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Restriccions per a la taula `translate_page`
--
ALTER TABLE `translate_page`
  ADD CONSTRAINT `FK1mnqgf0ipn7x0rux52jqiqjwf` FOREIGN KEY (`lang_code`) REFERENCES `lang` (`code`),
  ADD CONSTRAINT `FK3krsrepot113flawwnyibyfx8` FOREIGN KEY (`key_text_id`) REFERENCES `key_text` (`id`);

--
-- Restriccions per a la taula `translate_product`
--
ALTER TABLE `translate_product`
  ADD CONSTRAINT `FK6tu4yg2jcws11tb4goo5kb9rn` FOREIGN KEY (`lang_code`) REFERENCES `lang` (`code`),
  ADD CONSTRAINT `FKe6dmo0xy30t0y8i56ca1arwwk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Restriccions per a la taula `translate_property`
--
ALTER TABLE `translate_property`
  ADD CONSTRAINT `FKhydsbsa0bmvyio9tj58nrq3sg` FOREIGN KEY (`lang_code`) REFERENCES `lang` (`code`),
  ADD CONSTRAINT `FKosx9md655m4j0kctcpa7t5pby` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`);

--
-- Restriccions per a la taula `translate_value_property`
--
ALTER TABLE `translate_value_property`
  ADD CONSTRAINT `FKk5jbuvtijuqpysviyagd9mn34` FOREIGN KEY (`lang_code`) REFERENCES `lang` (`code`),
  ADD CONSTRAINT `FKmpcw6ds0vihd1cp1xftc9dyaq` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

--
-- Restriccions per a la taula `user_data`
--
ALTER TABLE `user_data`
  ADD CONSTRAINT `FKelmpammgqm7p72tyao7p2vb00` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Restriccions per a la taula `waiting_domain`
--
ALTER TABLE `waiting_domain`
  ADD CONSTRAINT `FK59jbap8oxrj1abu9b2md4m6od` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKa82n7act1vlfbjbatn578t9po` FOREIGN KEY (`tld_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FKp54bu6ex6u7yqbonlyw2ie6x4` FOREIGN KEY (`tld_id`) REFERENCES `article` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
