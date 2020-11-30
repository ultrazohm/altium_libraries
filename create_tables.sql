CREATE OR REPLACE TEMPORARY TABLE table_names(
	ID INT NOT NULL AUTO_INCREMENT,
	table_name VARCHAR(100),
	CONSTRAINT table_names_pk PRIMARY KEY (ID)
);

INSERT INTO table_names (table_name) VALUES
('Annotation'),
('Connectors - Board to Board'),
('Connectors - Modular Jacks'),
('Connectors - Pin Header'),
('Connectors - Wire to Board'),
('Connectors - Miscellaneous'),
('Connectors - High Power'),
('ADC'),
('Sensor - Current'),
('Power Supply - Module'),
('Power Supply - DC DC Switching Regulators'),
('Power Supply - Linear'),
('Diodes - Schottky'),
('Diodes - LED'),
('Diodes - TVS'),
('Diodes - Zener'),
('Diodes - Standard'),
('MOSFET - Gate Drivers'),
('MOSFET - N-Channel'),
('MOSFET - P-Channel'),
('Logic - Gates and Inverters'),
('Logic - Level Translators'),
('Interface - Ethernet'),
('Interface - SD-Card'),
('Interface - SPI'),
('Interface - I2C'),
('Interface - CAN'),
('Interface - Optical'),
('Interface - JTAG'),
('Microcontrollers'),
('SoC and SoM');
SELECT * from table_names;

CREATE OR REPLACE TABLE altium_library.sample_table (
	PartID 						INT NOT NULL AUTO_INCREMENT,
	`Created On` 				TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`Comment` 					VARCHAR(100) NULL,
	`ComponentLink1Description`	VARCHAR(100) NOT NULL,
	`ComponentLink1URL`			VARCHAR(250) NOT NULL,
	`ComponentLink2Description`	VARCHAR(100) NULL,
	`ComponentLink2URL`			VARCHAR(250) NULL,
	`ComponentLink3Description`	VARCHAR(100) NULL,
	`ComponentLink3URL`			VARCHAR(250) NULL,
	`ComponentLink4Description`	VARCHAR(100) NULL,
	`ComponentLink4URL`			VARCHAR(250) NULL,
	`ComponentLink5Description`	VARCHAR(100) NULL,
	`ComponentLink5URL`			VARCHAR(250) NULL,
	`ComponentLink6Description`	VARCHAR(100) NULL,
	`ComponentLink6URL`			VARCHAR(250) NULL,
	`Component Type` 			VARCHAR(30) NOT NULL,
	`Description` 				VARCHAR(200) NOT NULL,
	`Device Package` 			VARCHAR(100) NULL,
	`Footprint Path` 			VARCHAR(100) NOT NULL,
	`Footprint Path 2` 			VARCHAR(100) NULL,
	`Footprint Path 3` 			VARCHAR(100) NULL,
	`Footprint Ref` 			VARCHAR(100) NOT NULL,
	`Footprint Ref 2` 			VARCHAR(100) NULL,
	`Footprint Ref 3` 			VARCHAR(100) NULL,
	`Last Updated` 				DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`Manufacturer` 				VARCHAR(100) NOT NULL,
	`Manufacturer Part Number` 	VARCHAR(100) NOT NULL,
	`Minimum Order` 			INTEGER NULL,
	`Mounting Type` 			VARCHAR(127) NULL,
	`Operating Temperature` 	VARCHAR(127) NULL,
	`Series`					VARCHAR(100) NULL,
	`Supplier 1` 				VARCHAR(150) NOT NULL,
	`Supplier Part Number 1` 	VARCHAR(150) NOT NULL,
	`Supplier 2` 				VARCHAR(150) NULL,
	`Supplier Part Number 2` 	VARCHAR(150) NULL,
	`Supplier 3` 				VARCHAR(150) NULL,
	`Supplier Part Number 3` 	VARCHAR(150) NULL,
	`Supplier 4` 				VARCHAR(150) NULL,
	`Supplier Part Number 4` 	VARCHAR(150) NULL,
	`Supplier 5` 				VARCHAR(150) NULL,
	`Supplier Part Number 5` 	VARCHAR(150) NULL,
	`Supplier 6` 				VARCHAR(150) NULL,
	`Supplier Part Number 6` 	VARCHAR(150) NULL,
	`Library Path` 				VARCHAR(100) NULL,
	`Library Ref` 				VARCHAR(100) NULL,
	`Type` 						VARCHAR(100) NOT NULL,
	`Value` 					VARCHAR(100) NULL,
	`Created from`				VARCHAR(100) NULL,
	`Verified by`				VARCHAR(100) NULL,
	`Live Cycle Status`			VARCHAR(100) NOT NULL,
	CONSTRAINT primary_key PRIMARY KEY (PartID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;


DELIMITER //
CREATE OR REPLACE PROCEDURE create_tables_from_def ()
BEGIN
	DECLARE name VARCHAR(64);
	FOR record IN (SELECT table_name AS name FROM table_names) DO
		# Entries in record.name contain white spaces which must be escaped using `...`
		SET name = CONCAT('`', record.name, '`');
		SET @SQL := CONCAT('CREATE TABLE IF NOT EXISTS ', name, ' LIKE sample_table');
  		PREPARE stmt FROM @SQL;
    	EXECUTE stmt;
   		DEALLOCATE PREPARE stmt;
	END FOR;
END //
DELIMITER ;


CALL create_tables_from_def();


DROP TABLE IF EXISTS table_names;
DROP TABLE IF EXISTS sample_table;

ALTER TABLE `Connectors - Wire to Board` ADD `Number of positions` VARCHAR(150) NOT NULL;
#ALTER TABLE `Connectors - Wire to Board` DROP `Number of positions`;

ALTER TABLE `Connectors - Wire to Board` ADD `Number of rows` VARCHAR(10) NULL;
ALTER TABLE `Connectors - Wire to Board` DROP `Number of rows`;

ALTER TABLE `Connectors - Wire to Board` ADD test VARCHAR(150) NOT NULL;