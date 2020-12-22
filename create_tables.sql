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

# Changes after creating table
ALTER TABLE `Connectors - Wire to Board` ADD `Number of positions` VARCHAR(150) NOT NULL;

ALTER TABLE `Connectors - Wire to Board` ADD `Number of rows` VARCHAR(10) NULL;
ALTER TABLE `Connectors - Wire to Board` DROP `Number of rows`;


# Adding the column JLC CPL
ALTER TABLE `Connectors - Board to Board` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Connectors - High Power` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Connectors - Miscellaneous` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Connectors - Modular Jacks` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Connectors - Pin Header` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Connectors - Wire to Board` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Diodes - LED` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Diodes - Schottky` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Diodes - Standard` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Diodes - TVS` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Diodes - Zener` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Interface - CAN` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Interface - Ethernet` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Interface - I2C` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Interface - JTAG` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Interface - Optical` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Interface - SD-Card` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Interface - SPI` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Logic - Gates and Inverters` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Logic - Level Translators` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `MOSFET - Gate Drivers` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `MOSFET - N-Channel` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `MOSFET - P-Channel` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE Microcontrollers ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Power Supply - DC DC Switching Regulators` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Power Supply - Linear` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Power Supply - Module` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `Sensor - Current` ADD `JLC CPL` VARCHAR(255) NULL;
ALTER TABLE `SoC and SoM` ADD `JLC CPL` VARCHAR(255) NULL;


# Adding the colum Stock number AEG Building
ALTER TABLE `Connectors - Board to Board` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Connectors - High Power` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Connectors - Miscellaneous` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Connectors - Modular Jacks` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Connectors - Pin Header` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Connectors - Wire to Board` ADD `Stock number` VARCHAR(255) NOT NULL DEFAULT 'not stored';
ALTER TABLE `Diodes - LED` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Diodes - Schottky` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Diodes - Standard` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Diodes - TVS` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Diodes - Zener` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Interface - CAN` ADD `Stock number` VARCHAR(255) NOT NULL DEFAULT 'not stored';
ALTER TABLE `Interface - Ethernet` ADD `Stock number` VARCHAR(255) NOT NULL DEFAULT 'not stored';
ALTER TABLE `Interface - I2C` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Interface - JTAG` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Interface - Optical` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Interface - SD-Card` ADD `Stock number` VARCHAR(255) NOT NULL DEFAULT 'not stored';
ALTER TABLE `Interface - SPI` ADD `Stock number` VARCHAR(255) NOT NULL DEFAULT 'not stored';
ALTER TABLE `Logic - Gates and Inverters` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Logic - Level Translators` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `MOSFET - Gate Drivers` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `MOSFET - N-Channel` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `MOSFET - P-Channel` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE Microcontrollers ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Power Supply - DC DC Switching Regulators` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Power Supply - Linear` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Power Supply - Module` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `Sensor - Current` ADD `Stock number` VARCHAR(255) NOT NULL;
ALTER TABLE `SoC and SoM` ADD `Stock number` VARCHAR(255) NOT NULL;

# Adding new columns for diodes - led
ALTER TABLE `Diodes - LED` ADD `Color` VARCHAR(255) NULL;
ALTER TABLE `Diodes - LED` ADD `Forward Current I_f` VARCHAR(255) NULL;
ALTER TABLE `Diodes - LED` ADD `Forward Voltage U_f` VARCHAR(255) NULL;
ALTER TABLE `Diodes - LED` ADD `Wavelength` VARCHAR(255) NULL;
ALTER TABLE `Diodes - LED` ADD `Light Intensity` VARCHAR(255) NULL;
ALTER TABLE `Diodes - LED` ADD `Nominal Power` VARCHAR(255) NULL;

UPDATE `Diodes - LED` SET `Wavelength` = '800 nm' where Wavelength = '605 nm'; 

CREATE OR REPLACE TABLE  `Resistors - SMD` (
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
	`Tolerance`					VARCHAR(100) NULL,
	`Value` 					VARCHAR(100) NULL,
	`Created from`				VARCHAR(100) NULL,
	`Verified by`				VARCHAR(100) NULL,
	`Live Cycle Status`			VARCHAR(100) NOT NULL,
	`JLC CPL`					VARCHAR(100) NULL,
	`Stock number`				VARCHAR(100) NULL,
	CONSTRAINT primary_key PRIMARY KEY (PartID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;


CREATE OR REPLACE TABLE  `Capacitors - SMD` (
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
	`Tolerance`					VARCHAR(100) NULL,
	`Voltage Rating`			VARCHAR(100) NULL,
	`Value` 					VARCHAR(100) NULL,
	`Applications`				VARCHAR(100) NULL,
	`Created from`				VARCHAR(100) NULL,
	`Verified by`				VARCHAR(100) NULL,
	`Live Cycle Status`			VARCHAR(100) NOT NULL,
	CONSTRAINT primary_key PRIMARY KEY (PartID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;


CREATE OR REPLACE TABLE  `Capacitors - SMD` (
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
	`Library Path` 				VARCHAR(100) NOT NULL,
	`Library Ref` 				VARCHAR(100) NOT NULL,
	`Type` 						VARCHAR(100) NOT NULL,
	`Tolerance`					VARCHAR(100) NULL,
	`Voltage Rating`			VARCHAR(100) NULL,
	`Value` 					VARCHAR(100) NOT NULL,
	`Created from`				VARCHAR(100) NULL,
	`Verified by`				VARCHAR(100) NULL,
	`Live Cycle Status`			VARCHAR(100) NOT NULL,
	`JLC CPL`					VARCHAR(100) NULL,
	`Stock number`				VARCHAR(100) NULL,
	CONSTRAINT primary_key PRIMARY KEY (PartID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;