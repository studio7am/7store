CREATE TABLE IF NOT EXISTS `oc_circloid_custom_admin_page` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `page_route` text NOT NULL,
  `user` int(1) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

INSERT INTO `oc_circloid_custom_admin_page` (`id`, `page_route`, `user`, `status`) VALUES
(1, 'module/pavblog/category', 1, 1),
(2, 'module/pavproductcarousel', 1, 1),
(3, 'module/themecontrol', 1, 1),
(4, 'module/pavblog', 1, 1),
(5, 'module/pavblog/frontmodules', 1, 1),
(6, 'module/pavcontentslider', 1, 1),
(7, 'module/pavcustom', 1, 1),
(8, 'module/pavmegamenubase', 1, 1),
(9, 'module/pavnewsletter', 1, 1);