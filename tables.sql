
CREATE TABLE  `telemetry_sources` (
  `source_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `name` VARCHAR( 72 ) ,
  `location` VARCHAR( 72 ) ,
  `desc` VARCHAR( 255 ) 
) ENGINE=InnoDB;

CREATE TABLE `telemetry_channels` (
  `channel_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `source_id` int(10),
  `units` varchar(72),
  `desc` varchar(255),
  CONSTRAINT `telemetry_channels_ibfk_1` FOREIGN KEY (`source_id`)
    REFERENCES `telemetry_sources` (`source_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `telemetry_meas` (
  `id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `channel_id` int(10),
  `value` float,
  `date` timestamp DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `telemetry_meas_ibfk_1` FOREIGN KEY (`channel_id`)
    REFERENCES `telemetry_channels` (`channel_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

