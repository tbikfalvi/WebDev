-- phpMyAdmin SQL Dump
-- version 2.10.0.2
-- http://www.phpmyadmin.net
-- 
-- Hoszt: localhost
-- Létrehozás ideje: 2014. Máj 27. 12:40
-- Szerver verzió: 5.0.51
-- PHP Verzió: 5.2.6-1+lenny16

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Adatbázis: `airsoft`
-- 

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `hasznos`
-- 

CREATE TABLE `hasznos` (
  `post_id` mediumint(8) unsigned NOT NULL auto_increment,
  `ertek` mediumint(8) NOT NULL default '0',
  PRIMARY KEY  (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=400295 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `jelentk_old`
-- 

CREATE TABLE `jelentk_old` (
  `signup_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `weap` varchar(30) character set utf8 collate utf8_bin NOT NULL,
  `fps` mediumint(3) unsigned default '0',
  `side` tinyint(1) unsigned default '0',
  `transport` tinyint(1) unsigned default '0',
  `tfrom` varchar(50) character set utf8 collate utf8_bin NOT NULL,
  `tcap` tinyint(2) unsigned default '0',
  `team` varchar(30) character set utf8 collate utf8_bin NOT NULL,
  `status` tinyint(1) unsigned default '0',
  `jdate` date default NULL,
  `platoon` varchar(30) character set utf8 collate utf8_bin default NULL,
  `sort` tinyint(1) default NULL,
  `paid` char(1) character set utf8 collate utf8_bin default NULL,
  PRIMARY KEY  (`signup_id`),
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25520 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `Nem_hasznos_szav`
-- 

CREATE TABLE `Nem_hasznos_szav` (
  `haszsz_id` mediumint(10) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `post_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`haszsz_id`),
  UNIQUE KEY `hssz_user_id` (`user_id`,`post_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=93 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_acl_groups`
-- 

CREATE TABLE `phpbb3test_acl_groups` (
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  KEY `group_id` (`group_id`),
  KEY `auth_opt_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_acl_options`
-- 

CREATE TABLE `phpbb3test_acl_options` (
  `auth_option_id` mediumint(8) unsigned NOT NULL auto_increment,
  `auth_option` varchar(50) collate utf8_bin NOT NULL default '',
  `is_global` tinyint(1) unsigned NOT NULL default '0',
  `is_local` tinyint(1) unsigned NOT NULL default '0',
  `founder_only` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`auth_option_id`),
  UNIQUE KEY `auth_option` (`auth_option`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=121 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_acl_roles`
-- 

CREATE TABLE `phpbb3test_acl_roles` (
  `role_id` mediumint(8) unsigned NOT NULL auto_increment,
  `role_name` varchar(255) collate utf8_bin NOT NULL default '',
  `role_description` text collate utf8_bin NOT NULL,
  `role_type` varchar(10) collate utf8_bin NOT NULL default '',
  `role_order` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`role_id`),
  KEY `role_type` (`role_type`),
  KEY `role_order` (`role_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_acl_roles_data`
-- 

CREATE TABLE `phpbb3test_acl_roles_data` (
  `role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`role_id`,`auth_option_id`),
  KEY `ath_op_id` (`auth_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_acl_users`
-- 

CREATE TABLE `phpbb3test_acl_users` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  KEY `user_id` (`user_id`),
  KEY `auth_option_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_am_options`
-- 

CREATE TABLE `phpbb3test_am_options` (
  `am_option_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `am_option_text` text collate utf8_bin NOT NULL,
  `am_option_max` tinyint(5) unsigned NOT NULL default '0',
  `am_option_color` varchar(6) collate utf8_bin NOT NULL default '000000',
  PRIMARY KEY  (`am_option_id`),
  KEY `am_topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_am_presets`
-- 

CREATE TABLE `phpbb3test_am_presets` (
  `am_preset_id` mediumint(8) unsigned NOT NULL auto_increment,
  `am_preset_name` varchar(50) collate utf8_bin NOT NULL default '0',
  `am_length` int(11) unsigned NOT NULL default '0',
  `am_visible` tinyint(1) NOT NULL default '0',
  `am_confirmable` tinyint(1) NOT NULL default '0',
  `am_reg_change` tinyint(1) NOT NULL default '0',
  `am_layout` tinyint(2) NOT NULL default '0',
  `am_option_text` text collate utf8_bin NOT NULL,
  `am_option_max` text collate utf8_bin NOT NULL,
  `am_option_color` text collate utf8_bin NOT NULL,
  `am_preset_order` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`am_preset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_am_registrations`
-- 

CREATE TABLE `phpbb3test_am_registrations` (
  `am_registration_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `am_option_id` mediumint(8) unsigned NOT NULL default '0',
  `am_user_id` mediumint(8) unsigned NOT NULL default '0',
  `am_user_ip` varchar(40) collate utf8_bin NOT NULL default '0',
  `am_registration_time` int(11) NOT NULL default '0',
  `am_registration_confirmed` int(11) NOT NULL default '0',
  PRIMARY KEY  (`am_registration_id`),
  KEY `am_option_id` (`am_option_id`,`am_user_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_attachments`
-- 

CREATE TABLE `phpbb3test_attachments` (
  `attach_id` mediumint(8) unsigned NOT NULL auto_increment,
  `post_msg_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `in_message` tinyint(1) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) unsigned NOT NULL default '0',
  `is_orphan` tinyint(1) unsigned NOT NULL default '1',
  `physical_filename` varchar(255) collate utf8_bin NOT NULL default '',
  `real_filename` varchar(255) collate utf8_bin NOT NULL default '',
  `download_count` mediumint(8) unsigned NOT NULL default '0',
  `attach_comment` text collate utf8_bin NOT NULL,
  `extension` varchar(100) collate utf8_bin NOT NULL default '',
  `mimetype` varchar(100) collate utf8_bin NOT NULL default '',
  `filesize` int(20) unsigned NOT NULL default '0',
  `filetime` int(11) unsigned NOT NULL default '0',
  `thumbnail` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`attach_id`),
  KEY `filetime` (`filetime`),
  KEY `post_msg_id` (`post_msg_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `is_orphan` (`is_orphan`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_banlist`
-- 

CREATE TABLE `phpbb3test_banlist` (
  `ban_id` mediumint(8) unsigned NOT NULL auto_increment,
  `ban_userid` mediumint(8) unsigned NOT NULL default '0',
  `ban_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `ban_email` varchar(100) collate utf8_bin NOT NULL default '',
  `ban_start` int(11) unsigned NOT NULL default '0',
  `ban_end` int(11) unsigned NOT NULL default '0',
  `ban_exclude` tinyint(1) unsigned NOT NULL default '0',
  `ban_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `ban_give_reason` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`ban_id`),
  KEY `ban_end` (`ban_end`),
  KEY `ban_user` (`ban_userid`,`ban_exclude`),
  KEY `ban_email` (`ban_email`,`ban_exclude`),
  KEY `ban_ip` (`ban_ip`,`ban_exclude`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_bbcodes`
-- 

CREATE TABLE `phpbb3test_bbcodes` (
  `bbcode_id` tinyint(3) NOT NULL default '0',
  `bbcode_tag` varchar(16) collate utf8_bin NOT NULL default '',
  `bbcode_helpline` varchar(255) collate utf8_bin NOT NULL default '',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_match` text collate utf8_bin NOT NULL,
  `bbcode_tpl` mediumtext collate utf8_bin NOT NULL,
  `first_pass_match` mediumtext collate utf8_bin NOT NULL,
  `first_pass_replace` mediumtext collate utf8_bin NOT NULL,
  `second_pass_match` mediumtext collate utf8_bin NOT NULL,
  `second_pass_replace` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`bbcode_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_bookmarks`
-- 

CREATE TABLE `phpbb3test_bookmarks` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`topic_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_bots`
-- 

CREATE TABLE `phpbb3test_bots` (
  `bot_id` mediumint(8) unsigned NOT NULL auto_increment,
  `bot_active` tinyint(1) unsigned NOT NULL default '1',
  `bot_name` varchar(255) collate utf8_bin NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `bot_agent` varchar(255) collate utf8_bin NOT NULL default '',
  `bot_ip` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`bot_id`),
  KEY `bot_active` (`bot_active`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_config`
-- 

CREATE TABLE `phpbb3test_config` (
  `config_name` varchar(255) collate utf8_bin NOT NULL default '',
  `config_value` varchar(255) collate utf8_bin NOT NULL default '',
  `is_dynamic` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`config_name`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_confirm`
-- 

CREATE TABLE `phpbb3test_confirm` (
  `confirm_id` char(32) collate utf8_bin NOT NULL default '',
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  `confirm_type` tinyint(3) NOT NULL default '0',
  `code` varchar(8) collate utf8_bin NOT NULL default '',
  `seed` int(10) unsigned NOT NULL default '0',
  `attempts` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`,`confirm_id`),
  KEY `confirm_type` (`confirm_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_disallow`
-- 

CREATE TABLE `phpbb3test_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL auto_increment,
  `disallow_username` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`disallow_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_drafts`
-- 

CREATE TABLE `phpbb3test_drafts` (
  `draft_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `save_time` int(11) unsigned NOT NULL default '0',
  `draft_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `draft_message` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`draft_id`),
  KEY `save_time` (`save_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_extensions`
-- 

CREATE TABLE `phpbb3test_extensions` (
  `extension_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `extension` varchar(100) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=67 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_extension_groups`
-- 

CREATE TABLE `phpbb3test_extension_groups` (
  `group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `cat_id` tinyint(2) NOT NULL default '0',
  `allow_group` tinyint(1) unsigned NOT NULL default '0',
  `download_mode` tinyint(1) unsigned NOT NULL default '1',
  `upload_icon` varchar(255) collate utf8_bin NOT NULL default '',
  `max_filesize` int(20) unsigned NOT NULL default '0',
  `allowed_forums` text collate utf8_bin NOT NULL,
  `allow_in_pm` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_forums`
-- 

CREATE TABLE `phpbb3test_forums` (
  `forum_id` mediumint(8) unsigned NOT NULL auto_increment,
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `left_id` mediumint(8) unsigned NOT NULL default '0',
  `right_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_parents` mediumtext collate utf8_bin NOT NULL,
  `forum_name` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_desc` text collate utf8_bin NOT NULL,
  `forum_desc_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_desc_options` int(11) unsigned NOT NULL default '7',
  `forum_desc_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `forum_link` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_password` varchar(40) collate utf8_bin NOT NULL default '',
  `forum_style` mediumint(8) unsigned NOT NULL default '0',
  `forum_image` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules` text collate utf8_bin NOT NULL,
  `forum_rules_link` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules_options` int(11) unsigned NOT NULL default '7',
  `forum_rules_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `forum_topics_per_page` tinyint(4) NOT NULL default '0',
  `forum_type` tinyint(4) NOT NULL default '0',
  `forum_status` tinyint(4) NOT NULL default '0',
  `forum_posts` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics_real` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_poster_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_last_post_time` int(11) unsigned NOT NULL default '0',
  `forum_last_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_last_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `forum_flags` tinyint(4) NOT NULL default '32',
  `forum_options` int(20) unsigned NOT NULL default '0',
  `display_subforum_list` tinyint(1) unsigned NOT NULL default '1',
  `display_on_index` tinyint(1) unsigned NOT NULL default '1',
  `enable_indexing` tinyint(1) unsigned NOT NULL default '1',
  `enable_icons` tinyint(1) unsigned NOT NULL default '1',
  `enable_prune` tinyint(1) unsigned NOT NULL default '0',
  `prune_next` int(11) unsigned NOT NULL default '0',
  `prune_days` mediumint(8) unsigned NOT NULL default '0',
  `prune_viewed` mediumint(8) unsigned NOT NULL default '0',
  `prune_freq` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`forum_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `forum_lastpost_id` (`forum_last_post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_forums_access`
-- 

CREATE TABLE `phpbb3test_forums_access` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`forum_id`,`user_id`,`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_forums_track`
-- 

CREATE TABLE `phpbb3test_forums_track` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `mark_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_forums_watch`
-- 

CREATE TABLE `phpbb3test_forums_watch` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `notify_status` tinyint(1) unsigned NOT NULL default '0',
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_groups`
-- 

CREATE TABLE `phpbb3test_groups` (
  `group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_type` tinyint(4) NOT NULL default '1',
  `group_founder_manage` tinyint(1) unsigned NOT NULL default '0',
  `group_skip_auth` tinyint(1) unsigned NOT NULL default '0',
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `group_desc` text collate utf8_bin NOT NULL,
  `group_desc_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `group_desc_options` int(11) unsigned NOT NULL default '7',
  `group_desc_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `group_display` tinyint(1) unsigned NOT NULL default '0',
  `group_avatar` varchar(255) collate utf8_bin NOT NULL default '',
  `group_avatar_type` tinyint(2) NOT NULL default '0',
  `group_avatar_width` smallint(4) unsigned NOT NULL default '0',
  `group_avatar_height` smallint(4) unsigned NOT NULL default '0',
  `group_rank` mediumint(8) unsigned NOT NULL default '0',
  `group_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `group_sig_chars` mediumint(8) unsigned NOT NULL default '0',
  `group_receive_pm` tinyint(1) unsigned NOT NULL default '0',
  `group_message_limit` mediumint(8) unsigned NOT NULL default '0',
  `group_max_recipients` mediumint(8) unsigned NOT NULL default '0',
  `group_legend` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`group_id`),
  KEY `group_legend_name` (`group_legend`,`group_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_icons`
-- 

CREATE TABLE `phpbb3test_icons` (
  `icons_id` mediumint(8) unsigned NOT NULL auto_increment,
  `icons_url` varchar(255) collate utf8_bin NOT NULL default '',
  `icons_width` tinyint(4) NOT NULL default '0',
  `icons_height` tinyint(4) NOT NULL default '0',
  `icons_order` mediumint(8) unsigned NOT NULL default '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`icons_id`),
  KEY `display_on_posting` (`display_on_posting`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_lang`
-- 

CREATE TABLE `phpbb3test_lang` (
  `lang_id` tinyint(4) NOT NULL auto_increment,
  `lang_iso` varchar(30) collate utf8_bin NOT NULL default '',
  `lang_dir` varchar(30) collate utf8_bin NOT NULL default '',
  `lang_english_name` varchar(100) collate utf8_bin NOT NULL default '',
  `lang_local_name` varchar(255) collate utf8_bin NOT NULL default '',
  `lang_author` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`lang_id`),
  KEY `lang_iso` (`lang_iso`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_log`
-- 

CREATE TABLE `phpbb3test_log` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `log_type` tinyint(4) NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `reportee_id` mediumint(8) unsigned NOT NULL default '0',
  `log_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `log_time` int(11) unsigned NOT NULL default '0',
  `log_operation` text collate utf8_bin NOT NULL,
  `log_data` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `log_time` (`log_time`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `reportee_id` (`reportee_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=809 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_moderator_cache`
-- 

CREATE TABLE `phpbb3test_moderator_cache` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `username` varchar(255) collate utf8_bin NOT NULL default '',
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `display_on_index` tinyint(1) unsigned NOT NULL default '1',
  KEY `disp_idx` (`display_on_index`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_modules`
-- 

CREATE TABLE `phpbb3test_modules` (
  `module_id` mediumint(8) unsigned NOT NULL auto_increment,
  `module_enabled` tinyint(1) unsigned NOT NULL default '1',
  `module_display` tinyint(1) unsigned NOT NULL default '1',
  `module_basename` varchar(255) collate utf8_bin NOT NULL default '',
  `module_class` varchar(10) collate utf8_bin NOT NULL default '',
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `left_id` mediumint(8) unsigned NOT NULL default '0',
  `right_id` mediumint(8) unsigned NOT NULL default '0',
  `module_langname` varchar(255) collate utf8_bin NOT NULL default '',
  `module_mode` varchar(255) collate utf8_bin NOT NULL default '',
  `module_auth` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`module_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `module_enabled` (`module_enabled`),
  KEY `class_left_id` (`module_class`,`left_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=198 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_poll_options`
-- 

CREATE TABLE `phpbb3test_poll_options` (
  `poll_option_id` tinyint(4) NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `poll_option_text` text collate utf8_bin NOT NULL,
  `poll_option_total` mediumint(8) unsigned NOT NULL default '0',
  KEY `poll_opt_id` (`poll_option_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_poll_votes`
-- 

CREATE TABLE `phpbb3test_poll_votes` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `poll_option_id` tinyint(4) NOT NULL default '0',
  `vote_user_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_user_ip` varchar(40) collate utf8_bin NOT NULL default '',
  KEY `topic_id` (`topic_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_posts`
-- 

CREATE TABLE `phpbb3test_posts` (
  `post_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `poster_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `post_time` int(11) unsigned NOT NULL default '0',
  `post_approved` tinyint(1) unsigned NOT NULL default '1',
  `post_reported` tinyint(1) unsigned NOT NULL default '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL default '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL default '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL default '1',
  `enable_sig` tinyint(1) unsigned NOT NULL default '1',
  `post_username` varchar(255) collate utf8_bin NOT NULL default '',
  `post_subject` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `post_text` mediumtext collate utf8_bin NOT NULL,
  `post_checksum` varchar(32) collate utf8_bin NOT NULL default '',
  `post_attachment` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `post_postcount` tinyint(1) unsigned NOT NULL default '1',
  `post_edit_time` int(11) unsigned NOT NULL default '0',
  `post_edit_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `post_edit_user` mediumint(8) unsigned NOT NULL default '0',
  `post_edit_count` smallint(4) unsigned NOT NULL default '0',
  `post_edit_locked` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_ip` (`poster_ip`),
  KEY `poster_id` (`poster_id`),
  KEY `post_approved` (`post_approved`),
  KEY `post_username` (`post_username`),
  KEY `tid_post_time` (`topic_id`,`post_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=165 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_privmsgs`
-- 

CREATE TABLE `phpbb3test_privmsgs` (
  `msg_id` mediumint(8) unsigned NOT NULL auto_increment,
  `root_level` mediumint(8) unsigned NOT NULL default '0',
  `author_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `author_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `message_time` int(11) unsigned NOT NULL default '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL default '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL default '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL default '1',
  `enable_sig` tinyint(1) unsigned NOT NULL default '1',
  `message_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `message_text` mediumtext collate utf8_bin NOT NULL,
  `message_edit_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `message_edit_user` mediumint(8) unsigned NOT NULL default '0',
  `message_attachment` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `message_edit_time` int(11) unsigned NOT NULL default '0',
  `message_edit_count` smallint(4) unsigned NOT NULL default '0',
  `to_address` text collate utf8_bin NOT NULL,
  `bcc_address` text collate utf8_bin NOT NULL,
  `message_reported` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`msg_id`),
  KEY `author_ip` (`author_ip`),
  KEY `message_time` (`message_time`),
  KEY `author_id` (`author_id`),
  KEY `root_level` (`root_level`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_privmsgs_folder`
-- 

CREATE TABLE `phpbb3test_privmsgs_folder` (
  `folder_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `folder_name` varchar(255) collate utf8_bin NOT NULL default '',
  `pm_count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`folder_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_privmsgs_rules`
-- 

CREATE TABLE `phpbb3test_privmsgs_rules` (
  `rule_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_check` mediumint(8) unsigned NOT NULL default '0',
  `rule_connection` mediumint(8) unsigned NOT NULL default '0',
  `rule_string` varchar(255) collate utf8_bin NOT NULL default '',
  `rule_user_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_group_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_action` mediumint(8) unsigned NOT NULL default '0',
  `rule_folder_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`rule_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_privmsgs_to`
-- 

CREATE TABLE `phpbb3test_privmsgs_to` (
  `msg_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `author_id` mediumint(8) unsigned NOT NULL default '0',
  `pm_deleted` tinyint(1) unsigned NOT NULL default '0',
  `pm_new` tinyint(1) unsigned NOT NULL default '1',
  `pm_unread` tinyint(1) unsigned NOT NULL default '1',
  `pm_replied` tinyint(1) unsigned NOT NULL default '0',
  `pm_marked` tinyint(1) unsigned NOT NULL default '0',
  `pm_forwarded` tinyint(1) unsigned NOT NULL default '0',
  `folder_id` int(11) NOT NULL default '0',
  KEY `msg_id` (`msg_id`),
  KEY `author_id` (`author_id`),
  KEY `usr_flder_id` (`user_id`,`folder_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_profile_fields`
-- 

CREATE TABLE `phpbb3test_profile_fields` (
  `field_id` mediumint(8) unsigned NOT NULL auto_increment,
  `field_name` varchar(255) collate utf8_bin NOT NULL default '',
  `field_type` tinyint(4) NOT NULL default '0',
  `field_ident` varchar(20) collate utf8_bin NOT NULL default '',
  `field_length` varchar(20) collate utf8_bin NOT NULL default '',
  `field_minlen` varchar(255) collate utf8_bin NOT NULL default '',
  `field_maxlen` varchar(255) collate utf8_bin NOT NULL default '',
  `field_novalue` varchar(255) collate utf8_bin NOT NULL default '',
  `field_default_value` varchar(255) collate utf8_bin NOT NULL default '',
  `field_validation` varchar(20) collate utf8_bin NOT NULL default '',
  `field_required` tinyint(1) unsigned NOT NULL default '0',
  `field_show_on_reg` tinyint(1) unsigned NOT NULL default '0',
  `field_show_on_vt` tinyint(1) unsigned NOT NULL default '0',
  `field_show_profile` tinyint(1) unsigned NOT NULL default '0',
  `field_hide` tinyint(1) unsigned NOT NULL default '0',
  `field_no_view` tinyint(1) unsigned NOT NULL default '0',
  `field_active` tinyint(1) unsigned NOT NULL default '0',
  `field_order` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`field_id`),
  KEY `fld_type` (`field_type`),
  KEY `fld_ordr` (`field_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_profile_fields_data`
-- 

CREATE TABLE `phpbb3test_profile_fields_data` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_profile_fields_lang`
-- 

CREATE TABLE `phpbb3test_profile_fields_lang` (
  `field_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_id` mediumint(8) unsigned NOT NULL default '0',
  `option_id` mediumint(8) unsigned NOT NULL default '0',
  `field_type` tinyint(4) NOT NULL default '0',
  `lang_value` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`field_id`,`lang_id`,`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_profile_lang`
-- 

CREATE TABLE `phpbb3test_profile_lang` (
  `field_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_name` varchar(255) collate utf8_bin NOT NULL default '',
  `lang_explain` text collate utf8_bin NOT NULL,
  `lang_default_value` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`field_id`,`lang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_ranks`
-- 

CREATE TABLE `phpbb3test_ranks` (
  `rank_id` mediumint(8) unsigned NOT NULL auto_increment,
  `rank_title` varchar(255) collate utf8_bin NOT NULL default '',
  `rank_min` mediumint(8) unsigned NOT NULL default '0',
  `rank_special` tinyint(1) unsigned NOT NULL default '0',
  `rank_image` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`rank_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_reports`
-- 

CREATE TABLE `phpbb3test_reports` (
  `report_id` mediumint(8) unsigned NOT NULL auto_increment,
  `reason_id` smallint(4) unsigned NOT NULL default '0',
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `pm_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `user_notify` tinyint(1) unsigned NOT NULL default '0',
  `report_closed` tinyint(1) unsigned NOT NULL default '0',
  `report_time` int(11) unsigned NOT NULL default '0',
  `report_text` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`report_id`),
  KEY `post_id` (`post_id`),
  KEY `pm_id` (`pm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_reports_reasons`
-- 

CREATE TABLE `phpbb3test_reports_reasons` (
  `reason_id` smallint(4) unsigned NOT NULL auto_increment,
  `reason_title` varchar(255) collate utf8_bin NOT NULL default '',
  `reason_description` mediumtext collate utf8_bin NOT NULL,
  `reason_order` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`reason_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_search_results`
-- 

CREATE TABLE `phpbb3test_search_results` (
  `search_key` varchar(32) collate utf8_bin NOT NULL default '',
  `search_time` int(11) unsigned NOT NULL default '0',
  `search_keywords` mediumtext collate utf8_bin NOT NULL,
  `search_authors` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`search_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_search_wordlist`
-- 

CREATE TABLE `phpbb3test_search_wordlist` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word_text` varchar(255) collate utf8_bin NOT NULL default '',
  `word_common` tinyint(1) unsigned NOT NULL default '0',
  `word_count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`word_id`),
  UNIQUE KEY `wrd_txt` (`word_text`),
  KEY `wrd_cnt` (`word_count`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5071 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_search_wordmatch`
-- 

CREATE TABLE `phpbb3test_search_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `word_id` mediumint(8) unsigned NOT NULL default '0',
  `title_match` tinyint(1) unsigned NOT NULL default '0',
  UNIQUE KEY `unq_mtch` (`word_id`,`post_id`,`title_match`),
  KEY `word_id` (`word_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_sessions`
-- 

CREATE TABLE `phpbb3test_sessions` (
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  `session_user_id` mediumint(8) unsigned NOT NULL default '0',
  `session_forum_id` mediumint(8) unsigned NOT NULL default '0',
  `session_last_visit` int(11) unsigned NOT NULL default '0',
  `session_start` int(11) unsigned NOT NULL default '0',
  `session_time` int(11) unsigned NOT NULL default '0',
  `session_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `session_browser` varchar(150) collate utf8_bin NOT NULL default '',
  `session_forwarded_for` varchar(255) collate utf8_bin NOT NULL default '',
  `session_page` varchar(255) collate utf8_bin NOT NULL default '',
  `session_viewonline` tinyint(1) unsigned NOT NULL default '1',
  `session_autologin` tinyint(1) unsigned NOT NULL default '0',
  `session_admin` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `session_time` (`session_time`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_fid` (`session_forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_sessions_keys`
-- 

CREATE TABLE `phpbb3test_sessions_keys` (
  `key_id` char(32) collate utf8_bin NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `last_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `last_login` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`key_id`,`user_id`),
  KEY `last_login` (`last_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_sitelist`
-- 

CREATE TABLE `phpbb3test_sitelist` (
  `site_id` mediumint(8) unsigned NOT NULL auto_increment,
  `site_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `site_hostname` varchar(255) collate utf8_bin NOT NULL default '',
  `ip_exclude` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_smilies`
-- 

CREATE TABLE `phpbb3test_smilies` (
  `smiley_id` mediumint(8) unsigned NOT NULL auto_increment,
  `code` varchar(50) collate utf8_bin NOT NULL default '',
  `emotion` varchar(50) collate utf8_bin NOT NULL default '',
  `smiley_url` varchar(50) collate utf8_bin NOT NULL default '',
  `smiley_width` smallint(4) unsigned NOT NULL default '0',
  `smiley_height` smallint(4) unsigned NOT NULL default '0',
  `smiley_order` mediumint(8) unsigned NOT NULL default '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`smiley_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_styles`
-- 

CREATE TABLE `phpbb3test_styles` (
  `style_id` mediumint(8) unsigned NOT NULL auto_increment,
  `style_name` varchar(255) collate utf8_bin NOT NULL default '',
  `style_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `style_active` tinyint(1) unsigned NOT NULL default '1',
  `template_id` mediumint(8) unsigned NOT NULL default '0',
  `theme_id` mediumint(8) unsigned NOT NULL default '0',
  `imageset_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`style_id`),
  UNIQUE KEY `style_name` (`style_name`),
  KEY `template_id` (`template_id`),
  KEY `theme_id` (`theme_id`),
  KEY `imageset_id` (`imageset_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_styles_imageset`
-- 

CREATE TABLE `phpbb3test_styles_imageset` (
  `imageset_id` mediumint(8) unsigned NOT NULL auto_increment,
  `imageset_name` varchar(255) collate utf8_bin NOT NULL default '',
  `imageset_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `imageset_path` varchar(100) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`imageset_id`),
  UNIQUE KEY `imgset_nm` (`imageset_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_styles_imageset_data`
-- 

CREATE TABLE `phpbb3test_styles_imageset_data` (
  `image_id` mediumint(8) unsigned NOT NULL auto_increment,
  `image_name` varchar(200) collate utf8_bin NOT NULL default '',
  `image_filename` varchar(200) collate utf8_bin NOT NULL default '',
  `image_lang` varchar(30) collate utf8_bin NOT NULL default '',
  `image_height` smallint(4) unsigned NOT NULL default '0',
  `image_width` smallint(4) unsigned NOT NULL default '0',
  `imageset_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`image_id`),
  KEY `i_d` (`imageset_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=699 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_styles_template`
-- 

CREATE TABLE `phpbb3test_styles_template` (
  `template_id` mediumint(8) unsigned NOT NULL auto_increment,
  `template_name` varchar(255) collate utf8_bin NOT NULL default '',
  `template_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `template_path` varchar(100) collate utf8_bin NOT NULL default '',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default 'kNg=',
  `template_storedb` tinyint(1) unsigned NOT NULL default '0',
  `template_inherits_id` int(4) unsigned NOT NULL default '0',
  `template_inherit_path` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`template_id`),
  UNIQUE KEY `tmplte_nm` (`template_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_styles_template_data`
-- 

CREATE TABLE `phpbb3test_styles_template_data` (
  `template_id` mediumint(8) unsigned NOT NULL default '0',
  `template_filename` varchar(100) collate utf8_bin NOT NULL default '',
  `template_included` text collate utf8_bin NOT NULL,
  `template_mtime` int(11) unsigned NOT NULL default '0',
  `template_data` mediumtext collate utf8_bin NOT NULL,
  KEY `tid` (`template_id`),
  KEY `tfn` (`template_filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_styles_theme`
-- 

CREATE TABLE `phpbb3test_styles_theme` (
  `theme_id` mediumint(8) unsigned NOT NULL auto_increment,
  `theme_name` varchar(255) collate utf8_bin NOT NULL default '',
  `theme_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `theme_path` varchar(100) collate utf8_bin NOT NULL default '',
  `theme_storedb` tinyint(1) unsigned NOT NULL default '0',
  `theme_mtime` int(11) unsigned NOT NULL default '0',
  `theme_data` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`theme_id`),
  UNIQUE KEY `theme_name` (`theme_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_topics`
-- 

CREATE TABLE `phpbb3test_topics` (
  `topic_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_attachment` tinyint(1) unsigned NOT NULL default '0',
  `topic_approved` tinyint(1) unsigned NOT NULL default '1',
  `topic_reported` tinyint(1) unsigned NOT NULL default '0',
  `topic_title` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `topic_poster` mediumint(8) unsigned NOT NULL default '0',
  `topic_time` int(11) unsigned NOT NULL default '0',
  `topic_time_limit` int(11) unsigned NOT NULL default '0',
  `topic_views` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies_real` mediumint(8) unsigned NOT NULL default '0',
  `topic_status` tinyint(3) NOT NULL default '0',
  `topic_type` tinyint(3) NOT NULL default '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_first_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_first_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_last_poster_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_last_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_last_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `topic_last_post_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_last_post_time` int(11) unsigned NOT NULL default '0',
  `topic_last_view_time` int(11) unsigned NOT NULL default '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_bumped` tinyint(1) unsigned NOT NULL default '0',
  `topic_bumper` mediumint(8) unsigned NOT NULL default '0',
  `poll_title` varchar(255) collate utf8_bin NOT NULL default '',
  `poll_start` int(11) unsigned NOT NULL default '0',
  `poll_length` int(11) unsigned NOT NULL default '0',
  `poll_max_options` tinyint(4) NOT NULL default '1',
  `poll_last_vote` int(11) unsigned NOT NULL default '0',
  `poll_vote_change` tinyint(1) unsigned NOT NULL default '0',
  `am_start` int(11) NOT NULL default '0',
  `am_length` int(11) NOT NULL default '0',
  `am_visible` tinyint(1) NOT NULL default '0',
  `am_confirmable` tinyint(1) NOT NULL default '0',
  `am_reg_change` tinyint(1) NOT NULL default '0',
  `am_layout` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_type` (`forum_id`,`topic_type`),
  KEY `last_post_time` (`topic_last_post_time`),
  KEY `topic_approved` (`topic_approved`),
  KEY `forum_appr_last` (`forum_id`,`topic_approved`,`topic_last_post_id`),
  KEY `fid_time_moved` (`forum_id`,`topic_last_post_time`,`topic_moved_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_topics_posted`
-- 

CREATE TABLE `phpbb3test_topics_posted` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_posted` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_topics_track`
-- 

CREATE TABLE `phpbb3test_topics_track` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `mark_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`topic_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_topics_watch`
-- 

CREATE TABLE `phpbb3test_topics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `notify_status` tinyint(1) unsigned NOT NULL default '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_users`
-- 

CREATE TABLE `phpbb3test_users` (
  `user_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_type` tinyint(2) NOT NULL default '0',
  `group_id` mediumint(8) unsigned NOT NULL default '3',
  `user_permissions` mediumtext collate utf8_bin NOT NULL,
  `user_perm_from` mediumint(8) unsigned NOT NULL default '0',
  `user_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `user_regdate` int(11) unsigned NOT NULL default '0',
  `username` varchar(255) collate utf8_bin NOT NULL default '',
  `username_clean` varchar(255) collate utf8_bin NOT NULL default '',
  `user_password` varchar(40) collate utf8_bin NOT NULL default '',
  `user_passchg` int(11) unsigned NOT NULL default '0',
  `user_pass_convert` tinyint(1) unsigned NOT NULL default '0',
  `user_email` varchar(100) collate utf8_bin NOT NULL default '',
  `user_email_hash` bigint(20) NOT NULL default '0',
  `user_birthday` varchar(10) collate utf8_bin NOT NULL default '',
  `user_lastvisit` int(11) unsigned NOT NULL default '0',
  `user_lastmark` int(11) unsigned NOT NULL default '0',
  `user_lastpost_time` int(11) unsigned NOT NULL default '0',
  `user_lastpage` varchar(200) collate utf8_bin NOT NULL default '',
  `user_last_confirm_key` varchar(10) collate utf8_bin NOT NULL default '',
  `user_last_search` int(11) unsigned NOT NULL default '0',
  `user_warnings` tinyint(4) NOT NULL default '0',
  `user_last_warning` int(11) unsigned NOT NULL default '0',
  `user_login_attempts` tinyint(4) NOT NULL default '0',
  `user_inactive_reason` tinyint(2) NOT NULL default '0',
  `user_inactive_time` int(11) unsigned NOT NULL default '0',
  `user_posts` mediumint(8) unsigned NOT NULL default '0',
  `user_lang` varchar(30) collate utf8_bin NOT NULL default '',
  `user_timezone` decimal(5,2) NOT NULL default '0.00',
  `user_dst` tinyint(1) unsigned NOT NULL default '0',
  `user_dateformat` varchar(30) collate utf8_bin NOT NULL default 'd M Y H:i',
  `user_style` mediumint(8) unsigned NOT NULL default '0',
  `user_rank` mediumint(8) unsigned NOT NULL default '0',
  `user_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `user_new_privmsg` int(4) NOT NULL default '0',
  `user_unread_privmsg` int(4) NOT NULL default '0',
  `user_last_privmsg` int(11) unsigned NOT NULL default '0',
  `user_message_rules` tinyint(1) unsigned NOT NULL default '0',
  `user_full_folder` int(11) NOT NULL default '-3',
  `user_emailtime` int(11) unsigned NOT NULL default '0',
  `user_topic_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_topic_sortby_type` varchar(1) collate utf8_bin NOT NULL default 't',
  `user_topic_sortby_dir` varchar(1) collate utf8_bin NOT NULL default 'd',
  `user_post_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_post_sortby_type` varchar(1) collate utf8_bin NOT NULL default 't',
  `user_post_sortby_dir` varchar(1) collate utf8_bin NOT NULL default 'a',
  `user_notify` tinyint(1) unsigned NOT NULL default '0',
  `user_notify_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_notify_type` tinyint(4) NOT NULL default '0',
  `user_allow_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewonline` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewemail` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_massemail` tinyint(1) unsigned NOT NULL default '1',
  `user_options` int(11) unsigned NOT NULL default '230271',
  `user_avatar` varchar(255) collate utf8_bin NOT NULL default '',
  `user_avatar_type` tinyint(2) NOT NULL default '0',
  `user_avatar_width` smallint(4) unsigned NOT NULL default '0',
  `user_avatar_height` smallint(4) unsigned NOT NULL default '0',
  `user_sig` mediumtext collate utf8_bin NOT NULL,
  `user_sig_bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `user_sig_bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `user_from` varchar(100) collate utf8_bin NOT NULL default '',
  `user_icq` varchar(15) collate utf8_bin NOT NULL default '',
  `user_aim` varchar(255) collate utf8_bin NOT NULL default '',
  `user_yim` varchar(255) collate utf8_bin NOT NULL default '',
  `user_msnm` varchar(255) collate utf8_bin NOT NULL default '',
  `user_jabber` varchar(255) collate utf8_bin NOT NULL default '',
  `user_website` varchar(200) collate utf8_bin NOT NULL default '',
  `user_occ` text collate utf8_bin NOT NULL,
  `user_interests` text collate utf8_bin NOT NULL,
  `user_actkey` varchar(32) collate utf8_bin NOT NULL default '',
  `user_newpasswd` varchar(40) collate utf8_bin NOT NULL default '',
  `user_form_salt` varchar(32) collate utf8_bin NOT NULL default '',
  `user_new` tinyint(1) unsigned NOT NULL default '1',
  `user_reminded` tinyint(4) NOT NULL default '0',
  `user_reminded_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `username_clean` (`username_clean`),
  KEY `user_birthday` (`user_birthday`),
  KEY `user_email_hash` (`user_email_hash`),
  KEY `user_type` (`user_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=63 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_user_group`
-- 

CREATE TABLE `phpbb3test_user_group` (
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `group_leader` tinyint(1) unsigned NOT NULL default '0',
  `user_pending` tinyint(1) unsigned NOT NULL default '1',
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_leader` (`group_leader`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_warnings`
-- 

CREATE TABLE `phpbb3test_warnings` (
  `warning_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `log_id` mediumint(8) unsigned NOT NULL default '0',
  `warning_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`warning_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_words`
-- 

CREATE TABLE `phpbb3test_words` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word` varchar(255) collate utf8_bin NOT NULL default '',
  `replacement` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3test_zebra`
-- 

CREATE TABLE `phpbb3test_zebra` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `zebra_id` mediumint(8) unsigned NOT NULL default '0',
  `friend` tinyint(1) unsigned NOT NULL default '0',
  `foe` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`zebra_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_acl_groups`
-- 

CREATE TABLE `phpbb3_acl_groups` (
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  KEY `group_id` (`group_id`),
  KEY `auth_opt_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_acl_options`
-- 

CREATE TABLE `phpbb3_acl_options` (
  `auth_option_id` mediumint(8) unsigned NOT NULL auto_increment,
  `auth_option` varchar(50) collate utf8_bin NOT NULL default '',
  `is_global` tinyint(1) unsigned NOT NULL default '0',
  `is_local` tinyint(1) unsigned NOT NULL default '0',
  `founder_only` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`auth_option_id`),
  UNIQUE KEY `auth_option` (`auth_option`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=118 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_acl_roles`
-- 

CREATE TABLE `phpbb3_acl_roles` (
  `role_id` mediumint(8) unsigned NOT NULL auto_increment,
  `role_name` varchar(255) collate utf8_bin NOT NULL default '',
  `role_description` text collate utf8_bin NOT NULL,
  `role_type` varchar(10) collate utf8_bin NOT NULL default '',
  `role_order` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`role_id`),
  KEY `role_type` (`role_type`),
  KEY `role_order` (`role_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_acl_roles_data`
-- 

CREATE TABLE `phpbb3_acl_roles_data` (
  `role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`role_id`,`auth_option_id`),
  KEY `ath_op_id` (`auth_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_acl_users`
-- 

CREATE TABLE `phpbb3_acl_users` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  KEY `user_id` (`user_id`),
  KEY `auth_option_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_attachments`
-- 

CREATE TABLE `phpbb3_attachments` (
  `attach_id` mediumint(8) unsigned NOT NULL auto_increment,
  `post_msg_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `in_message` tinyint(1) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) unsigned NOT NULL default '0',
  `is_orphan` tinyint(1) unsigned NOT NULL default '1',
  `physical_filename` varchar(255) collate utf8_bin NOT NULL default '',
  `real_filename` varchar(255) collate utf8_bin NOT NULL default '',
  `download_count` mediumint(8) unsigned NOT NULL default '0',
  `attach_comment` text collate utf8_bin NOT NULL,
  `extension` varchar(100) collate utf8_bin NOT NULL default '',
  `mimetype` varchar(100) collate utf8_bin NOT NULL default '',
  `filesize` int(20) unsigned NOT NULL default '0',
  `filetime` int(11) unsigned NOT NULL default '0',
  `thumbnail` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`attach_id`),
  KEY `filetime` (`filetime`),
  KEY `post_msg_id` (`post_msg_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `is_orphan` (`is_orphan`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_banlist`
-- 

CREATE TABLE `phpbb3_banlist` (
  `ban_id` mediumint(8) unsigned NOT NULL auto_increment,
  `ban_userid` mediumint(8) unsigned NOT NULL default '0',
  `ban_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `ban_email` varchar(100) collate utf8_bin NOT NULL default '',
  `ban_start` int(11) unsigned NOT NULL default '0',
  `ban_end` int(11) unsigned NOT NULL default '0',
  `ban_exclude` tinyint(1) unsigned NOT NULL default '0',
  `ban_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `ban_give_reason` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`ban_id`),
  KEY `ban_end` (`ban_end`),
  KEY `ban_user` (`ban_userid`,`ban_exclude`),
  KEY `ban_email` (`ban_email`,`ban_exclude`),
  KEY `ban_ip` (`ban_ip`,`ban_exclude`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=303 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_bbcodes`
-- 

CREATE TABLE `phpbb3_bbcodes` (
  `bbcode_id` tinyint(3) NOT NULL default '0',
  `bbcode_tag` varchar(16) collate utf8_bin NOT NULL default '',
  `bbcode_helpline` varchar(255) collate utf8_bin NOT NULL default '',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_match` text collate utf8_bin NOT NULL,
  `bbcode_tpl` mediumtext collate utf8_bin NOT NULL,
  `first_pass_match` mediumtext collate utf8_bin NOT NULL,
  `first_pass_replace` mediumtext collate utf8_bin NOT NULL,
  `second_pass_match` mediumtext collate utf8_bin NOT NULL,
  `second_pass_replace` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`bbcode_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_bookmarks`
-- 

CREATE TABLE `phpbb3_bookmarks` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`topic_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_bots`
-- 

CREATE TABLE `phpbb3_bots` (
  `bot_id` mediumint(8) unsigned NOT NULL auto_increment,
  `bot_active` tinyint(1) unsigned NOT NULL default '1',
  `bot_name` varchar(255) collate utf8_bin NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `bot_agent` varchar(255) collate utf8_bin NOT NULL default '',
  `bot_ip` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`bot_id`),
  KEY `bot_active` (`bot_active`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_cdt`
-- 

CREATE TABLE `phpbb3_cdt` (
  `cdate` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`cdate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_config`
-- 

CREATE TABLE `phpbb3_config` (
  `config_name` varchar(255) collate utf8_bin NOT NULL default '',
  `config_value` varchar(255) collate utf8_bin NOT NULL default '',
  `is_dynamic` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`config_name`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_confirm`
-- 

CREATE TABLE `phpbb3_confirm` (
  `confirm_id` char(32) collate utf8_bin NOT NULL default '',
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  `confirm_type` tinyint(3) NOT NULL default '0',
  `code` varchar(8) collate utf8_bin NOT NULL default '',
  `seed` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`,`confirm_id`),
  KEY `confirm_type` (`confirm_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_disallow`
-- 

CREATE TABLE `phpbb3_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL auto_increment,
  `disallow_username` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`disallow_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=38 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_dpd`
-- 

CREATE TABLE `phpbb3_dpd` (
  `did` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) NOT NULL default '0',
  `deleter_id` mediumint(8) NOT NULL default '0',
  PRIMARY KEY  (`did`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13760 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_drafts`
-- 

CREATE TABLE `phpbb3_drafts` (
  `draft_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `save_time` int(11) unsigned NOT NULL default '0',
  `draft_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `draft_message` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`draft_id`),
  KEY `save_time` (`save_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1295 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_extensions`
-- 

CREATE TABLE `phpbb3_extensions` (
  `extension_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `extension` varchar(100) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=67 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_extension_groups`
-- 

CREATE TABLE `phpbb3_extension_groups` (
  `group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `cat_id` tinyint(2) NOT NULL default '0',
  `allow_group` tinyint(1) unsigned NOT NULL default '0',
  `download_mode` tinyint(1) unsigned NOT NULL default '1',
  `upload_icon` varchar(255) collate utf8_bin NOT NULL default '',
  `max_filesize` int(20) unsigned NOT NULL default '0',
  `allowed_forums` text collate utf8_bin NOT NULL,
  `allow_in_pm` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_feherlista`
-- 

CREATE TABLE `phpbb3_feherlista` (
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

-- 
-- Tábla szerkezet: `phpbb3_feketelista`
-- 

CREATE TABLE `phpbb3_feketelista` (
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

-- 
-- Tábla szerkezet: `phpbb3_forums`
-- 

CREATE TABLE `phpbb3_forums` (
  `forum_id` mediumint(8) unsigned NOT NULL auto_increment,
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `left_id` mediumint(8) unsigned NOT NULL default '0',
  `right_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_parents` mediumtext collate utf8_bin NOT NULL,
  `forum_name` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_desc` text collate utf8_bin NOT NULL,
  `forum_desc_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_desc_options` int(11) unsigned NOT NULL default '7',
  `forum_desc_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `forum_link` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_password` varchar(40) collate utf8_bin NOT NULL default '',
  `forum_style` mediumint(8) unsigned NOT NULL default '0',
  `forum_image` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules` text collate utf8_bin NOT NULL,
  `forum_rules_link` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules_options` int(11) unsigned NOT NULL default '7',
  `forum_rules_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `forum_topics_per_page` tinyint(4) NOT NULL default '0',
  `forum_type` tinyint(4) NOT NULL default '0',
  `forum_status` tinyint(4) NOT NULL default '0',
  `forum_posts` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics_real` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_poster_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_last_post_time` int(11) unsigned NOT NULL default '0',
  `forum_last_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_last_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `forum_flags` tinyint(4) NOT NULL default '32',
  `display_subforum_list` tinyint(1) unsigned NOT NULL default '1',
  `display_on_index` tinyint(1) unsigned NOT NULL default '1',
  `enable_indexing` tinyint(1) unsigned NOT NULL default '1',
  `enable_icons` tinyint(1) unsigned NOT NULL default '1',
  `enable_prune` tinyint(1) unsigned NOT NULL default '0',
  `prune_next` int(11) unsigned NOT NULL default '0',
  `prune_days` mediumint(8) unsigned NOT NULL default '0',
  `prune_viewed` mediumint(8) unsigned NOT NULL default '0',
  `prune_freq` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`forum_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `forum_lastpost_id` (`forum_last_post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=292 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_forums_access`
-- 

CREATE TABLE `phpbb3_forums_access` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`forum_id`,`user_id`,`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_forums_track`
-- 

CREATE TABLE `phpbb3_forums_track` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `mark_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_forums_watch`
-- 

CREATE TABLE `phpbb3_forums_watch` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `notify_status` tinyint(1) unsigned NOT NULL default '0',
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_groups`
-- 

CREATE TABLE `phpbb3_groups` (
  `group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_type` tinyint(4) NOT NULL default '1',
  `group_founder_manage` tinyint(1) unsigned NOT NULL default '0',
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `group_desc` text collate utf8_bin NOT NULL,
  `group_desc_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `group_desc_options` int(11) unsigned NOT NULL default '7',
  `group_desc_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `group_display` tinyint(1) unsigned NOT NULL default '0',
  `group_avatar` varchar(255) collate utf8_bin NOT NULL default '',
  `group_avatar_type` tinyint(2) NOT NULL default '0',
  `group_avatar_width` smallint(4) unsigned NOT NULL default '0',
  `group_avatar_height` smallint(4) unsigned NOT NULL default '0',
  `group_rank` mediumint(8) unsigned NOT NULL default '0',
  `group_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `group_sig_chars` mediumint(8) unsigned NOT NULL default '0',
  `group_receive_pm` tinyint(1) unsigned NOT NULL default '0',
  `group_message_limit` mediumint(8) unsigned NOT NULL default '0',
  `group_max_recipients` mediumint(8) unsigned NOT NULL default '0',
  `group_legend` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`group_id`),
  KEY `group_legend_name` (`group_legend`,`group_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12718 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_Hasznos_szav`
-- 

CREATE TABLE `phpbb3_Hasznos_szav` (
  `haszsz_id` mediumint(10) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `post_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`haszsz_id`),
  UNIQUE KEY `hssz_user_id` (`user_id`,`post_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=191 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_icons`
-- 

CREATE TABLE `phpbb3_icons` (
  `icons_id` mediumint(8) unsigned NOT NULL auto_increment,
  `icons_url` varchar(255) collate utf8_bin NOT NULL default '',
  `icons_width` tinyint(4) NOT NULL default '0',
  `icons_height` tinyint(4) NOT NULL default '0',
  `icons_order` mediumint(8) unsigned NOT NULL default '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`icons_id`),
  KEY `display_on_posting` (`display_on_posting`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_jelentk`
-- 

CREATE TABLE `phpbb3_jelentk` (
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

-- 
-- Tábla szerkezet: `phpbb3_lang`
-- 

CREATE TABLE `phpbb3_lang` (
  `lang_id` tinyint(4) NOT NULL auto_increment,
  `lang_iso` varchar(30) collate utf8_bin NOT NULL default '',
  `lang_dir` varchar(30) collate utf8_bin NOT NULL default '',
  `lang_english_name` varchar(100) collate utf8_bin NOT NULL default '',
  `lang_local_name` varchar(255) collate utf8_bin NOT NULL default '',
  `lang_author` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`lang_id`),
  KEY `lang_iso` (`lang_iso`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_log`
-- 

CREATE TABLE `phpbb3_log` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `log_type` tinyint(4) NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `reportee_id` mediumint(8) unsigned NOT NULL default '0',
  `log_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `log_time` int(11) unsigned NOT NULL default '0',
  `log_operation` text collate utf8_bin NOT NULL,
  `log_data` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `reportee_id` (`reportee_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=117664 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_moderator_cache`
-- 

CREATE TABLE `phpbb3_moderator_cache` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `username` varchar(255) collate utf8_bin NOT NULL default '',
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `display_on_index` tinyint(1) unsigned NOT NULL default '1',
  KEY `disp_idx` (`display_on_index`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_modules`
-- 

CREATE TABLE `phpbb3_modules` (
  `module_id` mediumint(8) unsigned NOT NULL auto_increment,
  `module_enabled` tinyint(1) unsigned NOT NULL default '1',
  `module_display` tinyint(1) unsigned NOT NULL default '1',
  `module_basename` varchar(255) collate utf8_bin NOT NULL default '',
  `module_class` varchar(10) collate utf8_bin NOT NULL default '',
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `left_id` mediumint(8) unsigned NOT NULL default '0',
  `right_id` mediumint(8) unsigned NOT NULL default '0',
  `module_langname` varchar(255) collate utf8_bin NOT NULL default '',
  `module_mode` varchar(255) collate utf8_bin NOT NULL default '',
  `module_auth` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`module_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `module_enabled` (`module_enabled`),
  KEY `class_left_id` (`module_class`,`left_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=190 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_poll_options`
-- 

CREATE TABLE `phpbb3_poll_options` (
  `poll_option_id` tinyint(4) NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `poll_option_text` text collate utf8_bin NOT NULL,
  `poll_option_total` mediumint(8) unsigned NOT NULL default '0',
  KEY `poll_opt_id` (`poll_option_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_poll_votes`
-- 

CREATE TABLE `phpbb3_poll_votes` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `poll_option_id` tinyint(4) NOT NULL default '0',
  `vote_user_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_user_ip` varchar(40) collate utf8_bin NOT NULL default '',
  KEY `topic_id` (`topic_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_posts`
-- 

CREATE TABLE `phpbb3_posts` (
  `post_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `poster_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `post_time` int(11) unsigned NOT NULL default '0',
  `post_approved` tinyint(1) unsigned NOT NULL default '1',
  `post_reported` tinyint(1) unsigned NOT NULL default '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL default '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL default '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL default '1',
  `enable_sig` tinyint(1) unsigned NOT NULL default '1',
  `post_username` varchar(255) collate utf8_bin NOT NULL default '',
  `post_subject` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `post_text` mediumtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `post_checksum` varchar(32) collate utf8_bin NOT NULL default '',
  `post_attachment` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `post_postcount` tinyint(1) unsigned NOT NULL default '1',
  `post_edit_time` int(11) unsigned NOT NULL default '0',
  `post_edit_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `post_edit_user` mediumint(8) unsigned NOT NULL default '0',
  `post_edit_count` smallint(4) unsigned NOT NULL default '0',
  `post_edit_locked` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_ip` (`poster_ip`),
  KEY `poster_id` (`poster_id`),
  KEY `post_approved` (`post_approved`),
  KEY `tid_post_time` (`topic_id`,`post_time`),
  FULLTEXT KEY `post_subject` (`post_subject`),
  FULLTEXT KEY `post_text` (`post_text`),
  FULLTEXT KEY `post_content` (`post_subject`,`post_text`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=555206 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_privmsgs`
-- 

CREATE TABLE `phpbb3_privmsgs` (
  `msg_id` mediumint(8) unsigned NOT NULL auto_increment,
  `root_level` mediumint(8) unsigned NOT NULL default '0',
  `author_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `author_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `message_time` int(11) unsigned NOT NULL default '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL default '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL default '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL default '1',
  `enable_sig` tinyint(1) unsigned NOT NULL default '1',
  `message_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `message_text` mediumtext collate utf8_bin NOT NULL,
  `message_edit_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `message_edit_user` mediumint(8) unsigned NOT NULL default '0',
  `message_attachment` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `message_edit_time` int(11) unsigned NOT NULL default '0',
  `message_edit_count` smallint(4) unsigned NOT NULL default '0',
  `to_address` text collate utf8_bin NOT NULL,
  `bcc_address` text collate utf8_bin NOT NULL,
  PRIMARY KEY  (`msg_id`),
  KEY `author_ip` (`author_ip`),
  KEY `message_time` (`message_time`),
  KEY `author_id` (`author_id`),
  KEY `root_level` (`root_level`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1312555 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_privmsgs_folder`
-- 

CREATE TABLE `phpbb3_privmsgs_folder` (
  `folder_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `folder_name` varchar(255) collate utf8_bin NOT NULL default '',
  `pm_count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`folder_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4637 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_privmsgs_rules`
-- 

CREATE TABLE `phpbb3_privmsgs_rules` (
  `rule_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_check` mediumint(8) unsigned NOT NULL default '0',
  `rule_connection` mediumint(8) unsigned NOT NULL default '0',
  `rule_string` varchar(255) collate utf8_bin NOT NULL default '',
  `rule_user_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_group_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_action` mediumint(8) unsigned NOT NULL default '0',
  `rule_folder_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`rule_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_privmsgs_to`
-- 

CREATE TABLE `phpbb3_privmsgs_to` (
  `msg_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `author_id` mediumint(8) unsigned NOT NULL default '0',
  `pm_deleted` tinyint(1) unsigned NOT NULL default '0',
  `pm_new` tinyint(1) unsigned NOT NULL default '1',
  `pm_unread` tinyint(1) unsigned NOT NULL default '1',
  `pm_replied` tinyint(1) unsigned NOT NULL default '0',
  `pm_marked` tinyint(1) unsigned NOT NULL default '0',
  `pm_forwarded` tinyint(1) unsigned NOT NULL default '0',
  `folder_id` int(11) NOT NULL default '0',
  KEY `msg_id` (`msg_id`),
  KEY `author_id` (`author_id`),
  KEY `usr_flder_id` (`user_id`,`folder_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_profile_fields`
-- 

CREATE TABLE `phpbb3_profile_fields` (
  `field_id` mediumint(8) unsigned NOT NULL auto_increment,
  `field_name` varchar(255) collate utf8_bin NOT NULL default '',
  `field_type` tinyint(4) NOT NULL default '0',
  `field_ident` varchar(20) collate utf8_bin NOT NULL default '',
  `field_length` varchar(20) collate utf8_bin NOT NULL default '',
  `field_minlen` varchar(255) collate utf8_bin NOT NULL default '',
  `field_maxlen` varchar(255) collate utf8_bin NOT NULL default '',
  `field_novalue` varchar(255) collate utf8_bin NOT NULL default '',
  `field_default_value` varchar(255) collate utf8_bin NOT NULL default '',
  `field_validation` varchar(20) collate utf8_bin NOT NULL default '',
  `field_required` tinyint(1) unsigned NOT NULL default '0',
  `field_show_on_reg` tinyint(1) unsigned NOT NULL default '0',
  `field_show_profile` tinyint(1) unsigned NOT NULL default '0',
  `field_hide` tinyint(1) unsigned NOT NULL default '0',
  `field_no_view` tinyint(1) unsigned NOT NULL default '0',
  `field_active` tinyint(1) unsigned NOT NULL default '0',
  `field_order` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`field_id`),
  KEY `fld_type` (`field_type`),
  KEY `fld_ordr` (`field_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_profile_fields_data`
-- 

CREATE TABLE `phpbb3_profile_fields_data` (
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

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_profile_fields_lang`
-- 

CREATE TABLE `phpbb3_profile_fields_lang` (
  `field_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_id` mediumint(8) unsigned NOT NULL default '0',
  `option_id` mediumint(8) unsigned NOT NULL default '0',
  `field_type` tinyint(4) NOT NULL default '0',
  `lang_value` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`field_id`,`lang_id`,`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_profile_lang`
-- 

CREATE TABLE `phpbb3_profile_lang` (
  `field_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_name` varchar(255) collate utf8_bin NOT NULL default '',
  `lang_explain` text collate utf8_bin NOT NULL,
  `lang_default_value` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`field_id`,`lang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_ranks`
-- 

CREATE TABLE `phpbb3_ranks` (
  `rank_id` mediumint(8) unsigned NOT NULL auto_increment,
  `rank_title` varchar(255) collate utf8_bin NOT NULL default '',
  `rank_min` mediumint(8) unsigned NOT NULL default '0',
  `rank_special` tinyint(1) unsigned NOT NULL default '0',
  `rank_image` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`rank_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_reports`
-- 

CREATE TABLE `phpbb3_reports` (
  `report_id` mediumint(8) unsigned NOT NULL auto_increment,
  `reason_id` smallint(4) unsigned NOT NULL default '0',
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `user_notify` tinyint(1) unsigned NOT NULL default '0',
  `report_closed` tinyint(1) unsigned NOT NULL default '0',
  `report_time` int(11) unsigned NOT NULL default '0',
  `report_text` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`report_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=516 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_reports_reasons`
-- 

CREATE TABLE `phpbb3_reports_reasons` (
  `reason_id` smallint(4) unsigned NOT NULL auto_increment,
  `reason_title` varchar(255) collate utf8_bin NOT NULL default '',
  `reason_description` mediumtext collate utf8_bin NOT NULL,
  `reason_order` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`reason_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_search_results`
-- 

CREATE TABLE `phpbb3_search_results` (
  `search_key` varchar(32) collate utf8_bin NOT NULL default '',
  `search_time` int(11) unsigned NOT NULL default '0',
  `search_keywords` mediumtext collate utf8_bin NOT NULL,
  `search_authors` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`search_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_search_wordlist`
-- 

CREATE TABLE `phpbb3_search_wordlist` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word_text` varchar(255) collate utf8_bin NOT NULL default '',
  `word_common` tinyint(1) unsigned NOT NULL default '0',
  `word_count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`word_id`),
  UNIQUE KEY `wrd_txt` (`word_text`),
  KEY `wrd_cnt` (`word_count`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=879361 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_search_wordmatch`
-- 

CREATE TABLE `phpbb3_search_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `word_id` mediumint(8) unsigned NOT NULL default '0',
  `title_match` tinyint(1) unsigned NOT NULL default '0',
  UNIQUE KEY `unq_mtch` (`word_id`,`post_id`,`title_match`),
  KEY `word_id` (`word_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_sec_users`
-- 

CREATE TABLE `phpbb3_sec_users` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `user_type` tinyint(2) NOT NULL default '0',
  `group_id` mediumint(8) unsigned NOT NULL default '3',
  `user_permissions` mediumtext character set utf8 collate utf8_bin NOT NULL,
  `user_perm_from` mediumint(8) unsigned NOT NULL default '0',
  `user_ip` varchar(40) character set utf8 collate utf8_bin NOT NULL default '',
  `user_regdate` int(11) unsigned NOT NULL default '0',
  `username` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `username_clean` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_password` varchar(40) character set utf8 collate utf8_bin NOT NULL default '',
  `user_passchg` int(11) unsigned NOT NULL default '0',
  `user_pass_convert` tinyint(1) unsigned NOT NULL default '0',
  `user_email` varchar(100) character set utf8 collate utf8_bin NOT NULL default '',
  `user_email_hash` bigint(20) NOT NULL default '0',
  `user_birthday` varchar(10) character set utf8 collate utf8_bin NOT NULL default '',
  `user_lastvisit` int(11) unsigned NOT NULL default '0',
  `user_lastmark` int(11) unsigned NOT NULL default '0',
  `user_lastpost_time` int(11) unsigned NOT NULL default '0',
  `user_lastpage` varchar(200) character set utf8 collate utf8_bin NOT NULL default '',
  `user_last_confirm_key` varchar(10) character set utf8 collate utf8_bin NOT NULL default '',
  `user_last_search` int(11) unsigned NOT NULL default '0',
  `user_warnings` tinyint(4) NOT NULL default '0',
  `user_last_warning` int(11) unsigned NOT NULL default '0',
  `user_login_attempts` tinyint(4) NOT NULL default '0',
  `user_inactive_reason` tinyint(2) NOT NULL default '0',
  `user_inactive_time` int(11) unsigned NOT NULL default '0',
  `user_posts` mediumint(8) unsigned NOT NULL default '0',
  `user_lang` varchar(30) character set utf8 collate utf8_bin NOT NULL default '',
  `user_timezone` decimal(5,2) NOT NULL default '0.00',
  `user_dst` tinyint(1) unsigned NOT NULL default '0',
  `user_dateformat` varchar(30) character set utf8 collate utf8_bin NOT NULL default 'd M Y H:i',
  `user_style` mediumint(8) unsigned NOT NULL default '0',
  `user_rank` mediumint(8) unsigned NOT NULL default '0',
  `user_colour` varchar(6) character set utf8 collate utf8_bin NOT NULL default '',
  `user_new_privmsg` int(4) NOT NULL default '0',
  `user_unread_privmsg` int(4) NOT NULL default '0',
  `user_last_privmsg` int(11) unsigned NOT NULL default '0',
  `user_message_rules` tinyint(1) unsigned NOT NULL default '0',
  `user_full_folder` int(11) NOT NULL default '-3',
  `user_emailtime` int(11) unsigned NOT NULL default '0',
  `user_topic_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_topic_sortby_type` varchar(1) character set utf8 collate utf8_bin NOT NULL default 't',
  `user_topic_sortby_dir` varchar(1) character set utf8 collate utf8_bin NOT NULL default 'd',
  `user_post_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_post_sortby_type` varchar(1) character set utf8 collate utf8_bin NOT NULL default 't',
  `user_post_sortby_dir` varchar(1) character set utf8 collate utf8_bin NOT NULL default 'd',
  `user_notify` tinyint(1) unsigned NOT NULL default '0',
  `user_notify_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_notify_type` tinyint(4) NOT NULL default '0',
  `user_allow_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewonline` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewemail` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_massemail` tinyint(1) unsigned NOT NULL default '1',
  `user_options` int(11) unsigned NOT NULL default '895',
  `user_avatar` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_avatar_type` tinyint(2) NOT NULL default '0',
  `user_avatar_width` smallint(4) unsigned NOT NULL default '0',
  `user_avatar_height` smallint(4) unsigned NOT NULL default '0',
  `user_sig` mediumtext character set utf8 collate utf8_bin NOT NULL,
  `user_sig_bbcode_uid` varchar(8) character set utf8 collate utf8_bin NOT NULL default '',
  `user_sig_bbcode_bitfield` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_from` varchar(100) character set utf8 collate utf8_bin NOT NULL default '',
  `user_icq` varchar(15) character set utf8 collate utf8_bin NOT NULL default '',
  `user_aim` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_yim` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_msnm` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_jabber` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_website` varchar(200) character set utf8 collate utf8_bin NOT NULL default '',
  `user_occ` text character set utf8 collate utf8_bin NOT NULL,
  `user_interests` text character set utf8 collate utf8_bin NOT NULL,
  `user_actkey` varchar(32) character set utf8 collate utf8_bin NOT NULL default '',
  `user_newpasswd` varchar(40) character set utf8 collate utf8_bin NOT NULL default '',
  `user_form_salt` varchar(32) character set utf8 collate utf8_bin NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_sessions`
-- 

CREATE TABLE `phpbb3_sessions` (
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  `session_user_id` mediumint(8) unsigned NOT NULL default '0',
  `session_forum_id` mediumint(8) unsigned NOT NULL default '0',
  `session_last_visit` int(11) unsigned NOT NULL default '0',
  `session_start` int(11) unsigned NOT NULL default '0',
  `session_time` int(11) unsigned NOT NULL default '0',
  `session_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `session_browser` varchar(150) collate utf8_bin NOT NULL default '',
  `session_forwarded_for` varchar(255) collate utf8_bin NOT NULL default '',
  `session_page` varchar(255) collate utf8_bin NOT NULL default '',
  `session_viewonline` tinyint(1) unsigned NOT NULL default '1',
  `session_autologin` tinyint(1) unsigned NOT NULL default '0',
  `session_admin` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `session_time` (`session_time`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_fid` (`session_forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_sessions_keys`
-- 

CREATE TABLE `phpbb3_sessions_keys` (
  `key_id` char(32) collate utf8_bin NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `last_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `last_login` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`key_id`,`user_id`),
  KEY `last_login` (`last_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_Sides`
-- 

CREATE TABLE `phpbb3_Sides` (
  `side_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `side_name` varchar(50) character set utf8 collate utf8_bin NOT NULL,
  `side_open` char(1) character set utf8 collate utf8_bin NOT NULL default 'Y',
  `side_player` mediumint(5) NOT NULL default '0',
  PRIMARY KEY  (`side_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3830 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_sitelist`
-- 

CREATE TABLE `phpbb3_sitelist` (
  `site_id` mediumint(8) unsigned NOT NULL auto_increment,
  `site_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `site_hostname` varchar(255) collate utf8_bin NOT NULL default '',
  `ip_exclude` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_smilies`
-- 

CREATE TABLE `phpbb3_smilies` (
  `smiley_id` mediumint(8) unsigned NOT NULL auto_increment,
  `code` varchar(50) collate utf8_bin NOT NULL default '',
  `emotion` varchar(50) collate utf8_bin NOT NULL default '',
  `smiley_url` varchar(50) collate utf8_bin NOT NULL default '',
  `smiley_width` smallint(4) unsigned NOT NULL default '0',
  `smiley_height` smallint(4) unsigned NOT NULL default '0',
  `smiley_order` mediumint(8) unsigned NOT NULL default '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`smiley_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=102 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_styles`
-- 

CREATE TABLE `phpbb3_styles` (
  `style_id` mediumint(8) unsigned NOT NULL auto_increment,
  `style_name` varchar(255) collate utf8_bin NOT NULL default '',
  `style_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `style_active` tinyint(1) unsigned NOT NULL default '1',
  `template_id` mediumint(8) unsigned NOT NULL default '0',
  `theme_id` mediumint(8) unsigned NOT NULL default '0',
  `imageset_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`style_id`),
  UNIQUE KEY `style_name` (`style_name`),
  KEY `template_id` (`template_id`),
  KEY `theme_id` (`theme_id`),
  KEY `imageset_id` (`imageset_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_styles_imageset`
-- 

CREATE TABLE `phpbb3_styles_imageset` (
  `imageset_id` mediumint(8) unsigned NOT NULL auto_increment,
  `imageset_name` varchar(255) collate utf8_bin NOT NULL default '',
  `imageset_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `imageset_path` varchar(100) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`imageset_id`),
  UNIQUE KEY `imgset_nm` (`imageset_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_styles_imageset_data`
-- 

CREATE TABLE `phpbb3_styles_imageset_data` (
  `image_id` mediumint(8) unsigned NOT NULL auto_increment,
  `image_name` varchar(200) collate utf8_bin NOT NULL default '',
  `image_filename` varchar(200) collate utf8_bin NOT NULL default '',
  `image_lang` varchar(30) collate utf8_bin NOT NULL default '',
  `image_height` smallint(4) unsigned NOT NULL default '0',
  `image_width` smallint(4) unsigned NOT NULL default '0',
  `imageset_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`image_id`),
  KEY `i_d` (`imageset_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=495 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_styles_template`
-- 

CREATE TABLE `phpbb3_styles_template` (
  `template_id` mediumint(8) unsigned NOT NULL auto_increment,
  `template_name` varchar(255) collate utf8_bin NOT NULL default '',
  `template_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `template_path` varchar(100) collate utf8_bin NOT NULL default '',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default 'kNg=',
  `template_storedb` tinyint(1) unsigned NOT NULL default '0',
  `template_inherits_id` int(4) unsigned NOT NULL default '0',
  `template_inherit_path` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`template_id`),
  UNIQUE KEY `tmplte_nm` (`template_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_styles_template_data`
-- 

CREATE TABLE `phpbb3_styles_template_data` (
  `template_id` mediumint(8) unsigned NOT NULL default '0',
  `template_filename` varchar(100) collate utf8_bin NOT NULL default '',
  `template_included` text collate utf8_bin NOT NULL,
  `template_mtime` int(11) unsigned NOT NULL default '0',
  `template_data` mediumtext collate utf8_bin NOT NULL,
  KEY `tid` (`template_id`),
  KEY `tfn` (`template_filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_styles_theme`
-- 

CREATE TABLE `phpbb3_styles_theme` (
  `theme_id` mediumint(8) unsigned NOT NULL auto_increment,
  `theme_name` varchar(255) collate utf8_bin NOT NULL default '',
  `theme_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `theme_path` varchar(100) collate utf8_bin NOT NULL default '',
  `theme_storedb` tinyint(1) unsigned NOT NULL default '0',
  `theme_mtime` int(11) unsigned NOT NULL default '0',
  `theme_data` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`theme_id`),
  UNIQUE KEY `theme_name` (`theme_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_Szervez`
-- 

CREATE TABLE `phpbb3_Szervez` (
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

-- 
-- Tábla szerkezet: `phpbb3_topics`
-- 

CREATE TABLE `phpbb3_topics` (
  `topic_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_attachment` tinyint(1) unsigned NOT NULL default '0',
  `topic_approved` tinyint(1) unsigned NOT NULL default '1',
  `topic_reported` tinyint(1) unsigned NOT NULL default '0',
  `topic_title` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `topic_poster` mediumint(8) unsigned NOT NULL default '0',
  `topic_time` int(11) unsigned NOT NULL default '0',
  `topic_time_limit` int(11) unsigned NOT NULL default '0',
  `topic_views` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies_real` mediumint(8) unsigned NOT NULL default '0',
  `topic_status` tinyint(3) NOT NULL default '0',
  `topic_type` tinyint(3) NOT NULL default '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_first_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_first_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_last_poster_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_last_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_last_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `topic_last_post_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_last_post_time` int(11) unsigned NOT NULL default '0',
  `topic_last_view_time` int(11) unsigned NOT NULL default '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_bumped` tinyint(1) unsigned NOT NULL default '0',
  `topic_bumper` mediumint(8) unsigned NOT NULL default '0',
  `poll_title` varchar(255) collate utf8_bin NOT NULL default '',
  `poll_start` int(11) unsigned NOT NULL default '0',
  `poll_length` int(11) unsigned NOT NULL default '0',
  `poll_max_options` tinyint(4) NOT NULL default '1',
  `poll_last_vote` int(11) unsigned NOT NULL default '0',
  `poll_vote_change` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_type` (`forum_id`,`topic_type`),
  KEY `last_post_time` (`topic_last_post_time`),
  KEY `topic_approved` (`topic_approved`),
  KEY `forum_appr_last` (`forum_id`,`topic_approved`,`topic_last_post_id`),
  KEY `fid_time_moved` (`forum_id`,`topic_last_post_time`,`topic_moved_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5837 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_topics_posted`
-- 

CREATE TABLE `phpbb3_topics_posted` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_posted` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_topics_track`
-- 

CREATE TABLE `phpbb3_topics_track` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `mark_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`topic_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_topics_watch`
-- 

CREATE TABLE `phpbb3_topics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `notify_status` tinyint(1) unsigned NOT NULL default '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_users`
-- 

CREATE TABLE `phpbb3_users` (
  `user_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_type` tinyint(2) NOT NULL default '0',
  `group_id` mediumint(8) unsigned NOT NULL default '3',
  `user_permissions` mediumtext collate utf8_bin NOT NULL,
  `user_perm_from` mediumint(8) unsigned NOT NULL default '0',
  `user_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `user_regdate` int(11) unsigned NOT NULL default '0',
  `username` varchar(255) collate utf8_bin NOT NULL default '',
  `username_clean` varchar(255) collate utf8_bin NOT NULL default '',
  `user_password` varchar(40) collate utf8_bin NOT NULL default '',
  `user_passchg` int(11) unsigned NOT NULL default '0',
  `user_pass_convert` tinyint(1) unsigned NOT NULL default '0',
  `user_email` varchar(100) collate utf8_bin NOT NULL default '',
  `user_email_hash` bigint(20) NOT NULL default '0',
  `user_birthday` varchar(10) collate utf8_bin NOT NULL default '',
  `user_lastvisit` int(11) unsigned NOT NULL default '0',
  `user_lastmark` int(11) unsigned NOT NULL default '0',
  `user_lastpost_time` int(11) unsigned NOT NULL default '0',
  `user_lastpage` varchar(200) collate utf8_bin NOT NULL default '',
  `user_last_confirm_key` varchar(10) collate utf8_bin NOT NULL default '',
  `user_last_search` int(11) unsigned NOT NULL default '0',
  `user_warnings` tinyint(4) NOT NULL default '0',
  `user_last_warning` int(11) unsigned NOT NULL default '0',
  `user_login_attempts` tinyint(4) NOT NULL default '0',
  `user_inactive_reason` tinyint(2) NOT NULL default '0',
  `user_inactive_time` int(11) unsigned NOT NULL default '0',
  `user_posts` mediumint(8) unsigned NOT NULL default '0',
  `user_lang` varchar(30) collate utf8_bin NOT NULL default '',
  `user_timezone` decimal(5,2) NOT NULL default '0.00',
  `user_dst` tinyint(1) unsigned NOT NULL default '0',
  `user_dateformat` varchar(30) collate utf8_bin NOT NULL default 'd M Y H:i',
  `user_style` mediumint(8) unsigned NOT NULL default '0',
  `user_rank` mediumint(8) unsigned NOT NULL default '0',
  `user_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `user_new_privmsg` int(4) NOT NULL default '0',
  `user_unread_privmsg` int(4) NOT NULL default '0',
  `user_last_privmsg` int(11) unsigned NOT NULL default '0',
  `user_message_rules` tinyint(1) unsigned NOT NULL default '0',
  `user_full_folder` int(11) NOT NULL default '-3',
  `user_emailtime` int(11) unsigned NOT NULL default '0',
  `user_topic_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_topic_sortby_type` varchar(1) collate utf8_bin NOT NULL default 't',
  `user_topic_sortby_dir` varchar(1) collate utf8_bin NOT NULL default 'd',
  `user_post_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_post_sortby_type` varchar(1) collate utf8_bin NOT NULL default 't',
  `user_post_sortby_dir` varchar(1) collate utf8_bin NOT NULL default 'd',
  `user_notify` tinyint(1) unsigned NOT NULL default '0',
  `user_notify_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_notify_type` tinyint(4) NOT NULL default '0',
  `user_allow_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewonline` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewemail` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_massemail` tinyint(1) unsigned NOT NULL default '1',
  `user_options` int(11) unsigned NOT NULL default '895',
  `user_avatar` varchar(255) collate utf8_bin NOT NULL default '',
  `user_avatar_type` tinyint(2) NOT NULL default '0',
  `user_avatar_width` smallint(4) unsigned NOT NULL default '0',
  `user_avatar_height` smallint(4) unsigned NOT NULL default '0',
  `user_sig` mediumtext collate utf8_bin NOT NULL,
  `user_sig_bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `user_sig_bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `user_from` varchar(100) collate utf8_bin NOT NULL default '',
  `user_icq` varchar(15) collate utf8_bin NOT NULL default '',
  `user_aim` varchar(255) collate utf8_bin NOT NULL default '',
  `user_yim` varchar(255) collate utf8_bin NOT NULL default '',
  `user_msnm` varchar(255) collate utf8_bin NOT NULL default '',
  `user_jabber` varchar(255) collate utf8_bin NOT NULL default '',
  `user_website` varchar(200) collate utf8_bin NOT NULL default '',
  `user_occ` text collate utf8_bin NOT NULL,
  `user_interests` text collate utf8_bin NOT NULL,
  `user_actkey` varchar(32) collate utf8_bin NOT NULL default '',
  `user_newpasswd` varchar(40) collate utf8_bin NOT NULL default '',
  `user_form_salt` varchar(32) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `username_clean` (`username_clean`),
  KEY `user_birthday` (`user_birthday`),
  KEY `user_email_hash` (`user_email_hash`),
  KEY `user_type` (`user_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=26800 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_user_group`
-- 

CREATE TABLE `phpbb3_user_group` (
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `group_leader` tinyint(1) unsigned NOT NULL default '0',
  `user_pending` tinyint(1) unsigned NOT NULL default '1',
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_leader` (`group_leader`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_warnings`
-- 

CREATE TABLE `phpbb3_warnings` (
  `warning_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `log_id` mediumint(8) unsigned NOT NULL default '0',
  `warning_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`warning_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=490 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_words`
-- 

CREATE TABLE `phpbb3_words` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word` varchar(255) collate utf8_bin NOT NULL default '',
  `replacement` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`word_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=93 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb3_zebra`
-- 

CREATE TABLE `phpbb3_zebra` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `zebra_id` mediumint(8) unsigned NOT NULL default '0',
  `friend` tinyint(1) unsigned NOT NULL default '0',
  `foe` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`zebra_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_acl_groups`
-- 

CREATE TABLE `phpbbmonor_acl_groups` (
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  KEY `group_id` (`group_id`),
  KEY `auth_opt_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_acl_options`
-- 

CREATE TABLE `phpbbmonor_acl_options` (
  `auth_option_id` mediumint(8) unsigned NOT NULL auto_increment,
  `auth_option` varchar(50) collate utf8_bin NOT NULL default '',
  `is_global` tinyint(1) unsigned NOT NULL default '0',
  `is_local` tinyint(1) unsigned NOT NULL default '0',
  `founder_only` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`auth_option_id`),
  UNIQUE KEY `auth_option` (`auth_option`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=118 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_acl_roles`
-- 

CREATE TABLE `phpbbmonor_acl_roles` (
  `role_id` mediumint(8) unsigned NOT NULL auto_increment,
  `role_name` varchar(255) collate utf8_bin NOT NULL default '',
  `role_description` text collate utf8_bin NOT NULL,
  `role_type` varchar(10) collate utf8_bin NOT NULL default '',
  `role_order` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`role_id`),
  KEY `role_type` (`role_type`),
  KEY `role_order` (`role_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_acl_roles_data`
-- 

CREATE TABLE `phpbbmonor_acl_roles_data` (
  `role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`role_id`,`auth_option_id`),
  KEY `ath_op_id` (`auth_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_acl_users`
-- 

CREATE TABLE `phpbbmonor_acl_users` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  KEY `user_id` (`user_id`),
  KEY `auth_option_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_attachments`
-- 

CREATE TABLE `phpbbmonor_attachments` (
  `attach_id` mediumint(8) unsigned NOT NULL auto_increment,
  `post_msg_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `in_message` tinyint(1) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) unsigned NOT NULL default '0',
  `is_orphan` tinyint(1) unsigned NOT NULL default '1',
  `physical_filename` varchar(255) collate utf8_bin NOT NULL default '',
  `real_filename` varchar(255) collate utf8_bin NOT NULL default '',
  `download_count` mediumint(8) unsigned NOT NULL default '0',
  `attach_comment` text collate utf8_bin NOT NULL,
  `extension` varchar(100) collate utf8_bin NOT NULL default '',
  `mimetype` varchar(100) collate utf8_bin NOT NULL default '',
  `filesize` int(20) unsigned NOT NULL default '0',
  `filetime` int(11) unsigned NOT NULL default '0',
  `thumbnail` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`attach_id`),
  KEY `filetime` (`filetime`),
  KEY `post_msg_id` (`post_msg_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `is_orphan` (`is_orphan`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_banlist`
-- 

CREATE TABLE `phpbbmonor_banlist` (
  `ban_id` mediumint(8) unsigned NOT NULL auto_increment,
  `ban_userid` mediumint(8) unsigned NOT NULL default '0',
  `ban_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `ban_email` varchar(100) collate utf8_bin NOT NULL default '',
  `ban_start` int(11) unsigned NOT NULL default '0',
  `ban_end` int(11) unsigned NOT NULL default '0',
  `ban_exclude` tinyint(1) unsigned NOT NULL default '0',
  `ban_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `ban_give_reason` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`ban_id`),
  KEY `ban_end` (`ban_end`),
  KEY `ban_user` (`ban_userid`,`ban_exclude`),
  KEY `ban_email` (`ban_email`,`ban_exclude`),
  KEY `ban_ip` (`ban_ip`,`ban_exclude`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_bbcodes`
-- 

CREATE TABLE `phpbbmonor_bbcodes` (
  `bbcode_id` tinyint(3) NOT NULL default '0',
  `bbcode_tag` varchar(16) collate utf8_bin NOT NULL default '',
  `bbcode_helpline` varchar(255) collate utf8_bin NOT NULL default '',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_match` text collate utf8_bin NOT NULL,
  `bbcode_tpl` mediumtext collate utf8_bin NOT NULL,
  `first_pass_match` mediumtext collate utf8_bin NOT NULL,
  `first_pass_replace` mediumtext collate utf8_bin NOT NULL,
  `second_pass_match` mediumtext collate utf8_bin NOT NULL,
  `second_pass_replace` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`bbcode_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_bookmarks`
-- 

CREATE TABLE `phpbbmonor_bookmarks` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`topic_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_bots`
-- 

CREATE TABLE `phpbbmonor_bots` (
  `bot_id` mediumint(8) unsigned NOT NULL auto_increment,
  `bot_active` tinyint(1) unsigned NOT NULL default '1',
  `bot_name` varchar(255) collate utf8_bin NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `bot_agent` varchar(255) collate utf8_bin NOT NULL default '',
  `bot_ip` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`bot_id`),
  KEY `bot_active` (`bot_active`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_config`
-- 

CREATE TABLE `phpbbmonor_config` (
  `config_name` varchar(255) collate utf8_bin NOT NULL default '',
  `config_value` varchar(255) collate utf8_bin NOT NULL default '',
  `is_dynamic` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`config_name`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_confirm`
-- 

CREATE TABLE `phpbbmonor_confirm` (
  `confirm_id` char(32) collate utf8_bin NOT NULL default '',
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  `confirm_type` tinyint(3) NOT NULL default '0',
  `code` varchar(8) collate utf8_bin NOT NULL default '',
  `seed` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`,`confirm_id`),
  KEY `confirm_type` (`confirm_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_disallow`
-- 

CREATE TABLE `phpbbmonor_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL auto_increment,
  `disallow_username` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`disallow_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_drafts`
-- 

CREATE TABLE `phpbbmonor_drafts` (
  `draft_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `save_time` int(11) unsigned NOT NULL default '0',
  `draft_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `draft_message` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`draft_id`),
  KEY `save_time` (`save_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1390 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_extensions`
-- 

CREATE TABLE `phpbbmonor_extensions` (
  `extension_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `extension` varchar(100) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=67 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_extension_groups`
-- 

CREATE TABLE `phpbbmonor_extension_groups` (
  `group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `cat_id` tinyint(2) NOT NULL default '0',
  `allow_group` tinyint(1) unsigned NOT NULL default '0',
  `download_mode` tinyint(1) unsigned NOT NULL default '1',
  `upload_icon` varchar(255) collate utf8_bin NOT NULL default '',
  `max_filesize` int(20) unsigned NOT NULL default '0',
  `allowed_forums` text collate utf8_bin NOT NULL,
  `allow_in_pm` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_forums`
-- 

CREATE TABLE `phpbbmonor_forums` (
  `forum_id` mediumint(8) unsigned NOT NULL auto_increment,
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `left_id` mediumint(8) unsigned NOT NULL default '0',
  `right_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_parents` mediumtext collate utf8_bin NOT NULL,
  `forum_name` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_desc` text collate utf8_bin NOT NULL,
  `forum_desc_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_desc_options` int(11) unsigned NOT NULL default '7',
  `forum_desc_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `forum_link` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_password` varchar(40) collate utf8_bin NOT NULL default '',
  `forum_style` mediumint(8) unsigned NOT NULL default '0',
  `forum_image` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules` text collate utf8_bin NOT NULL,
  `forum_rules_link` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules_options` int(11) unsigned NOT NULL default '7',
  `forum_rules_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `forum_topics_per_page` tinyint(4) NOT NULL default '0',
  `forum_type` tinyint(4) NOT NULL default '0',
  `forum_status` tinyint(4) NOT NULL default '0',
  `forum_posts` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics_real` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_poster_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_last_post_time` int(11) unsigned NOT NULL default '0',
  `forum_last_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_last_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `forum_flags` tinyint(4) NOT NULL default '32',
  `display_subforum_list` tinyint(1) unsigned NOT NULL default '1',
  `display_on_index` tinyint(1) unsigned NOT NULL default '1',
  `enable_indexing` tinyint(1) unsigned NOT NULL default '1',
  `enable_icons` tinyint(1) unsigned NOT NULL default '1',
  `enable_prune` tinyint(1) unsigned NOT NULL default '0',
  `prune_next` int(11) unsigned NOT NULL default '0',
  `prune_days` mediumint(8) unsigned NOT NULL default '0',
  `prune_viewed` mediumint(8) unsigned NOT NULL default '0',
  `prune_freq` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`forum_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `forum_lastpost_id` (`forum_last_post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=46 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_forums_access`
-- 

CREATE TABLE `phpbbmonor_forums_access` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`forum_id`,`user_id`,`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_forums_track`
-- 

CREATE TABLE `phpbbmonor_forums_track` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `mark_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_forums_watch`
-- 

CREATE TABLE `phpbbmonor_forums_watch` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `notify_status` tinyint(1) unsigned NOT NULL default '0',
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_groups`
-- 

CREATE TABLE `phpbbmonor_groups` (
  `group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_type` tinyint(4) NOT NULL default '1',
  `group_founder_manage` tinyint(1) unsigned NOT NULL default '0',
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `group_desc` text collate utf8_bin NOT NULL,
  `group_desc_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `group_desc_options` int(11) unsigned NOT NULL default '7',
  `group_desc_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `group_display` tinyint(1) unsigned NOT NULL default '0',
  `group_avatar` varchar(255) collate utf8_bin NOT NULL default '',
  `group_avatar_type` tinyint(2) NOT NULL default '0',
  `group_avatar_width` smallint(4) unsigned NOT NULL default '0',
  `group_avatar_height` smallint(4) unsigned NOT NULL default '0',
  `group_rank` mediumint(8) unsigned NOT NULL default '0',
  `group_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `group_sig_chars` mediumint(8) unsigned NOT NULL default '0',
  `group_receive_pm` tinyint(1) unsigned NOT NULL default '0',
  `group_message_limit` mediumint(8) unsigned NOT NULL default '0',
  `group_max_recipients` mediumint(8) unsigned NOT NULL default '0',
  `group_legend` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`group_id`),
  KEY `group_legend_name` (`group_legend`,`group_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_icons`
-- 

CREATE TABLE `phpbbmonor_icons` (
  `icons_id` mediumint(8) unsigned NOT NULL auto_increment,
  `icons_url` varchar(255) collate utf8_bin NOT NULL default '',
  `icons_width` tinyint(4) NOT NULL default '0',
  `icons_height` tinyint(4) NOT NULL default '0',
  `icons_order` mediumint(8) unsigned NOT NULL default '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`icons_id`),
  KEY `display_on_posting` (`display_on_posting`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_lang`
-- 

CREATE TABLE `phpbbmonor_lang` (
  `lang_id` tinyint(4) NOT NULL auto_increment,
  `lang_iso` varchar(30) collate utf8_bin NOT NULL default '',
  `lang_dir` varchar(30) collate utf8_bin NOT NULL default '',
  `lang_english_name` varchar(100) collate utf8_bin NOT NULL default '',
  `lang_local_name` varchar(255) collate utf8_bin NOT NULL default '',
  `lang_author` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`lang_id`),
  KEY `lang_iso` (`lang_iso`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_log`
-- 

CREATE TABLE `phpbbmonor_log` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `log_type` tinyint(4) NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `reportee_id` mediumint(8) unsigned NOT NULL default '0',
  `log_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `log_time` int(11) unsigned NOT NULL default '0',
  `log_operation` text collate utf8_bin NOT NULL,
  `log_data` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `reportee_id` (`reportee_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2068 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_moderator_cache`
-- 

CREATE TABLE `phpbbmonor_moderator_cache` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `username` varchar(255) collate utf8_bin NOT NULL default '',
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `display_on_index` tinyint(1) unsigned NOT NULL default '1',
  KEY `disp_idx` (`display_on_index`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_modules`
-- 

CREATE TABLE `phpbbmonor_modules` (
  `module_id` mediumint(8) unsigned NOT NULL auto_increment,
  `module_enabled` tinyint(1) unsigned NOT NULL default '1',
  `module_display` tinyint(1) unsigned NOT NULL default '1',
  `module_basename` varchar(255) collate utf8_bin NOT NULL default '',
  `module_class` varchar(10) collate utf8_bin NOT NULL default '',
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `left_id` mediumint(8) unsigned NOT NULL default '0',
  `right_id` mediumint(8) unsigned NOT NULL default '0',
  `module_langname` varchar(255) collate utf8_bin NOT NULL default '',
  `module_mode` varchar(255) collate utf8_bin NOT NULL default '',
  `module_auth` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`module_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `module_enabled` (`module_enabled`),
  KEY `class_left_id` (`module_class`,`left_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=190 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_poll_options`
-- 

CREATE TABLE `phpbbmonor_poll_options` (
  `poll_option_id` tinyint(4) NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `poll_option_text` text collate utf8_bin NOT NULL,
  `poll_option_total` mediumint(8) unsigned NOT NULL default '0',
  KEY `poll_opt_id` (`poll_option_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_poll_votes`
-- 

CREATE TABLE `phpbbmonor_poll_votes` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `poll_option_id` tinyint(4) NOT NULL default '0',
  `vote_user_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_user_ip` varchar(40) collate utf8_bin NOT NULL default '',
  KEY `topic_id` (`topic_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_posts`
-- 

CREATE TABLE `phpbbmonor_posts` (
  `post_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `poster_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `post_time` int(11) unsigned NOT NULL default '0',
  `post_approved` tinyint(1) unsigned NOT NULL default '1',
  `post_reported` tinyint(1) unsigned NOT NULL default '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL default '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL default '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL default '1',
  `enable_sig` tinyint(1) unsigned NOT NULL default '1',
  `post_username` varchar(255) collate utf8_bin NOT NULL default '',
  `post_subject` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `post_text` mediumtext collate utf8_bin NOT NULL,
  `post_checksum` varchar(32) collate utf8_bin NOT NULL default '',
  `post_attachment` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `post_postcount` tinyint(1) unsigned NOT NULL default '1',
  `post_edit_time` int(11) unsigned NOT NULL default '0',
  `post_edit_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `post_edit_user` mediumint(8) unsigned NOT NULL default '0',
  `post_edit_count` smallint(4) unsigned NOT NULL default '0',
  `post_edit_locked` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_ip` (`poster_ip`),
  KEY `poster_id` (`poster_id`),
  KEY `post_approved` (`post_approved`),
  KEY `tid_post_time` (`topic_id`,`post_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=109495 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_privmsgs`
-- 

CREATE TABLE `phpbbmonor_privmsgs` (
  `msg_id` mediumint(8) unsigned NOT NULL auto_increment,
  `root_level` mediumint(8) unsigned NOT NULL default '0',
  `author_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `author_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `message_time` int(11) unsigned NOT NULL default '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL default '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL default '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL default '1',
  `enable_sig` tinyint(1) unsigned NOT NULL default '1',
  `message_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `message_text` mediumtext collate utf8_bin NOT NULL,
  `message_edit_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `message_edit_user` mediumint(8) unsigned NOT NULL default '0',
  `message_attachment` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `message_edit_time` int(11) unsigned NOT NULL default '0',
  `message_edit_count` smallint(4) unsigned NOT NULL default '0',
  `to_address` text collate utf8_bin NOT NULL,
  `bcc_address` text collate utf8_bin NOT NULL,
  PRIMARY KEY  (`msg_id`),
  KEY `author_ip` (`author_ip`),
  KEY `message_time` (`message_time`),
  KEY `author_id` (`author_id`),
  KEY `root_level` (`root_level`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=564 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_privmsgs_folder`
-- 

CREATE TABLE `phpbbmonor_privmsgs_folder` (
  `folder_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `folder_name` varchar(255) collate utf8_bin NOT NULL default '',
  `pm_count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`folder_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_privmsgs_rules`
-- 

CREATE TABLE `phpbbmonor_privmsgs_rules` (
  `rule_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_check` mediumint(8) unsigned NOT NULL default '0',
  `rule_connection` mediumint(8) unsigned NOT NULL default '0',
  `rule_string` varchar(255) collate utf8_bin NOT NULL default '',
  `rule_user_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_group_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_action` mediumint(8) unsigned NOT NULL default '0',
  `rule_folder_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`rule_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_privmsgs_to`
-- 

CREATE TABLE `phpbbmonor_privmsgs_to` (
  `msg_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `author_id` mediumint(8) unsigned NOT NULL default '0',
  `pm_deleted` tinyint(1) unsigned NOT NULL default '0',
  `pm_new` tinyint(1) unsigned NOT NULL default '1',
  `pm_unread` tinyint(1) unsigned NOT NULL default '1',
  `pm_replied` tinyint(1) unsigned NOT NULL default '0',
  `pm_marked` tinyint(1) unsigned NOT NULL default '0',
  `pm_forwarded` tinyint(1) unsigned NOT NULL default '0',
  `folder_id` int(11) NOT NULL default '0',
  KEY `msg_id` (`msg_id`),
  KEY `author_id` (`author_id`),
  KEY `usr_flder_id` (`user_id`,`folder_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_profile_fields`
-- 

CREATE TABLE `phpbbmonor_profile_fields` (
  `field_id` mediumint(8) unsigned NOT NULL auto_increment,
  `field_name` varchar(255) collate utf8_bin NOT NULL default '',
  `field_type` tinyint(4) NOT NULL default '0',
  `field_ident` varchar(20) collate utf8_bin NOT NULL default '',
  `field_length` varchar(20) collate utf8_bin NOT NULL default '',
  `field_minlen` varchar(255) collate utf8_bin NOT NULL default '',
  `field_maxlen` varchar(255) collate utf8_bin NOT NULL default '',
  `field_novalue` varchar(255) collate utf8_bin NOT NULL default '',
  `field_default_value` varchar(255) collate utf8_bin NOT NULL default '',
  `field_validation` varchar(20) collate utf8_bin NOT NULL default '',
  `field_required` tinyint(1) unsigned NOT NULL default '0',
  `field_show_on_reg` tinyint(1) unsigned NOT NULL default '0',
  `field_show_profile` tinyint(1) unsigned NOT NULL default '0',
  `field_hide` tinyint(1) unsigned NOT NULL default '0',
  `field_no_view` tinyint(1) unsigned NOT NULL default '0',
  `field_active` tinyint(1) unsigned NOT NULL default '0',
  `field_order` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`field_id`),
  KEY `fld_type` (`field_type`),
  KEY `fld_ordr` (`field_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_profile_fields_data`
-- 

CREATE TABLE `phpbbmonor_profile_fields_data` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `pf_fegyver_tipus` text collate utf8_bin,
  `pf_bemutatkozas` text collate utf8_bin,
  `pf_fofegyvered_t` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_profile_fields_lang`
-- 

CREATE TABLE `phpbbmonor_profile_fields_lang` (
  `field_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_id` mediumint(8) unsigned NOT NULL default '0',
  `option_id` mediumint(8) unsigned NOT NULL default '0',
  `field_type` tinyint(4) NOT NULL default '0',
  `lang_value` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`field_id`,`lang_id`,`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_profile_lang`
-- 

CREATE TABLE `phpbbmonor_profile_lang` (
  `field_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_name` varchar(255) collate utf8_bin NOT NULL default '',
  `lang_explain` text collate utf8_bin NOT NULL,
  `lang_default_value` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`field_id`,`lang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_ranks`
-- 

CREATE TABLE `phpbbmonor_ranks` (
  `rank_id` mediumint(8) unsigned NOT NULL auto_increment,
  `rank_title` varchar(255) collate utf8_bin NOT NULL default '',
  `rank_min` mediumint(8) unsigned NOT NULL default '0',
  `rank_special` tinyint(1) unsigned NOT NULL default '0',
  `rank_image` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`rank_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=45 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_reports`
-- 

CREATE TABLE `phpbbmonor_reports` (
  `report_id` mediumint(8) unsigned NOT NULL auto_increment,
  `reason_id` smallint(4) unsigned NOT NULL default '0',
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `user_notify` tinyint(1) unsigned NOT NULL default '0',
  `report_closed` tinyint(1) unsigned NOT NULL default '0',
  `report_time` int(11) unsigned NOT NULL default '0',
  `report_text` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_reports_reasons`
-- 

CREATE TABLE `phpbbmonor_reports_reasons` (
  `reason_id` smallint(4) unsigned NOT NULL auto_increment,
  `reason_title` varchar(255) collate utf8_bin NOT NULL default '',
  `reason_description` mediumtext collate utf8_bin NOT NULL,
  `reason_order` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`reason_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_search_results`
-- 

CREATE TABLE `phpbbmonor_search_results` (
  `search_key` varchar(32) collate utf8_bin NOT NULL default '',
  `search_time` int(11) unsigned NOT NULL default '0',
  `search_keywords` mediumtext collate utf8_bin NOT NULL,
  `search_authors` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`search_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_search_wordlist`
-- 

CREATE TABLE `phpbbmonor_search_wordlist` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word_text` varchar(255) collate utf8_bin NOT NULL default '',
  `word_common` tinyint(1) unsigned NOT NULL default '0',
  `word_count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`word_id`),
  UNIQUE KEY `wrd_txt` (`word_text`),
  KEY `wrd_cnt` (`word_count`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9863081 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_search_wordmatch`
-- 

CREATE TABLE `phpbbmonor_search_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `word_id` mediumint(8) unsigned NOT NULL default '0',
  `title_match` tinyint(1) unsigned NOT NULL default '0',
  UNIQUE KEY `unq_mtch` (`word_id`,`post_id`,`title_match`),
  KEY `word_id` (`word_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_sessions`
-- 

CREATE TABLE `phpbbmonor_sessions` (
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  `session_user_id` mediumint(8) unsigned NOT NULL default '0',
  `session_forum_id` mediumint(8) unsigned NOT NULL default '0',
  `session_last_visit` int(11) unsigned NOT NULL default '0',
  `session_start` int(11) unsigned NOT NULL default '0',
  `session_time` int(11) unsigned NOT NULL default '0',
  `session_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `session_browser` varchar(150) collate utf8_bin NOT NULL default '',
  `session_forwarded_for` varchar(255) collate utf8_bin NOT NULL default '',
  `session_page` varchar(255) collate utf8_bin NOT NULL default '',
  `session_viewonline` tinyint(1) unsigned NOT NULL default '1',
  `session_autologin` tinyint(1) unsigned NOT NULL default '0',
  `session_admin` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `session_time` (`session_time`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_fid` (`session_forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_sessions_keys`
-- 

CREATE TABLE `phpbbmonor_sessions_keys` (
  `key_id` char(32) collate utf8_bin NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `last_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `last_login` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`key_id`,`user_id`),
  KEY `last_login` (`last_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_sitelist`
-- 

CREATE TABLE `phpbbmonor_sitelist` (
  `site_id` mediumint(8) unsigned NOT NULL auto_increment,
  `site_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `site_hostname` varchar(255) collate utf8_bin NOT NULL default '',
  `ip_exclude` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_smilies`
-- 

CREATE TABLE `phpbbmonor_smilies` (
  `smiley_id` mediumint(8) unsigned NOT NULL auto_increment,
  `code` varchar(50) collate utf8_bin NOT NULL default '',
  `emotion` varchar(50) collate utf8_bin NOT NULL default '',
  `smiley_url` varchar(50) collate utf8_bin NOT NULL default '',
  `smiley_width` smallint(4) unsigned NOT NULL default '0',
  `smiley_height` smallint(4) unsigned NOT NULL default '0',
  `smiley_order` mediumint(8) unsigned NOT NULL default '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`smiley_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=85 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_styles`
-- 

CREATE TABLE `phpbbmonor_styles` (
  `style_id` mediumint(8) unsigned NOT NULL auto_increment,
  `style_name` varchar(255) collate utf8_bin NOT NULL default '',
  `style_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `style_active` tinyint(1) unsigned NOT NULL default '1',
  `template_id` mediumint(8) unsigned NOT NULL default '0',
  `theme_id` mediumint(8) unsigned NOT NULL default '0',
  `imageset_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`style_id`),
  UNIQUE KEY `style_name` (`style_name`),
  KEY `template_id` (`template_id`),
  KEY `theme_id` (`theme_id`),
  KEY `imageset_id` (`imageset_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_styles_imageset`
-- 

CREATE TABLE `phpbbmonor_styles_imageset` (
  `imageset_id` mediumint(8) unsigned NOT NULL auto_increment,
  `imageset_name` varchar(255) collate utf8_bin NOT NULL default '',
  `imageset_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `imageset_path` varchar(100) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`imageset_id`),
  UNIQUE KEY `imgset_nm` (`imageset_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_styles_imageset_data`
-- 

CREATE TABLE `phpbbmonor_styles_imageset_data` (
  `image_id` mediumint(8) unsigned NOT NULL auto_increment,
  `image_name` varchar(200) collate utf8_bin NOT NULL default '',
  `image_filename` varchar(200) collate utf8_bin NOT NULL default '',
  `image_lang` varchar(30) collate utf8_bin NOT NULL default '',
  `image_height` smallint(4) unsigned NOT NULL default '0',
  `image_width` smallint(4) unsigned NOT NULL default '0',
  `imageset_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`image_id`),
  KEY `i_d` (`imageset_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1546 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_styles_template`
-- 

CREATE TABLE `phpbbmonor_styles_template` (
  `template_id` mediumint(8) unsigned NOT NULL auto_increment,
  `template_name` varchar(255) collate utf8_bin NOT NULL default '',
  `template_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `template_path` varchar(100) collate utf8_bin NOT NULL default '',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default 'kNg=',
  `template_storedb` tinyint(1) unsigned NOT NULL default '0',
  `template_inherits_id` int(4) unsigned NOT NULL default '0',
  `template_inherit_path` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`template_id`),
  UNIQUE KEY `tmplte_nm` (`template_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_styles_template_data`
-- 

CREATE TABLE `phpbbmonor_styles_template_data` (
  `template_id` mediumint(8) unsigned NOT NULL default '0',
  `template_filename` varchar(100) collate utf8_bin NOT NULL default '',
  `template_included` text collate utf8_bin NOT NULL,
  `template_mtime` int(11) unsigned NOT NULL default '0',
  `template_data` mediumtext collate utf8_bin NOT NULL,
  KEY `tid` (`template_id`),
  KEY `tfn` (`template_filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_styles_theme`
-- 

CREATE TABLE `phpbbmonor_styles_theme` (
  `theme_id` mediumint(8) unsigned NOT NULL auto_increment,
  `theme_name` varchar(255) collate utf8_bin NOT NULL default '',
  `theme_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `theme_path` varchar(100) collate utf8_bin NOT NULL default '',
  `theme_storedb` tinyint(1) unsigned NOT NULL default '0',
  `theme_mtime` int(11) unsigned NOT NULL default '0',
  `theme_data` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`theme_id`),
  UNIQUE KEY `theme_name` (`theme_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_topics`
-- 

CREATE TABLE `phpbbmonor_topics` (
  `topic_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_attachment` tinyint(1) unsigned NOT NULL default '0',
  `topic_approved` tinyint(1) unsigned NOT NULL default '1',
  `topic_reported` tinyint(1) unsigned NOT NULL default '0',
  `topic_title` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `topic_poster` mediumint(8) unsigned NOT NULL default '0',
  `topic_time` int(11) unsigned NOT NULL default '0',
  `topic_time_limit` int(11) unsigned NOT NULL default '0',
  `topic_views` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies_real` mediumint(8) unsigned NOT NULL default '0',
  `topic_status` tinyint(3) NOT NULL default '0',
  `topic_type` tinyint(3) NOT NULL default '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_first_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_first_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_last_poster_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_last_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_last_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `topic_last_post_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_last_post_time` int(11) unsigned NOT NULL default '0',
  `topic_last_view_time` int(11) unsigned NOT NULL default '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_bumped` tinyint(1) unsigned NOT NULL default '0',
  `topic_bumper` mediumint(8) unsigned NOT NULL default '0',
  `poll_title` varchar(255) collate utf8_bin NOT NULL default '',
  `poll_start` int(11) unsigned NOT NULL default '0',
  `poll_length` int(11) unsigned NOT NULL default '0',
  `poll_max_options` tinyint(4) NOT NULL default '1',
  `poll_last_vote` int(11) unsigned NOT NULL default '0',
  `poll_vote_change` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_type` (`forum_id`,`topic_type`),
  KEY `last_post_time` (`topic_last_post_time`),
  KEY `topic_approved` (`topic_approved`),
  KEY `forum_appr_last` (`forum_id`,`topic_approved`,`topic_last_post_id`),
  KEY `fid_time_moved` (`forum_id`,`topic_last_post_time`,`topic_moved_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=38275 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_topics_posted`
-- 

CREATE TABLE `phpbbmonor_topics_posted` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_posted` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_topics_track`
-- 

CREATE TABLE `phpbbmonor_topics_track` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `mark_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`topic_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_topics_watch`
-- 

CREATE TABLE `phpbbmonor_topics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `notify_status` tinyint(1) unsigned NOT NULL default '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_users`
-- 

CREATE TABLE `phpbbmonor_users` (
  `user_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_type` tinyint(2) NOT NULL default '0',
  `group_id` mediumint(8) unsigned NOT NULL default '3',
  `user_permissions` mediumtext collate utf8_bin NOT NULL,
  `user_perm_from` mediumint(8) unsigned NOT NULL default '0',
  `user_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `user_regdate` int(11) unsigned NOT NULL default '0',
  `username` varchar(255) collate utf8_bin NOT NULL default '',
  `username_clean` varchar(255) collate utf8_bin NOT NULL default '',
  `user_password` varchar(40) collate utf8_bin NOT NULL default '',
  `user_passchg` int(11) unsigned NOT NULL default '0',
  `user_pass_convert` tinyint(1) unsigned NOT NULL default '0',
  `user_email` varchar(100) collate utf8_bin NOT NULL default '',
  `user_email_hash` bigint(20) NOT NULL default '0',
  `user_birthday` varchar(10) collate utf8_bin NOT NULL default '',
  `user_lastvisit` int(11) unsigned NOT NULL default '0',
  `user_lastmark` int(11) unsigned NOT NULL default '0',
  `user_lastpost_time` int(11) unsigned NOT NULL default '0',
  `user_lastpage` varchar(200) collate utf8_bin NOT NULL default '',
  `user_last_confirm_key` varchar(10) collate utf8_bin NOT NULL default '',
  `user_last_search` int(11) unsigned NOT NULL default '0',
  `user_warnings` tinyint(4) NOT NULL default '0',
  `user_last_warning` int(11) unsigned NOT NULL default '0',
  `user_login_attempts` tinyint(4) NOT NULL default '0',
  `user_inactive_reason` tinyint(2) NOT NULL default '0',
  `user_inactive_time` int(11) unsigned NOT NULL default '0',
  `user_posts` mediumint(8) unsigned NOT NULL default '0',
  `user_lang` varchar(30) collate utf8_bin NOT NULL default '',
  `user_timezone` decimal(5,2) NOT NULL default '0.00',
  `user_dst` tinyint(1) unsigned NOT NULL default '0',
  `user_dateformat` varchar(30) collate utf8_bin NOT NULL default 'd M Y H:i',
  `user_style` mediumint(8) unsigned NOT NULL default '0',
  `user_rank` mediumint(8) unsigned NOT NULL default '0',
  `user_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `user_new_privmsg` int(4) NOT NULL default '0',
  `user_unread_privmsg` int(4) NOT NULL default '0',
  `user_last_privmsg` int(11) unsigned NOT NULL default '0',
  `user_message_rules` tinyint(1) unsigned NOT NULL default '0',
  `user_full_folder` int(11) NOT NULL default '-3',
  `user_emailtime` int(11) unsigned NOT NULL default '0',
  `user_topic_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_topic_sortby_type` varchar(1) collate utf8_bin NOT NULL default 't',
  `user_topic_sortby_dir` varchar(1) collate utf8_bin NOT NULL default 'd',
  `user_post_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_post_sortby_type` varchar(1) collate utf8_bin NOT NULL default 't',
  `user_post_sortby_dir` varchar(1) collate utf8_bin NOT NULL default 'a',
  `user_notify` tinyint(1) unsigned NOT NULL default '0',
  `user_notify_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_notify_type` tinyint(4) NOT NULL default '0',
  `user_allow_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewonline` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewemail` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_massemail` tinyint(1) unsigned NOT NULL default '1',
  `user_options` int(11) unsigned NOT NULL default '895',
  `user_avatar` varchar(255) collate utf8_bin NOT NULL default '',
  `user_avatar_type` tinyint(2) NOT NULL default '0',
  `user_avatar_width` smallint(4) unsigned NOT NULL default '0',
  `user_avatar_height` smallint(4) unsigned NOT NULL default '0',
  `user_sig` mediumtext collate utf8_bin NOT NULL,
  `user_sig_bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `user_sig_bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `user_from` varchar(100) collate utf8_bin NOT NULL default '',
  `user_icq` varchar(15) collate utf8_bin NOT NULL default '',
  `user_aim` varchar(255) collate utf8_bin NOT NULL default '',
  `user_yim` varchar(255) collate utf8_bin NOT NULL default '',
  `user_msnm` varchar(255) collate utf8_bin NOT NULL default '',
  `user_jabber` varchar(255) collate utf8_bin NOT NULL default '',
  `user_website` varchar(200) collate utf8_bin NOT NULL default '',
  `user_occ` text collate utf8_bin NOT NULL,
  `user_interests` text collate utf8_bin NOT NULL,
  `user_actkey` varchar(32) collate utf8_bin NOT NULL default '',
  `user_newpasswd` varchar(40) collate utf8_bin NOT NULL default '',
  `user_form_salt` varchar(32) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `username_clean` (`username_clean`),
  KEY `user_birthday` (`user_birthday`),
  KEY `user_email_hash` (`user_email_hash`),
  KEY `user_type` (`user_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=105944 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_user_group`
-- 

CREATE TABLE `phpbbmonor_user_group` (
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `group_leader` tinyint(1) unsigned NOT NULL default '0',
  `user_pending` tinyint(1) unsigned NOT NULL default '1',
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_leader` (`group_leader`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_warnings`
-- 

CREATE TABLE `phpbbmonor_warnings` (
  `warning_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `log_id` mediumint(8) unsigned NOT NULL default '0',
  `warning_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`warning_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_words`
-- 

CREATE TABLE `phpbbmonor_words` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word` varchar(255) collate utf8_bin NOT NULL default '',
  `replacement` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbbmonor_zebra`
-- 

CREATE TABLE `phpbbmonor_zebra` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `zebra_id` mediumint(8) unsigned NOT NULL default '0',
  `friend` tinyint(1) unsigned NOT NULL default '0',
  `foe` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`zebra_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_auth_access`
-- 

CREATE TABLE `phpbb_auth_access` (
  `group_id` mediumint(8) NOT NULL default '0',
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `auth_view` tinyint(1) NOT NULL default '0',
  `auth_read` tinyint(1) NOT NULL default '0',
  `auth_post` tinyint(1) NOT NULL default '0',
  `auth_reply` tinyint(1) NOT NULL default '0',
  `auth_edit` tinyint(1) NOT NULL default '0',
  `auth_delete` tinyint(1) NOT NULL default '0',
  `auth_sticky` tinyint(1) NOT NULL default '0',
  `auth_announce` tinyint(1) NOT NULL default '0',
  `auth_vote` tinyint(1) NOT NULL default '0',
  `auth_pollcreate` tinyint(1) NOT NULL default '0',
  `auth_attachments` tinyint(1) NOT NULL default '0',
  `auth_mod` tinyint(1) NOT NULL default '0',
  KEY `group_id` (`group_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_banlist`
-- 

CREATE TABLE `phpbb_banlist` (
  `ban_id` mediumint(8) unsigned NOT NULL auto_increment,
  `ban_userid` mediumint(8) NOT NULL default '0',
  `ban_ip` varchar(8) NOT NULL default '',
  `ban_email` varchar(255) default NULL,
  PRIMARY KEY  (`ban_id`),
  KEY `ban_ip_user_id` (`ban_ip`,`ban_userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=276 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_categories`
-- 

CREATE TABLE `phpbb_categories` (
  `cat_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cat_title` varchar(100) default NULL,
  `cat_order` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  KEY `cat_order` (`cat_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_config`
-- 

CREATE TABLE `phpbb_config` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_config_c`
-- 

CREATE TABLE `phpbb_config_c` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_config_orig`
-- 

CREATE TABLE `phpbb_config_orig` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_confirm`
-- 

CREATE TABLE `phpbb_confirm` (
  `confirm_id` char(32) NOT NULL default '',
  `session_id` char(32) NOT NULL default '',
  `code` char(6) NOT NULL default '',
  PRIMARY KEY  (`session_id`,`confirm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_disallow`
-- 

CREATE TABLE `phpbb_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL auto_increment,
  `disallow_username` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`disallow_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_forums`
-- 

CREATE TABLE `phpbb_forums` (
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `cat_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_name` varchar(150) default NULL,
  `forum_desc` text,
  `forum_status` tinyint(4) NOT NULL default '0',
  `forum_order` mediumint(8) unsigned NOT NULL default '1',
  `forum_posts` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `prune_next` int(11) default NULL,
  `prune_enable` tinyint(1) NOT NULL default '0',
  `auth_view` tinyint(2) NOT NULL default '0',
  `auth_read` tinyint(2) NOT NULL default '0',
  `auth_post` tinyint(2) NOT NULL default '0',
  `auth_reply` tinyint(2) NOT NULL default '0',
  `auth_edit` tinyint(2) NOT NULL default '0',
  `auth_delete` tinyint(2) NOT NULL default '0',
  `auth_sticky` tinyint(2) NOT NULL default '0',
  `auth_announce` tinyint(2) NOT NULL default '0',
  `auth_vote` tinyint(2) NOT NULL default '0',
  `auth_pollcreate` tinyint(2) NOT NULL default '0',
  `auth_attachments` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`forum_id`),
  KEY `forums_order` (`forum_order`),
  KEY `cat_id` (`cat_id`),
  KEY `forum_last_post_id` (`forum_last_post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_forum_prune`
-- 

CREATE TABLE `phpbb_forum_prune` (
  `prune_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `prune_days` smallint(5) unsigned NOT NULL default '0',
  `prune_freq` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`prune_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_groups`
-- 

CREATE TABLE `phpbb_groups` (
  `group_id` mediumint(8) NOT NULL auto_increment,
  `group_type` tinyint(4) NOT NULL default '1',
  `group_name` varchar(40) NOT NULL default '',
  `group_description` varchar(255) NOT NULL default '',
  `group_moderator` mediumint(8) NOT NULL default '0',
  `group_single_user` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`group_id`),
  KEY `group_single_user` (`group_single_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12905 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_posts`
-- 

CREATE TABLE `phpbb_posts` (
  `post_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) NOT NULL default '0',
  `post_time` int(11) NOT NULL default '0',
  `poster_ip` varchar(8) NOT NULL default '',
  `post_username` varchar(25) default NULL,
  `enable_bbcode` tinyint(1) NOT NULL default '1',
  `enable_html` tinyint(1) NOT NULL default '0',
  `enable_smilies` tinyint(1) NOT NULL default '1',
  `enable_sig` tinyint(1) NOT NULL default '1',
  `post_edit_time` int(11) default NULL,
  `post_edit_count` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `post_time` (`post_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=249897 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_posts_text`
-- 

CREATE TABLE `phpbb_posts_text` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `bbcode_uid` varchar(10) NOT NULL default '',
  `post_subject` varchar(120) default NULL,
  `post_text` text,
  PRIMARY KEY  (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_privmsgs`
-- 

CREATE TABLE `phpbb_privmsgs` (
  `privmsgs_id` mediumint(8) unsigned NOT NULL auto_increment,
  `privmsgs_type` tinyint(4) NOT NULL default '0',
  `privmsgs_subject` varchar(255) NOT NULL default '',
  `privmsgs_from_userid` mediumint(8) NOT NULL default '0',
  `privmsgs_to_userid` mediumint(8) NOT NULL default '0',
  `privmsgs_date` int(11) NOT NULL default '0',
  `privmsgs_ip` varchar(8) NOT NULL default '',
  `privmsgs_enable_bbcode` tinyint(1) NOT NULL default '1',
  `privmsgs_enable_html` tinyint(1) NOT NULL default '0',
  `privmsgs_enable_smilies` tinyint(1) NOT NULL default '1',
  `privmsgs_attach_sig` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`privmsgs_id`),
  KEY `privmsgs_from_userid` (`privmsgs_from_userid`),
  KEY `privmsgs_to_userid` (`privmsgs_to_userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=504376 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_privmsgs_text`
-- 

CREATE TABLE `phpbb_privmsgs_text` (
  `privmsgs_text_id` mediumint(8) unsigned NOT NULL default '0',
  `privmsgs_bbcode_uid` varchar(10) NOT NULL default '',
  `privmsgs_text` text,
  PRIMARY KEY  (`privmsgs_text_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_ranks`
-- 

CREATE TABLE `phpbb_ranks` (
  `rank_id` smallint(5) unsigned NOT NULL auto_increment,
  `rank_title` varchar(50) NOT NULL default '',
  `rank_min` mediumint(8) NOT NULL default '0',
  `rank_special` tinyint(1) default NULL,
  `rank_image` varchar(255) default NULL,
  PRIMARY KEY  (`rank_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_search_results`
-- 

CREATE TABLE `phpbb_search_results` (
  `search_id` int(11) unsigned NOT NULL default '0',
  `session_id` varchar(32) NOT NULL default '',
  `search_array` mediumtext NOT NULL,
  `search_time` int(11) NOT NULL default '0',
  PRIMARY KEY  (`search_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_search_wordlist`
-- 

CREATE TABLE `phpbb_search_wordlist` (
  `word_text` varchar(50) character set latin1 collate latin1_bin NOT NULL default '',
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word_common` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`word_text`),
  KEY `word_id` (`word_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3655960 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_search_wordmatch`
-- 

CREATE TABLE `phpbb_search_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `word_id` mediumint(8) unsigned NOT NULL default '0',
  `title_match` tinyint(1) NOT NULL default '0',
  KEY `post_id` (`post_id`),
  KEY `word_id` (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_sessions`
-- 

CREATE TABLE `phpbb_sessions` (
  `session_id` char(32) NOT NULL default '',
  `session_user_id` mediumint(8) NOT NULL default '0',
  `session_start` int(11) NOT NULL default '0',
  `session_time` int(11) NOT NULL default '0',
  `session_ip` char(8) NOT NULL default '',
  `session_page` int(11) NOT NULL default '0',
  `session_logged_in` tinyint(1) NOT NULL default '0',
  `session_admin` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_id_ip_user_id` (`session_id`,`session_ip`,`session_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_sessions_keys`
-- 

CREATE TABLE `phpbb_sessions_keys` (
  `key_id` varchar(32) NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `last_ip` varchar(8) NOT NULL default '0',
  `last_login` int(11) NOT NULL default '0',
  PRIMARY KEY  (`key_id`,`user_id`),
  KEY `last_login` (`last_login`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_smilies`
-- 

CREATE TABLE `phpbb_smilies` (
  `smilies_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` varchar(50) default NULL,
  `smile_url` varchar(100) default NULL,
  `emoticon` varchar(75) default NULL,
  PRIMARY KEY  (`smilies_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=102 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_themes`
-- 

CREATE TABLE `phpbb_themes` (
  `themes_id` mediumint(8) unsigned NOT NULL auto_increment,
  `template_name` varchar(30) NOT NULL default '',
  `style_name` varchar(30) NOT NULL default '',
  `head_stylesheet` varchar(100) default NULL,
  `body_background` varchar(100) default NULL,
  `body_bgcolor` varchar(6) default NULL,
  `body_text` varchar(6) default NULL,
  `body_link` varchar(6) default NULL,
  `body_vlink` varchar(6) default NULL,
  `body_alink` varchar(6) default NULL,
  `body_hlink` varchar(6) default NULL,
  `tr_color1` varchar(6) default NULL,
  `tr_color2` varchar(6) default NULL,
  `tr_color3` varchar(6) default NULL,
  `tr_class1` varchar(25) default NULL,
  `tr_class2` varchar(25) default NULL,
  `tr_class3` varchar(25) default NULL,
  `th_color1` varchar(6) default NULL,
  `th_color2` varchar(6) default NULL,
  `th_color3` varchar(6) default NULL,
  `th_class1` varchar(25) default NULL,
  `th_class2` varchar(25) default NULL,
  `th_class3` varchar(25) default NULL,
  `td_color1` varchar(6) default NULL,
  `td_color2` varchar(6) default NULL,
  `td_color3` varchar(6) default NULL,
  `td_class1` varchar(25) default NULL,
  `td_class2` varchar(25) default NULL,
  `td_class3` varchar(25) default NULL,
  `fontface1` varchar(50) default NULL,
  `fontface2` varchar(50) default NULL,
  `fontface3` varchar(50) default NULL,
  `fontsize1` tinyint(4) default NULL,
  `fontsize2` tinyint(4) default NULL,
  `fontsize3` tinyint(4) default NULL,
  `fontcolor1` varchar(6) default NULL,
  `fontcolor2` varchar(6) default NULL,
  `fontcolor3` varchar(6) default NULL,
  `span_class1` varchar(25) default NULL,
  `span_class2` varchar(25) default NULL,
  `span_class3` varchar(25) default NULL,
  `img_size_poll` smallint(5) unsigned default NULL,
  `img_size_privmsg` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`themes_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_themes_name`
-- 

CREATE TABLE `phpbb_themes_name` (
  `themes_id` smallint(5) unsigned NOT NULL default '0',
  `tr_color1_name` char(50) default NULL,
  `tr_color2_name` char(50) default NULL,
  `tr_color3_name` char(50) default NULL,
  `tr_class1_name` char(50) default NULL,
  `tr_class2_name` char(50) default NULL,
  `tr_class3_name` char(50) default NULL,
  `th_color1_name` char(50) default NULL,
  `th_color2_name` char(50) default NULL,
  `th_color3_name` char(50) default NULL,
  `th_class1_name` char(50) default NULL,
  `th_class2_name` char(50) default NULL,
  `th_class3_name` char(50) default NULL,
  `td_color1_name` char(50) default NULL,
  `td_color2_name` char(50) default NULL,
  `td_color3_name` char(50) default NULL,
  `td_class1_name` char(50) default NULL,
  `td_class2_name` char(50) default NULL,
  `td_class3_name` char(50) default NULL,
  `fontface1_name` char(50) default NULL,
  `fontface2_name` char(50) default NULL,
  `fontface3_name` char(50) default NULL,
  `fontsize1_name` char(50) default NULL,
  `fontsize2_name` char(50) default NULL,
  `fontsize3_name` char(50) default NULL,
  `fontcolor1_name` char(50) default NULL,
  `fontcolor2_name` char(50) default NULL,
  `fontcolor3_name` char(50) default NULL,
  `span_class1_name` char(50) default NULL,
  `span_class2_name` char(50) default NULL,
  `span_class3_name` char(50) default NULL,
  PRIMARY KEY  (`themes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_themes__orig`
-- 

CREATE TABLE `phpbb_themes__orig` (
  `themes_id` mediumint(8) unsigned NOT NULL auto_increment,
  `template_name` varchar(30) NOT NULL default '',
  `style_name` varchar(30) NOT NULL default '',
  `head_stylesheet` varchar(100) default NULL,
  `body_background` varchar(100) default NULL,
  `body_bgcolor` varchar(6) default NULL,
  `body_text` varchar(6) default NULL,
  `body_link` varchar(6) default NULL,
  `body_vlink` varchar(6) default NULL,
  `body_alink` varchar(6) default NULL,
  `body_hlink` varchar(6) default NULL,
  `tr_color1` varchar(6) default NULL,
  `tr_color2` varchar(6) default NULL,
  `tr_color3` varchar(6) default NULL,
  `tr_class1` varchar(25) default NULL,
  `tr_class2` varchar(25) default NULL,
  `tr_class3` varchar(25) default NULL,
  `th_color1` varchar(6) default NULL,
  `th_color2` varchar(6) default NULL,
  `th_color3` varchar(6) default NULL,
  `th_class1` varchar(25) default NULL,
  `th_class2` varchar(25) default NULL,
  `th_class3` varchar(25) default NULL,
  `td_color1` varchar(6) default NULL,
  `td_color2` varchar(6) default NULL,
  `td_color3` varchar(6) default NULL,
  `td_class1` varchar(25) default NULL,
  `td_class2` varchar(25) default NULL,
  `td_class3` varchar(25) default NULL,
  `fontface1` varchar(50) default NULL,
  `fontface2` varchar(50) default NULL,
  `fontface3` varchar(50) default NULL,
  `fontsize1` tinyint(4) default NULL,
  `fontsize2` tinyint(4) default NULL,
  `fontsize3` tinyint(4) default NULL,
  `fontcolor1` varchar(6) default NULL,
  `fontcolor2` varchar(6) default NULL,
  `fontcolor3` varchar(6) default NULL,
  `span_class1` varchar(25) default NULL,
  `span_class2` varchar(25) default NULL,
  `span_class3` varchar(25) default NULL,
  `img_size_poll` smallint(5) unsigned default NULL,
  `img_size_privmsg` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`themes_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_topics`
-- 

CREATE TABLE `phpbb_topics` (
  `topic_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` smallint(8) unsigned NOT NULL default '0',
  `topic_title` char(100) NOT NULL default '',
  `topic_poster` mediumint(8) NOT NULL default '0',
  `topic_time` int(11) NOT NULL default '0',
  `topic_views` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies` mediumint(8) unsigned NOT NULL default '0',
  `topic_status` tinyint(3) NOT NULL default '0',
  `topic_vote` tinyint(1) NOT NULL default '0',
  `topic_type` tinyint(3) NOT NULL default '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_moved_id` (`topic_moved_id`),
  KEY `topic_status` (`topic_status`),
  KEY `topic_type` (`topic_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3168 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_topics_watch`
-- 

CREATE TABLE `phpbb_topics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `notify_status` tinyint(1) NOT NULL default '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_status` (`notify_status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_users`
-- 

CREATE TABLE `phpbb_users` (
  `user_id` mediumint(8) NOT NULL default '0',
  `user_active` tinyint(1) default '1',
  `username` varchar(25) NOT NULL default '',
  `user_password` varchar(32) NOT NULL default '',
  `user_session_time` int(11) NOT NULL default '0',
  `user_session_page` smallint(5) NOT NULL default '0',
  `user_lastvisit` int(11) NOT NULL default '0',
  `user_regdate` int(11) NOT NULL default '0',
  `user_level` tinyint(4) default NULL,
  `user_posts` mediumint(8) unsigned NOT NULL default '0',
  `user_timezone` decimal(5,2) NOT NULL default '0.00',
  `user_style` tinyint(4) default NULL,
  `user_lang` varchar(255) default NULL,
  `user_dateformat` varchar(14) NOT NULL default 'd M Y H:i',
  `user_new_privmsg` smallint(5) unsigned NOT NULL default '0',
  `user_unread_privmsg` smallint(5) unsigned NOT NULL default '0',
  `user_last_privmsg` int(11) NOT NULL default '0',
  `user_emailtime` int(11) default NULL,
  `user_viewemail` tinyint(1) default NULL,
  `user_attachsig` tinyint(1) default NULL,
  `user_allowhtml` tinyint(1) default '1',
  `user_allowbbcode` tinyint(1) default '1',
  `user_allowsmile` tinyint(1) default '1',
  `user_allowavatar` tinyint(1) NOT NULL default '1',
  `user_allow_pm` tinyint(1) NOT NULL default '1',
  `user_allow_viewonline` tinyint(1) NOT NULL default '1',
  `user_notify` tinyint(1) NOT NULL default '1',
  `user_notify_pm` tinyint(1) NOT NULL default '0',
  `user_popup_pm` tinyint(1) NOT NULL default '0',
  `user_rank` int(11) default NULL,
  `user_avatar` varchar(100) default NULL,
  `user_avatar_type` tinyint(4) NOT NULL default '0',
  `user_email` varchar(255) default NULL,
  `user_icq` varchar(15) default NULL,
  `user_website` varchar(100) default NULL,
  `user_from` varchar(100) default NULL,
  `user_sig` text,
  `user_sig_bbcode_uid` varchar(10) default NULL,
  `user_aim` varchar(255) default NULL,
  `user_yim` varchar(255) default NULL,
  `user_msnm` varchar(255) default NULL,
  `user_occ` varchar(100) default NULL,
  `user_interests` varchar(255) default NULL,
  `user_actkey` varchar(32) default NULL,
  `user_newpasswd` varchar(32) default NULL,
  `jelent` mediumint(4) default '2',
  `eljott` mediumint(4) default '1',
  `szervezett` mediumint(4) default '0',
  `bunti` mediumint(4) default '0',
  `user_login_tries` smallint(5) unsigned NOT NULL default '0',
  `user_last_login_try` int(11) NOT NULL default '0',
  `user_allowdefaultavatar` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`user_id`),
  KEY `user_session_time` (`user_session_time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_user_group`
-- 

CREATE TABLE `phpbb_user_group` (
  `group_id` mediumint(8) NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `user_pending` tinyint(1) default NULL,
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_vote_desc`
-- 

CREATE TABLE `phpbb_vote_desc` (
  `vote_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_text` text NOT NULL,
  `vote_start` int(11) NOT NULL default '0',
  `vote_length` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vote_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=286 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_vote_results`
-- 

CREATE TABLE `phpbb_vote_results` (
  `vote_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_option_id` tinyint(4) unsigned NOT NULL default '0',
  `vote_option_text` varchar(255) NOT NULL default '',
  `vote_result` int(11) NOT NULL default '0',
  KEY `vote_option_id` (`vote_option_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_vote_voters`
-- 

CREATE TABLE `phpbb_vote_voters` (
  `vote_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_user_id` mediumint(8) NOT NULL default '0',
  `vote_user_ip` char(8) NOT NULL default '',
  KEY `vote_id` (`vote_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `phpbb_words`
-- 

CREATE TABLE `phpbb_words` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word` char(100) NOT NULL default '',
  `replacement` char(100) NOT NULL default '',
  PRIMARY KEY  (`word_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `sites`
-- 

CREATE TABLE `sites` (
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

-- 
-- Tábla szerkezet: `szervez_old`
-- 

CREATE TABLE `szervez_old` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `GameDate` date NOT NULL default '0000-00-00',
  `PlayerNr` mediumint(4) unsigned NOT NULL default '0',
  `Fee` mediumint(6) unsigned NOT NULL default '0',
  `BattleField` varchar(50) NOT NULL default '',
  `Roster` char(1) NOT NULL default 'N',
  `Side1` varchar(50) NOT NULL default '',
  `Side2` varchar(50) NOT NULL default '',
  `Side3` varchar(50) default NULL,
  `Side4` varchar(50) default NULL,
  `Closed` char(1) NOT NULL default 'N',
  `lside1` tinyint(1) default '0',
  `lside2` tinyint(1) default '0',
  `lside3` tinyint(1) default '0',
  `lside4` tinyint(1) default '0',
  PRIMARY KEY  (`topic_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_acl_groups`
-- 

CREATE TABLE `test_acl_groups` (
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  KEY `group_id` (`group_id`),
  KEY `auth_opt_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_acl_options`
-- 

CREATE TABLE `test_acl_options` (
  `auth_option_id` mediumint(8) unsigned NOT NULL auto_increment,
  `auth_option` varchar(50) collate utf8_bin NOT NULL default '',
  `is_global` tinyint(1) unsigned NOT NULL default '0',
  `is_local` tinyint(1) unsigned NOT NULL default '0',
  `founder_only` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`auth_option_id`),
  UNIQUE KEY `auth_option` (`auth_option`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=118 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_acl_roles`
-- 

CREATE TABLE `test_acl_roles` (
  `role_id` mediumint(8) unsigned NOT NULL auto_increment,
  `role_name` varchar(255) collate utf8_bin NOT NULL default '',
  `role_description` text collate utf8_bin NOT NULL,
  `role_type` varchar(10) collate utf8_bin NOT NULL default '',
  `role_order` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`role_id`),
  KEY `role_type` (`role_type`),
  KEY `role_order` (`role_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_acl_roles_data`
-- 

CREATE TABLE `test_acl_roles_data` (
  `role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`role_id`,`auth_option_id`),
  KEY `ath_op_id` (`auth_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_acl_users`
-- 

CREATE TABLE `test_acl_users` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  KEY `user_id` (`user_id`),
  KEY `auth_option_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_attachments`
-- 

CREATE TABLE `test_attachments` (
  `attach_id` mediumint(8) unsigned NOT NULL auto_increment,
  `post_msg_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `in_message` tinyint(1) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) unsigned NOT NULL default '0',
  `is_orphan` tinyint(1) unsigned NOT NULL default '1',
  `physical_filename` varchar(255) collate utf8_bin NOT NULL default '',
  `real_filename` varchar(255) collate utf8_bin NOT NULL default '',
  `download_count` mediumint(8) unsigned NOT NULL default '0',
  `attach_comment` text collate utf8_bin NOT NULL,
  `extension` varchar(100) collate utf8_bin NOT NULL default '',
  `mimetype` varchar(100) collate utf8_bin NOT NULL default '',
  `filesize` int(20) unsigned NOT NULL default '0',
  `filetime` int(11) unsigned NOT NULL default '0',
  `thumbnail` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`attach_id`),
  KEY `filetime` (`filetime`),
  KEY `post_msg_id` (`post_msg_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `is_orphan` (`is_orphan`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_banlist`
-- 

CREATE TABLE `test_banlist` (
  `ban_id` mediumint(8) unsigned NOT NULL auto_increment,
  `ban_userid` mediumint(8) unsigned NOT NULL default '0',
  `ban_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `ban_email` varchar(100) collate utf8_bin NOT NULL default '',
  `ban_start` int(11) unsigned NOT NULL default '0',
  `ban_end` int(11) unsigned NOT NULL default '0',
  `ban_exclude` tinyint(1) unsigned NOT NULL default '0',
  `ban_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `ban_give_reason` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`ban_id`),
  KEY `ban_end` (`ban_end`),
  KEY `ban_user` (`ban_userid`,`ban_exclude`),
  KEY `ban_email` (`ban_email`,`ban_exclude`),
  KEY `ban_ip` (`ban_ip`,`ban_exclude`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=299 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_bbcodes`
-- 

CREATE TABLE `test_bbcodes` (
  `bbcode_id` tinyint(3) NOT NULL default '0',
  `bbcode_tag` varchar(16) collate utf8_bin NOT NULL default '',
  `bbcode_helpline` varchar(255) collate utf8_bin NOT NULL default '',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_match` text collate utf8_bin NOT NULL,
  `bbcode_tpl` mediumtext collate utf8_bin NOT NULL,
  `first_pass_match` mediumtext collate utf8_bin NOT NULL,
  `first_pass_replace` mediumtext collate utf8_bin NOT NULL,
  `second_pass_match` mediumtext collate utf8_bin NOT NULL,
  `second_pass_replace` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`bbcode_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_bookmarks`
-- 

CREATE TABLE `test_bookmarks` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`topic_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_bots`
-- 

CREATE TABLE `test_bots` (
  `bot_id` mediumint(8) unsigned NOT NULL auto_increment,
  `bot_active` tinyint(1) unsigned NOT NULL default '1',
  `bot_name` varchar(255) collate utf8_bin NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `bot_agent` varchar(255) collate utf8_bin NOT NULL default '',
  `bot_ip` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`bot_id`),
  KEY `bot_active` (`bot_active`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_cdt`
-- 

CREATE TABLE `test_cdt` (
  `cdate` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`cdate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_config`
-- 

CREATE TABLE `test_config` (
  `config_name` varchar(255) collate utf8_bin NOT NULL default '',
  `config_value` varchar(255) collate utf8_bin NOT NULL default '',
  `is_dynamic` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`config_name`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_confirm`
-- 

CREATE TABLE `test_confirm` (
  `confirm_id` char(32) collate utf8_bin NOT NULL default '',
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  `confirm_type` tinyint(3) NOT NULL default '0',
  `code` varchar(8) collate utf8_bin NOT NULL default '',
  `seed` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`,`confirm_id`),
  KEY `confirm_type` (`confirm_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_disallow`
-- 

CREATE TABLE `test_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL auto_increment,
  `disallow_username` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`disallow_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=38 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_dpd`
-- 

CREATE TABLE `test_dpd` (
  `did` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) NOT NULL default '0',
  `deleter_id` mediumint(8) NOT NULL default '0',
  PRIMARY KEY  (`did`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13760 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_drafts`
-- 

CREATE TABLE `test_drafts` (
  `draft_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `save_time` int(11) unsigned NOT NULL default '0',
  `draft_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `draft_message` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`draft_id`),
  KEY `save_time` (`save_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1180 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_extensions`
-- 

CREATE TABLE `test_extensions` (
  `extension_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `extension` varchar(100) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=67 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_extension_groups`
-- 

CREATE TABLE `test_extension_groups` (
  `group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `cat_id` tinyint(2) NOT NULL default '0',
  `allow_group` tinyint(1) unsigned NOT NULL default '0',
  `download_mode` tinyint(1) unsigned NOT NULL default '1',
  `upload_icon` varchar(255) collate utf8_bin NOT NULL default '',
  `max_filesize` int(20) unsigned NOT NULL default '0',
  `allowed_forums` text collate utf8_bin NOT NULL,
  `allow_in_pm` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_feherlista`
-- 

CREATE TABLE `test_feherlista` (
  `list_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `sender_id` mediumint(8) unsigned NOT NULL default '0',
  `add_date` date default NULL,
  `remark` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`list_id`),
  KEY `sender_id` (`sender_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=58 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_feketelista`
-- 

CREATE TABLE `test_feketelista` (
  `list_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `sender_id` mediumint(8) unsigned NOT NULL default '0',
  `add_date` date default NULL,
  `remark` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`list_id`),
  KEY `sender_id` (`sender_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=149 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_forums`
-- 

CREATE TABLE `test_forums` (
  `forum_id` mediumint(8) unsigned NOT NULL auto_increment,
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `left_id` mediumint(8) unsigned NOT NULL default '0',
  `right_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_parents` mediumtext collate utf8_bin NOT NULL,
  `forum_name` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_desc` text collate utf8_bin NOT NULL,
  `forum_desc_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_desc_options` int(11) unsigned NOT NULL default '7',
  `forum_desc_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `forum_link` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_password` varchar(40) collate utf8_bin NOT NULL default '',
  `forum_style` mediumint(8) unsigned NOT NULL default '0',
  `forum_image` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules` text collate utf8_bin NOT NULL,
  `forum_rules_link` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules_options` int(11) unsigned NOT NULL default '7',
  `forum_rules_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `forum_topics_per_page` tinyint(4) NOT NULL default '0',
  `forum_type` tinyint(4) NOT NULL default '0',
  `forum_status` tinyint(4) NOT NULL default '0',
  `forum_posts` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics_real` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_poster_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_last_post_time` int(11) unsigned NOT NULL default '0',
  `forum_last_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_last_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `forum_flags` tinyint(4) NOT NULL default '32',
  `display_subforum_list` tinyint(1) unsigned NOT NULL default '1',
  `display_on_index` tinyint(1) unsigned NOT NULL default '1',
  `enable_indexing` tinyint(1) unsigned NOT NULL default '1',
  `enable_icons` tinyint(1) unsigned NOT NULL default '1',
  `enable_prune` tinyint(1) unsigned NOT NULL default '0',
  `prune_next` int(11) unsigned NOT NULL default '0',
  `prune_days` mediumint(8) unsigned NOT NULL default '0',
  `prune_viewed` mediumint(8) unsigned NOT NULL default '0',
  `prune_freq` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`forum_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `forum_lastpost_id` (`forum_last_post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=286 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_forums_access`
-- 

CREATE TABLE `test_forums_access` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`forum_id`,`user_id`,`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_forums_track`
-- 

CREATE TABLE `test_forums_track` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `mark_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_forums_watch`
-- 

CREATE TABLE `test_forums_watch` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `notify_status` tinyint(1) unsigned NOT NULL default '0',
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_groups`
-- 

CREATE TABLE `test_groups` (
  `group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_type` tinyint(4) NOT NULL default '1',
  `group_founder_manage` tinyint(1) unsigned NOT NULL default '0',
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `group_desc` text collate utf8_bin NOT NULL,
  `group_desc_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `group_desc_options` int(11) unsigned NOT NULL default '7',
  `group_desc_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `group_display` tinyint(1) unsigned NOT NULL default '0',
  `group_avatar` varchar(255) collate utf8_bin NOT NULL default '',
  `group_avatar_type` tinyint(2) NOT NULL default '0',
  `group_avatar_width` smallint(4) unsigned NOT NULL default '0',
  `group_avatar_height` smallint(4) unsigned NOT NULL default '0',
  `group_rank` mediumint(8) unsigned NOT NULL default '0',
  `group_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `group_sig_chars` mediumint(8) unsigned NOT NULL default '0',
  `group_receive_pm` tinyint(1) unsigned NOT NULL default '0',
  `group_message_limit` mediumint(8) unsigned NOT NULL default '0',
  `group_max_recipients` mediumint(8) unsigned NOT NULL default '0',
  `group_legend` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`group_id`),
  KEY `group_legend_name` (`group_legend`,`group_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12716 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_hasznos`
-- 

CREATE TABLE `test_hasznos` (
  `post_id` mediumint(8) unsigned NOT NULL auto_increment,
  `ertek` mediumint(8) NOT NULL default '0',
  PRIMARY KEY  (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=400295 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_Hasznos_szav`
-- 

CREATE TABLE `test_Hasznos_szav` (
  `haszsz_id` mediumint(10) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `post_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`haszsz_id`),
  UNIQUE KEY `hssz_user_id` (`user_id`,`post_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=191 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_icons`
-- 

CREATE TABLE `test_icons` (
  `icons_id` mediumint(8) unsigned NOT NULL auto_increment,
  `icons_url` varchar(255) collate utf8_bin NOT NULL default '',
  `icons_width` tinyint(4) NOT NULL default '0',
  `icons_height` tinyint(4) NOT NULL default '0',
  `icons_order` mediumint(8) unsigned NOT NULL default '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`icons_id`),
  KEY `display_on_posting` (`display_on_posting`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_jelentk`
-- 

CREATE TABLE `test_jelentk` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=43983 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_jelentk_old`
-- 

CREATE TABLE `test_jelentk_old` (
  `signup_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `weap` varchar(30) character set utf8 collate utf8_bin NOT NULL,
  `fps` mediumint(3) unsigned default '0',
  `side` tinyint(1) unsigned default '0',
  `transport` tinyint(1) unsigned default '0',
  `tfrom` varchar(50) character set utf8 collate utf8_bin NOT NULL,
  `tcap` tinyint(2) unsigned default '0',
  `team` varchar(30) character set utf8 collate utf8_bin NOT NULL,
  `status` tinyint(1) unsigned default '0',
  `jdate` date default NULL,
  `platoon` varchar(30) character set utf8 collate utf8_bin default NULL,
  `sort` tinyint(1) default NULL,
  `paid` char(1) character set utf8 collate utf8_bin default NULL,
  PRIMARY KEY  (`signup_id`),
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25520 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_lang`
-- 

CREATE TABLE `test_lang` (
  `lang_id` tinyint(4) NOT NULL auto_increment,
  `lang_iso` varchar(30) collate utf8_bin NOT NULL default '',
  `lang_dir` varchar(30) collate utf8_bin NOT NULL default '',
  `lang_english_name` varchar(100) collate utf8_bin NOT NULL default '',
  `lang_local_name` varchar(255) collate utf8_bin NOT NULL default '',
  `lang_author` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`lang_id`),
  KEY `lang_iso` (`lang_iso`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_log`
-- 

CREATE TABLE `test_log` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `log_type` tinyint(4) NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `reportee_id` mediumint(8) unsigned NOT NULL default '0',
  `log_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `log_time` int(11) unsigned NOT NULL default '0',
  `log_operation` text collate utf8_bin NOT NULL,
  `log_data` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `reportee_id` (`reportee_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=109878 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_moderator_cache`
-- 

CREATE TABLE `test_moderator_cache` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `username` varchar(255) collate utf8_bin NOT NULL default '',
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `display_on_index` tinyint(1) unsigned NOT NULL default '1',
  KEY `disp_idx` (`display_on_index`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_modules`
-- 

CREATE TABLE `test_modules` (
  `module_id` mediumint(8) unsigned NOT NULL auto_increment,
  `module_enabled` tinyint(1) unsigned NOT NULL default '1',
  `module_display` tinyint(1) unsigned NOT NULL default '1',
  `module_basename` varchar(255) collate utf8_bin NOT NULL default '',
  `module_class` varchar(10) collate utf8_bin NOT NULL default '',
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `left_id` mediumint(8) unsigned NOT NULL default '0',
  `right_id` mediumint(8) unsigned NOT NULL default '0',
  `module_langname` varchar(255) collate utf8_bin NOT NULL default '',
  `module_mode` varchar(255) collate utf8_bin NOT NULL default '',
  `module_auth` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`module_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `module_enabled` (`module_enabled`),
  KEY `class_left_id` (`module_class`,`left_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=190 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_Nem_hasznos_szav`
-- 

CREATE TABLE `test_Nem_hasznos_szav` (
  `haszsz_id` mediumint(10) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `post_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`haszsz_id`),
  UNIQUE KEY `hssz_user_id` (`user_id`,`post_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=93 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_poll_options`
-- 

CREATE TABLE `test_poll_options` (
  `poll_option_id` tinyint(4) NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `poll_option_text` text collate utf8_bin NOT NULL,
  `poll_option_total` mediumint(8) unsigned NOT NULL default '0',
  KEY `poll_opt_id` (`poll_option_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_poll_votes`
-- 

CREATE TABLE `test_poll_votes` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `poll_option_id` tinyint(4) NOT NULL default '0',
  `vote_user_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_user_ip` varchar(40) collate utf8_bin NOT NULL default '',
  KEY `topic_id` (`topic_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_posts`
-- 

CREATE TABLE `test_posts` (
  `post_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `poster_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `post_time` int(11) unsigned NOT NULL default '0',
  `post_approved` tinyint(1) unsigned NOT NULL default '1',
  `post_reported` tinyint(1) unsigned NOT NULL default '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL default '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL default '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL default '1',
  `enable_sig` tinyint(1) unsigned NOT NULL default '1',
  `post_username` varchar(255) collate utf8_bin NOT NULL default '',
  `post_subject` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `post_text` mediumtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `post_checksum` varchar(32) collate utf8_bin NOT NULL default '',
  `post_attachment` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `post_postcount` tinyint(1) unsigned NOT NULL default '1',
  `post_edit_time` int(11) unsigned NOT NULL default '0',
  `post_edit_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `post_edit_user` mediumint(8) unsigned NOT NULL default '0',
  `post_edit_count` smallint(4) unsigned NOT NULL default '0',
  `post_edit_locked` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_ip` (`poster_ip`),
  KEY `poster_id` (`poster_id`),
  KEY `post_approved` (`post_approved`),
  KEY `tid_post_time` (`topic_id`,`post_time`),
  FULLTEXT KEY `post_subject` (`post_subject`),
  FULLTEXT KEY `post_text` (`post_text`),
  FULLTEXT KEY `post_content` (`post_subject`,`post_text`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=538764 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_privmsgs`
-- 

CREATE TABLE `test_privmsgs` (
  `msg_id` mediumint(8) unsigned NOT NULL auto_increment,
  `root_level` mediumint(8) unsigned NOT NULL default '0',
  `author_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `author_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `message_time` int(11) unsigned NOT NULL default '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL default '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL default '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL default '1',
  `enable_sig` tinyint(1) unsigned NOT NULL default '1',
  `message_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `message_text` mediumtext collate utf8_bin NOT NULL,
  `message_edit_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `message_edit_user` mediumint(8) unsigned NOT NULL default '0',
  `message_attachment` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `message_edit_time` int(11) unsigned NOT NULL default '0',
  `message_edit_count` smallint(4) unsigned NOT NULL default '0',
  `to_address` text collate utf8_bin NOT NULL,
  `bcc_address` text collate utf8_bin NOT NULL,
  PRIMARY KEY  (`msg_id`),
  KEY `author_ip` (`author_ip`),
  KEY `message_time` (`message_time`),
  KEY `author_id` (`author_id`),
  KEY `root_level` (`root_level`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1260178 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_privmsgs_folder`
-- 

CREATE TABLE `test_privmsgs_folder` (
  `folder_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `folder_name` varchar(255) collate utf8_bin NOT NULL default '',
  `pm_count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`folder_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4635 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_privmsgs_rules`
-- 

CREATE TABLE `test_privmsgs_rules` (
  `rule_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_check` mediumint(8) unsigned NOT NULL default '0',
  `rule_connection` mediumint(8) unsigned NOT NULL default '0',
  `rule_string` varchar(255) collate utf8_bin NOT NULL default '',
  `rule_user_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_group_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_action` mediumint(8) unsigned NOT NULL default '0',
  `rule_folder_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`rule_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_privmsgs_to`
-- 

CREATE TABLE `test_privmsgs_to` (
  `msg_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `author_id` mediumint(8) unsigned NOT NULL default '0',
  `pm_deleted` tinyint(1) unsigned NOT NULL default '0',
  `pm_new` tinyint(1) unsigned NOT NULL default '1',
  `pm_unread` tinyint(1) unsigned NOT NULL default '1',
  `pm_replied` tinyint(1) unsigned NOT NULL default '0',
  `pm_marked` tinyint(1) unsigned NOT NULL default '0',
  `pm_forwarded` tinyint(1) unsigned NOT NULL default '0',
  `folder_id` int(11) NOT NULL default '0',
  KEY `msg_id` (`msg_id`),
  KEY `author_id` (`author_id`),
  KEY `usr_flder_id` (`user_id`,`folder_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_profile_fields`
-- 

CREATE TABLE `test_profile_fields` (
  `field_id` mediumint(8) unsigned NOT NULL auto_increment,
  `field_name` varchar(255) collate utf8_bin NOT NULL default '',
  `field_type` tinyint(4) NOT NULL default '0',
  `field_ident` varchar(20) collate utf8_bin NOT NULL default '',
  `field_length` varchar(20) collate utf8_bin NOT NULL default '',
  `field_minlen` varchar(255) collate utf8_bin NOT NULL default '',
  `field_maxlen` varchar(255) collate utf8_bin NOT NULL default '',
  `field_novalue` varchar(255) collate utf8_bin NOT NULL default '',
  `field_default_value` varchar(255) collate utf8_bin NOT NULL default '',
  `field_validation` varchar(20) collate utf8_bin NOT NULL default '',
  `field_required` tinyint(1) unsigned NOT NULL default '0',
  `field_show_on_reg` tinyint(1) unsigned NOT NULL default '0',
  `field_show_profile` tinyint(1) unsigned NOT NULL default '0',
  `field_hide` tinyint(1) unsigned NOT NULL default '0',
  `field_no_view` tinyint(1) unsigned NOT NULL default '0',
  `field_active` tinyint(1) unsigned NOT NULL default '0',
  `field_order` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`field_id`),
  KEY `fld_type` (`field_type`),
  KEY `fld_ordr` (`field_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_profile_fields_data`
-- 

CREATE TABLE `test_profile_fields_data` (
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

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_profile_fields_lang`
-- 

CREATE TABLE `test_profile_fields_lang` (
  `field_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_id` mediumint(8) unsigned NOT NULL default '0',
  `option_id` mediumint(8) unsigned NOT NULL default '0',
  `field_type` tinyint(4) NOT NULL default '0',
  `lang_value` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`field_id`,`lang_id`,`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_profile_lang`
-- 

CREATE TABLE `test_profile_lang` (
  `field_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_name` varchar(255) collate utf8_bin NOT NULL default '',
  `lang_explain` text collate utf8_bin NOT NULL,
  `lang_default_value` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`field_id`,`lang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_ranks`
-- 

CREATE TABLE `test_ranks` (
  `rank_id` mediumint(8) unsigned NOT NULL auto_increment,
  `rank_title` varchar(255) collate utf8_bin NOT NULL default '',
  `rank_min` mediumint(8) unsigned NOT NULL default '0',
  `rank_special` tinyint(1) unsigned NOT NULL default '0',
  `rank_image` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`rank_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_reports`
-- 

CREATE TABLE `test_reports` (
  `report_id` mediumint(8) unsigned NOT NULL auto_increment,
  `reason_id` smallint(4) unsigned NOT NULL default '0',
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `user_notify` tinyint(1) unsigned NOT NULL default '0',
  `report_closed` tinyint(1) unsigned NOT NULL default '0',
  `report_time` int(11) unsigned NOT NULL default '0',
  `report_text` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`report_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=495 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_reports_reasons`
-- 

CREATE TABLE `test_reports_reasons` (
  `reason_id` smallint(4) unsigned NOT NULL auto_increment,
  `reason_title` varchar(255) collate utf8_bin NOT NULL default '',
  `reason_description` mediumtext collate utf8_bin NOT NULL,
  `reason_order` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`reason_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_search_results`
-- 

CREATE TABLE `test_search_results` (
  `search_key` varchar(32) collate utf8_bin NOT NULL default '',
  `search_time` int(11) unsigned NOT NULL default '0',
  `search_keywords` mediumtext collate utf8_bin NOT NULL,
  `search_authors` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`search_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_search_wordlist`
-- 

CREATE TABLE `test_search_wordlist` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word_text` varchar(255) collate utf8_bin NOT NULL default '',
  `word_common` tinyint(1) unsigned NOT NULL default '0',
  `word_count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`word_id`),
  UNIQUE KEY `wrd_txt` (`word_text`),
  KEY `wrd_cnt` (`word_count`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=854105 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_search_wordmatch`
-- 

CREATE TABLE `test_search_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `word_id` mediumint(8) unsigned NOT NULL default '0',
  `title_match` tinyint(1) unsigned NOT NULL default '0',
  UNIQUE KEY `unq_mtch` (`word_id`,`post_id`,`title_match`),
  KEY `word_id` (`word_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_sec_users`
-- 

CREATE TABLE `test_sec_users` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `user_type` tinyint(2) NOT NULL default '0',
  `group_id` mediumint(8) unsigned NOT NULL default '3',
  `user_permissions` mediumtext character set utf8 collate utf8_bin NOT NULL,
  `user_perm_from` mediumint(8) unsigned NOT NULL default '0',
  `user_ip` varchar(40) character set utf8 collate utf8_bin NOT NULL default '',
  `user_regdate` int(11) unsigned NOT NULL default '0',
  `username` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `username_clean` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_password` varchar(40) character set utf8 collate utf8_bin NOT NULL default '',
  `user_passchg` int(11) unsigned NOT NULL default '0',
  `user_pass_convert` tinyint(1) unsigned NOT NULL default '0',
  `user_email` varchar(100) character set utf8 collate utf8_bin NOT NULL default '',
  `user_email_hash` bigint(20) NOT NULL default '0',
  `user_birthday` varchar(10) character set utf8 collate utf8_bin NOT NULL default '',
  `user_lastvisit` int(11) unsigned NOT NULL default '0',
  `user_lastmark` int(11) unsigned NOT NULL default '0',
  `user_lastpost_time` int(11) unsigned NOT NULL default '0',
  `user_lastpage` varchar(200) character set utf8 collate utf8_bin NOT NULL default '',
  `user_last_confirm_key` varchar(10) character set utf8 collate utf8_bin NOT NULL default '',
  `user_last_search` int(11) unsigned NOT NULL default '0',
  `user_warnings` tinyint(4) NOT NULL default '0',
  `user_last_warning` int(11) unsigned NOT NULL default '0',
  `user_login_attempts` tinyint(4) NOT NULL default '0',
  `user_inactive_reason` tinyint(2) NOT NULL default '0',
  `user_inactive_time` int(11) unsigned NOT NULL default '0',
  `user_posts` mediumint(8) unsigned NOT NULL default '0',
  `user_lang` varchar(30) character set utf8 collate utf8_bin NOT NULL default '',
  `user_timezone` decimal(5,2) NOT NULL default '0.00',
  `user_dst` tinyint(1) unsigned NOT NULL default '0',
  `user_dateformat` varchar(30) character set utf8 collate utf8_bin NOT NULL default 'd M Y H:i',
  `user_style` mediumint(8) unsigned NOT NULL default '0',
  `user_rank` mediumint(8) unsigned NOT NULL default '0',
  `user_colour` varchar(6) character set utf8 collate utf8_bin NOT NULL default '',
  `user_new_privmsg` int(4) NOT NULL default '0',
  `user_unread_privmsg` int(4) NOT NULL default '0',
  `user_last_privmsg` int(11) unsigned NOT NULL default '0',
  `user_message_rules` tinyint(1) unsigned NOT NULL default '0',
  `user_full_folder` int(11) NOT NULL default '-3',
  `user_emailtime` int(11) unsigned NOT NULL default '0',
  `user_topic_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_topic_sortby_type` varchar(1) character set utf8 collate utf8_bin NOT NULL default 't',
  `user_topic_sortby_dir` varchar(1) character set utf8 collate utf8_bin NOT NULL default 'd',
  `user_post_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_post_sortby_type` varchar(1) character set utf8 collate utf8_bin NOT NULL default 't',
  `user_post_sortby_dir` varchar(1) character set utf8 collate utf8_bin NOT NULL default 'd',
  `user_notify` tinyint(1) unsigned NOT NULL default '0',
  `user_notify_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_notify_type` tinyint(4) NOT NULL default '0',
  `user_allow_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewonline` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewemail` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_massemail` tinyint(1) unsigned NOT NULL default '1',
  `user_options` int(11) unsigned NOT NULL default '895',
  `user_avatar` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_avatar_type` tinyint(2) NOT NULL default '0',
  `user_avatar_width` smallint(4) unsigned NOT NULL default '0',
  `user_avatar_height` smallint(4) unsigned NOT NULL default '0',
  `user_sig` mediumtext character set utf8 collate utf8_bin NOT NULL,
  `user_sig_bbcode_uid` varchar(8) character set utf8 collate utf8_bin NOT NULL default '',
  `user_sig_bbcode_bitfield` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_from` varchar(100) character set utf8 collate utf8_bin NOT NULL default '',
  `user_icq` varchar(15) character set utf8 collate utf8_bin NOT NULL default '',
  `user_aim` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_yim` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_msnm` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_jabber` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `user_website` varchar(200) character set utf8 collate utf8_bin NOT NULL default '',
  `user_occ` text character set utf8 collate utf8_bin NOT NULL,
  `user_interests` text character set utf8 collate utf8_bin NOT NULL,
  `user_actkey` varchar(32) character set utf8 collate utf8_bin NOT NULL default '',
  `user_newpasswd` varchar(40) character set utf8 collate utf8_bin NOT NULL default '',
  `user_form_salt` varchar(32) character set utf8 collate utf8_bin NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_sessions`
-- 

CREATE TABLE `test_sessions` (
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  `session_user_id` mediumint(8) unsigned NOT NULL default '0',
  `session_forum_id` mediumint(8) unsigned NOT NULL default '0',
  `session_last_visit` int(11) unsigned NOT NULL default '0',
  `session_start` int(11) unsigned NOT NULL default '0',
  `session_time` int(11) unsigned NOT NULL default '0',
  `session_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `session_browser` varchar(150) collate utf8_bin NOT NULL default '',
  `session_forwarded_for` varchar(255) collate utf8_bin NOT NULL default '',
  `session_page` varchar(255) collate utf8_bin NOT NULL default '',
  `session_viewonline` tinyint(1) unsigned NOT NULL default '1',
  `session_autologin` tinyint(1) unsigned NOT NULL default '0',
  `session_admin` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `session_time` (`session_time`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_fid` (`session_forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_sessions_keys`
-- 

CREATE TABLE `test_sessions_keys` (
  `key_id` char(32) collate utf8_bin NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `last_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `last_login` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`key_id`,`user_id`),
  KEY `last_login` (`last_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_Sides`
-- 

CREATE TABLE `test_Sides` (
  `side_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `side_name` varchar(50) character set utf8 collate utf8_bin NOT NULL,
  `side_open` char(1) character set utf8 collate utf8_bin NOT NULL default 'Y',
  `side_player` mediumint(5) NOT NULL default '0',
  PRIMARY KEY  (`side_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3335 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_sitelist`
-- 

CREATE TABLE `test_sitelist` (
  `site_id` mediumint(8) unsigned NOT NULL auto_increment,
  `site_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `site_hostname` varchar(255) collate utf8_bin NOT NULL default '',
  `ip_exclude` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_sites`
-- 

CREATE TABLE `test_sites` (
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

-- 
-- Tábla szerkezet: `test_smilies`
-- 

CREATE TABLE `test_smilies` (
  `smiley_id` mediumint(8) unsigned NOT NULL auto_increment,
  `code` varchar(50) collate utf8_bin NOT NULL default '',
  `emotion` varchar(50) collate utf8_bin NOT NULL default '',
  `smiley_url` varchar(50) collate utf8_bin NOT NULL default '',
  `smiley_width` smallint(4) unsigned NOT NULL default '0',
  `smiley_height` smallint(4) unsigned NOT NULL default '0',
  `smiley_order` mediumint(8) unsigned NOT NULL default '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`smiley_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=102 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_styles`
-- 

CREATE TABLE `test_styles` (
  `style_id` mediumint(8) unsigned NOT NULL auto_increment,
  `style_name` varchar(255) collate utf8_bin NOT NULL default '',
  `style_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `style_active` tinyint(1) unsigned NOT NULL default '1',
  `template_id` mediumint(8) unsigned NOT NULL default '0',
  `theme_id` mediumint(8) unsigned NOT NULL default '0',
  `imageset_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`style_id`),
  UNIQUE KEY `style_name` (`style_name`),
  KEY `template_id` (`template_id`),
  KEY `theme_id` (`theme_id`),
  KEY `imageset_id` (`imageset_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_styles_imageset`
-- 

CREATE TABLE `test_styles_imageset` (
  `imageset_id` mediumint(8) unsigned NOT NULL auto_increment,
  `imageset_name` varchar(255) collate utf8_bin NOT NULL default '',
  `imageset_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `imageset_path` varchar(100) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`imageset_id`),
  UNIQUE KEY `imgset_nm` (`imageset_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_styles_imageset_data`
-- 

CREATE TABLE `test_styles_imageset_data` (
  `image_id` mediumint(8) unsigned NOT NULL auto_increment,
  `image_name` varchar(200) collate utf8_bin NOT NULL default '',
  `image_filename` varchar(200) collate utf8_bin NOT NULL default '',
  `image_lang` varchar(30) collate utf8_bin NOT NULL default '',
  `image_height` smallint(4) unsigned NOT NULL default '0',
  `image_width` smallint(4) unsigned NOT NULL default '0',
  `imageset_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`image_id`),
  KEY `i_d` (`imageset_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=599 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_styles_template`
-- 

CREATE TABLE `test_styles_template` (
  `template_id` mediumint(8) unsigned NOT NULL auto_increment,
  `template_name` varchar(255) collate utf8_bin NOT NULL default '',
  `template_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `template_path` varchar(100) collate utf8_bin NOT NULL default '',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default 'kNg=',
  `template_storedb` tinyint(1) unsigned NOT NULL default '0',
  `template_inherits_id` int(4) unsigned NOT NULL default '0',
  `template_inherit_path` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`template_id`),
  UNIQUE KEY `tmplte_nm` (`template_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_styles_template_data`
-- 

CREATE TABLE `test_styles_template_data` (
  `template_id` mediumint(8) unsigned NOT NULL default '0',
  `template_filename` varchar(100) collate utf8_bin NOT NULL default '',
  `template_included` text collate utf8_bin NOT NULL,
  `template_mtime` int(11) unsigned NOT NULL default '0',
  `template_data` mediumtext collate utf8_bin NOT NULL,
  KEY `tid` (`template_id`),
  KEY `tfn` (`template_filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_styles_theme`
-- 

CREATE TABLE `test_styles_theme` (
  `theme_id` mediumint(8) unsigned NOT NULL auto_increment,
  `theme_name` varchar(255) collate utf8_bin NOT NULL default '',
  `theme_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `theme_path` varchar(100) collate utf8_bin NOT NULL default '',
  `theme_storedb` tinyint(1) unsigned NOT NULL default '0',
  `theme_mtime` int(11) unsigned NOT NULL default '0',
  `theme_data` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`theme_id`),
  UNIQUE KEY `theme_name` (`theme_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_Szervez`
-- 

CREATE TABLE `test_Szervez` (
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
  `pluszfo` char(1) character set utf8 collate utf8_bin NOT NULL default 'N' COMMENT 'Plusz fők engedélyezése Y/N',
  `tarsszervezo` varchar(255) character set utf8 collate utf8_bin NOT NULL COMMENT 'Társszervező user neve',
  PRIMARY KEY  (`topic_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_szervez_old`
-- 

CREATE TABLE `test_szervez_old` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `GameDate` date NOT NULL default '0000-00-00',
  `PlayerNr` mediumint(4) unsigned NOT NULL default '0',
  `Fee` mediumint(6) unsigned NOT NULL default '0',
  `BattleField` varchar(50) NOT NULL default '',
  `Roster` char(1) NOT NULL default 'N',
  `Side1` varchar(50) NOT NULL default '',
  `Side2` varchar(50) NOT NULL default '',
  `Side3` varchar(50) default NULL,
  `Side4` varchar(50) default NULL,
  `Closed` char(1) NOT NULL default 'N',
  `lside1` tinyint(1) default '0',
  `lside2` tinyint(1) default '0',
  `lside3` tinyint(1) default '0',
  `lside4` tinyint(1) default '0',
  PRIMARY KEY  (`topic_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_topics`
-- 

CREATE TABLE `test_topics` (
  `topic_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_attachment` tinyint(1) unsigned NOT NULL default '0',
  `topic_approved` tinyint(1) unsigned NOT NULL default '1',
  `topic_reported` tinyint(1) unsigned NOT NULL default '0',
  `topic_title` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `topic_poster` mediumint(8) unsigned NOT NULL default '0',
  `topic_time` int(11) unsigned NOT NULL default '0',
  `topic_time_limit` int(11) unsigned NOT NULL default '0',
  `topic_views` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies_real` mediumint(8) unsigned NOT NULL default '0',
  `topic_status` tinyint(3) NOT NULL default '0',
  `topic_type` tinyint(3) NOT NULL default '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_first_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_first_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_last_poster_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_last_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_last_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `topic_last_post_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_last_post_time` int(11) unsigned NOT NULL default '0',
  `topic_last_view_time` int(11) unsigned NOT NULL default '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_bumped` tinyint(1) unsigned NOT NULL default '0',
  `topic_bumper` mediumint(8) unsigned NOT NULL default '0',
  `poll_title` varchar(255) collate utf8_bin NOT NULL default '',
  `poll_start` int(11) unsigned NOT NULL default '0',
  `poll_length` int(11) unsigned NOT NULL default '0',
  `poll_max_options` tinyint(4) NOT NULL default '1',
  `poll_last_vote` int(11) unsigned NOT NULL default '0',
  `poll_vote_change` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_type` (`forum_id`,`topic_type`),
  KEY `last_post_time` (`topic_last_post_time`),
  KEY `topic_approved` (`topic_approved`),
  KEY `forum_appr_last` (`forum_id`,`topic_approved`,`topic_last_post_id`),
  KEY `fid_time_moved` (`forum_id`,`topic_last_post_time`,`topic_moved_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5623 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_topics_posted`
-- 

CREATE TABLE `test_topics_posted` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_posted` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_topics_track`
-- 

CREATE TABLE `test_topics_track` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `mark_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`topic_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_topics_watch`
-- 

CREATE TABLE `test_topics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `notify_status` tinyint(1) unsigned NOT NULL default '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_users`
-- 

CREATE TABLE `test_users` (
  `user_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_type` tinyint(2) NOT NULL default '0',
  `group_id` mediumint(8) unsigned NOT NULL default '3',
  `user_permissions` mediumtext collate utf8_bin NOT NULL,
  `user_perm_from` mediumint(8) unsigned NOT NULL default '0',
  `user_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `user_regdate` int(11) unsigned NOT NULL default '0',
  `username` varchar(255) collate utf8_bin NOT NULL default '',
  `username_clean` varchar(255) collate utf8_bin NOT NULL default '',
  `user_password` varchar(40) collate utf8_bin NOT NULL default '',
  `user_passchg` int(11) unsigned NOT NULL default '0',
  `user_pass_convert` tinyint(1) unsigned NOT NULL default '0',
  `user_email` varchar(100) collate utf8_bin NOT NULL default '',
  `user_email_hash` bigint(20) NOT NULL default '0',
  `user_birthday` varchar(10) collate utf8_bin NOT NULL default '',
  `user_lastvisit` int(11) unsigned NOT NULL default '0',
  `user_lastmark` int(11) unsigned NOT NULL default '0',
  `user_lastpost_time` int(11) unsigned NOT NULL default '0',
  `user_lastpage` varchar(200) collate utf8_bin NOT NULL default '',
  `user_last_confirm_key` varchar(10) collate utf8_bin NOT NULL default '',
  `user_last_search` int(11) unsigned NOT NULL default '0',
  `user_warnings` tinyint(4) NOT NULL default '0',
  `user_last_warning` int(11) unsigned NOT NULL default '0',
  `user_login_attempts` tinyint(4) NOT NULL default '0',
  `user_inactive_reason` tinyint(2) NOT NULL default '0',
  `user_inactive_time` int(11) unsigned NOT NULL default '0',
  `user_posts` mediumint(8) unsigned NOT NULL default '0',
  `user_lang` varchar(30) collate utf8_bin NOT NULL default '',
  `user_timezone` decimal(5,2) NOT NULL default '0.00',
  `user_dst` tinyint(1) unsigned NOT NULL default '0',
  `user_dateformat` varchar(30) collate utf8_bin NOT NULL default 'd M Y H:i',
  `user_style` mediumint(8) unsigned NOT NULL default '0',
  `user_rank` mediumint(8) unsigned NOT NULL default '0',
  `user_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `user_new_privmsg` int(4) NOT NULL default '0',
  `user_unread_privmsg` int(4) NOT NULL default '0',
  `user_last_privmsg` int(11) unsigned NOT NULL default '0',
  `user_message_rules` tinyint(1) unsigned NOT NULL default '0',
  `user_full_folder` int(11) NOT NULL default '-3',
  `user_emailtime` int(11) unsigned NOT NULL default '0',
  `user_topic_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_topic_sortby_type` varchar(1) collate utf8_bin NOT NULL default 't',
  `user_topic_sortby_dir` varchar(1) collate utf8_bin NOT NULL default 'd',
  `user_post_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_post_sortby_type` varchar(1) collate utf8_bin NOT NULL default 't',
  `user_post_sortby_dir` varchar(1) collate utf8_bin NOT NULL default 'd',
  `user_notify` tinyint(1) unsigned NOT NULL default '0',
  `user_notify_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_notify_type` tinyint(4) NOT NULL default '0',
  `user_allow_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewonline` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewemail` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_massemail` tinyint(1) unsigned NOT NULL default '1',
  `user_options` int(11) unsigned NOT NULL default '895',
  `user_avatar` varchar(255) collate utf8_bin NOT NULL default '',
  `user_avatar_type` tinyint(2) NOT NULL default '0',
  `user_avatar_width` smallint(4) unsigned NOT NULL default '0',
  `user_avatar_height` smallint(4) unsigned NOT NULL default '0',
  `user_sig` mediumtext collate utf8_bin NOT NULL,
  `user_sig_bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `user_sig_bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `user_from` varchar(100) collate utf8_bin NOT NULL default '',
  `user_icq` varchar(15) collate utf8_bin NOT NULL default '',
  `user_aim` varchar(255) collate utf8_bin NOT NULL default '',
  `user_yim` varchar(255) collate utf8_bin NOT NULL default '',
  `user_msnm` varchar(255) collate utf8_bin NOT NULL default '',
  `user_jabber` varchar(255) collate utf8_bin NOT NULL default '',
  `user_website` varchar(200) collate utf8_bin NOT NULL default '',
  `user_occ` text collate utf8_bin NOT NULL,
  `user_interests` text collate utf8_bin NOT NULL,
  `user_actkey` varchar(32) collate utf8_bin NOT NULL default '',
  `user_newpasswd` varchar(40) collate utf8_bin NOT NULL default '',
  `user_form_salt` varchar(32) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `username_clean` (`username_clean`),
  KEY `user_birthday` (`user_birthday`),
  KEY `user_email_hash` (`user_email_hash`),
  KEY `user_type` (`user_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=25457 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_user_group`
-- 

CREATE TABLE `test_user_group` (
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `group_leader` tinyint(1) unsigned NOT NULL default '0',
  `user_pending` tinyint(1) unsigned NOT NULL default '1',
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_leader` (`group_leader`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_warnings`
-- 

CREATE TABLE `test_warnings` (
  `warning_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `log_id` mediumint(8) unsigned NOT NULL default '0',
  `warning_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`warning_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=467 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_words`
-- 

CREATE TABLE `test_words` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word` varchar(255) collate utf8_bin NOT NULL default '',
  `replacement` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`word_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=92 ;

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `test_zebra`
-- 

CREATE TABLE `test_zebra` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `zebra_id` mediumint(8) unsigned NOT NULL default '0',
  `friend` tinyint(1) unsigned NOT NULL default '0',
  `foe` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`zebra_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
