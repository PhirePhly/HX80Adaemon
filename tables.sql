CREATE TABLE 'telemetry_sources' (
  'source_id' int(10) NOT NULL AUTO_INCREMENT,
  'device_name' varchar(72),
  'location' varchar(72),
  'desc' varchar(255),
  PRIMARY KEY ('source_id')
)

CREATE TABLE 'telemetry_channels' (
  'channel_id' int(10) NOT NULL AUTO_INCREMENT,
  'source_id' int(10),
  'units' varchar(72),
  'desc' varchar(255),
  PRIMARY KEY ('channel_id')
  CONSTRAINT 'telemetry_channels_ibfk_1' FOREIGN KEY ('source_id')
    REFERENCES 'telemetry_sources' ('source_id') ON DELETE CASCADE
)

CREATE TABLE 'telemetry_meas' (
  'id' int(10) NOT NULL AUTO_INCREMENT,
  'channel_id' int(10),
  'value' float,
  'date' timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ('id')
  CONSTRAINT 'telemetry_meas_ibfk_1' FOREIGN KEY ('channel_id')
    REFERENCES 'telemetry_channels' ('channel_id') ON DELETE CASCADE
)

