CREATE TABLE `link` (
  `higher_note_id` int(11) NOT NULL,
  `lower_note_id` int(11) NOT NULL,
  PRIMARY KEY (`lower_note_id`,`higher_note_id`),
  KEY `FK_H_NOTE_TO_L_NOTE` (`lower_note_id`),
  KEY `FK_L_NOTE_TO_H_NOTE` (`higher_note_id`),
  CONSTRAINT `FK_H_NOTE_TO_L_NOTE` FOREIGN KEY (`lower_note_id`) REFERENCES `note` (`note_id`),
  CONSTRAINT `FK_L_NOTE_TO_H_NOTE` FOREIGN KEY (`higher_note_id`) REFERENCES `note` (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `publishing_status` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `text` varchar(10000) NOT NULL,
  `note_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `FK_105lhx05vyp824xw6jbfsccuf` (`note_type_id`),
  CONSTRAINT `FK_105lhx05vyp824xw6jbfsccuf` FOREIGN KEY (`note_type_id`) REFERENCES `note_type` (`note_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

CREATE TABLE `note_type` (
  `note_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL,
  PRIMARY KEY (`note_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `username` varchar(16) NOT NULL,
  `email` varchar(45) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `password` varchar(16) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_note` (
  `user_note_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  PRIMARY KEY (`user_note_id`),
  KEY `FK_k9jhcyiij1mhd3p2l63fon34a` (`note_id`),
  KEY `FK_5pfoiqjauemr1g3kagl2xs66y` (`username`),
  CONSTRAINT `FK_5pfoiqjauemr1g3kagl2xs66y` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FK_k9jhcyiij1mhd3p2l63fon34a` FOREIGN KEY (`note_id`) REFERENCES `note` (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `username` varchar(16) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `FK_9ry105icat2dux14oyixybw9l` (`username`),
  CONSTRAINT `FK_9ry105icat2dux14oyixybw9l` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;