use sem4;

CREATE TABLE `check_in_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
	`student_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `date` varchar(255) NULL,
  `record_time` varchar(255) NULL,
  `status` tinyint DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;