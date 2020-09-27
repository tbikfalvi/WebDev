
-- --------------------------------------------------------

CREATE TABLE `jatekszervezes_hasznos` (
  `post_id` mediumint(8) unsigned NOT NULL auto_increment,
  `ertek` mediumint(8) NOT NULL default '0',
  PRIMARY KEY  (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=400295 ;

-- --------------------------------------------------------

CREATE TABLE `jatekszervezes_Hasznos_szav` (
  `haszsz_id` mediumint(10) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `post_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`haszsz_id`),
  UNIQUE KEY `hssz_user_id` (`user_id`,`post_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=191 ;

-- --------------------------------------------------------

CREATE TABLE `jatekszervezes_Nem_hasznos_szav` (
  `haszsz_id` mediumint(10) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `post_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`haszsz_id`),
  UNIQUE KEY `hssz_user_id` (`user_id`,`post_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=93 ;

-- --------------------------------------------------------

CREATE TABLE `jatekszervezes_Szervez` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `GameDate` date NOT NULL,
  `GameEndDate` date default NULL,
  `Fee` mediumint(6) unsigned NOT NULL default '0',
  `BattleField` varchar(50) character set utf8 collate utf8_bin NOT NULL,
  `Closed` char(1) collate latin1_general_ci NOT NULL default 'N',
  `PlayerNr` mediumint(6) default NULL,
  `jelplayernr` mediumint(6) default '0',
  `szervezo` varchar(50) character set utf8 collate utf8_bin default NULL,
  `kontakt` varchar(100) character set utf8 collate utf8_bin default NULL,
  `gateopen` varchar(20) character set utf8 collate utf8_bin default NULL,
  `gamestart` varchar(20) character set utf8 collate utf8_bin default NULL,
  `gameend` varchar(20) character set utf8 collate utf8_bin default NULL,
  `rules` varchar(100) character set utf8 collate utf8_bin default NULL,
  `imagelink` varchar(100) character set utf8 collate utf8_bin default NULL,
  `gps` varchar(50) character set utf8 collate utf8_bin default NULL,
  `maplink` varchar(200) character set utf8 collate utf8_bin default NULL,
  `minimum` mediumint(3) default NULL,
  `kotelezo` varchar(200) character set utf8 collate utf8_bin default NULL,
  `ajanlott` varchar(200) character set utf8 collate utf8_bin default NULL,
  `pluszfo` char(1) character set utf8 collate utf8_bin NOT NULL default 'N',
  `tarsszervezo` varchar(255) character set utf8 collate utf8_bin NOT NULL,
  PRIMARY KEY  (`topic_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

CREATE TABLE `jatekszervezes_Sides` (
  `side_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `side_name` varchar(50) character set utf8 collate utf8_bin NOT NULL,
  `side_open` char(1) character set utf8 collate utf8_bin NOT NULL default 'Y',
  `side_player` mediumint(5) NOT NULL default '0',
  PRIMARY KEY  (`side_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3335 ;

-- --------------------------------------------------------

CREATE TABLE `jatekszervezes_jelentk` (
  `signup_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `weap_m` varchar(30) character set utf8 collate utf8_bin NOT NULL,
  `fps_m` mediumint(3) unsigned default '0',
  `weap_s` varchar(30) character set utf8 collate utf8_bin NOT NULL,
  `fps_s` mediumint(3) unsigned default '0',
  `side` mediumint(10) unsigned default '0',
  `transport` tinyint(1) unsigned default '0',
  `tfrom` varchar(50) character set utf8 collate utf8_bin NOT NULL,
  `tcap` tinyint(2) unsigned default '0',
  `team` varchar(30) character set utf8 collate utf8_bin NOT NULL,
  `extra_player` tinyint(2) unsigned default '0',
  `remark` varchar(100) character set utf8 collate utf8_bin default NULL,
  `status` tinyint(1) unsigned default '0',
  `jdate` date default NULL,
  `platoon` varchar(30) character set utf8 collate utf8_bin default NULL,
  `sort` tinyint(2) default NULL,
  `reg_accept` char(1) character set utf8 collate utf8_bin NOT NULL default 'N',
  PRIMARY KEY  (`signup_id`),
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=50286 ;

-- --------------------------------------------------------

CREATE TABLE `jatekszervezes_feherlista` (
  `list_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `sender_id` mediumint(8) unsigned NOT NULL default '0',
  `add_date` date default NULL,
  `remark` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`list_id`),
  KEY `sender_id` (`sender_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=38 ;

-- --------------------------------------------------------

CREATE TABLE `jatekszervezes_feketelista` (
  `list_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `sender_id` mediumint(8) unsigned NOT NULL default '0',
  `add_date` date default NULL,
  `remark` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`list_id`),
  KEY `sender_id` (`sender_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=142 ;

-- --------------------------------------------------------

CREATE TABLE `jatekszervezes_sites` (
  `site_id` mediumint(5) NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL,
  `lat` float NOT NULL,
  `longt` float NOT NULL,
  `tipus` varchar(20) character set utf8 collate utf8_bin NOT NULL,
  `email` varchar(50) character set utf8 collate utf8_bin NOT NULL,
  `telefon` varchar(20) collate latin1_general_ci NOT NULL,
  `nev` varchar(100) character set utf8 collate utf8_bin NOT NULL,
  `terkep_link` varchar(150) collate latin1_general_ci NOT NULL,
  `met` varchar(100) collate latin1_general_ci NOT NULL default 'Budapest',
  PRIMARY KEY  (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

CREATE TABLE `jatekszervezes_profile_fields_data` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `pf_fegyvereim` text collate utf8_bin,
  `pf_felszerelesem` text collate utf8_bin,
  `pf_jatekstilus` mediumint(8) default NULL,
  `pf_airsoftozokezota` varchar(10) collate utf8_bin default NULL,
  `pf_elodleges` varchar(255) collate utf8_bin default NULL,
  `pf_masodlagos` varchar(255) collate utf8_bin default NULL,
  `pf_elodleges_fps` bigint(20) default NULL,
  `pf_masodlagos_fps` bigint(20) default NULL,
  `pf_csapattagsag` varchar(255) collate utf8_bin default NULL,
  `pf_longt` varchar(255) collate utf8_bin default NULL,
  `pf_lat` varchar(255) collate utf8_bin default NULL,
  `pf_minimalmod` tinyint(2) default NULL,
  `pf_autojel` tinyint(2) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

