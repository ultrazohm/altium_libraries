CREATE OR REPLACE TABLE altium_library.sample_table (
	PartID INT NOT NULL AUTO_INCREMENT,
	Created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Comment VARCHAR(100) NULL,
	ComponentLink1Description VARCHAR(100) NOT NULL,
	ComponentLink1URL VARCHAR(250) NOT NULL,
	ComponentLink2Description VARCHAR(100) NULL,
	ComponentLink2URL VARCHAR(250) NULL,
	ComponentLink3Description VARCHAR(100) NULL,
	ComponentLink3URL VARCHAR(250) NULL,
	ComponentLink4Description VARCHAR(100) NULL,
	ComponentLink4URL VARCHAR(250) NULL,
	ComponentLink5Description VARCHAR(100) NULL,
	ComponentLink5URL VARCHAR(250) NULL,
	ComponentLink6Description VARCHAR(100) NULL,
	ComponentLink6URL VARCHAR(250) NULL,
	`Component Type` VARCHAR(30) NOT NULL,
	Description VARCHAR(200) NOT NULL,
	`Device Package` VARCHAR(100) NULL,
	`Footprint Path` VARCHAR(100) NOT NULL,
	`Footprint Path 2` VARCHAR(100) NULL,
	`Footprint Path 3` VARCHAR(100) NULL,
	`Footprint Ref` VARCHAR(100) NOT NULL,
	`Footprint Ref 2` VARCHAR(100) NULL,
	`Footprint Ref 3` VARCHAR(100) NULL,
	LastUpdated DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	Manufacturer VARCHAR(100) NOT NULL,
	`Manufacturer Part Number` VARCHAR(100) NOT NULL,
	`Minimum Order` INTEGER NULL,
	`Mounting Type` VARCHAR(127) NULL,
	`Operating Temperature` VARCHAR(127) NULL,
	Packaging VARCHAR(100) NULL,
	Series VARCHAR(100) NULL,
	`Supplier 1` VARCHAR(150) NOT NULL,
	`Supplier Part Number 1` VARCHAR(150) NOT NULL,
	`Supplier 2` VARCHAR(150) NULL,
	`Supplier Part Number 2` VARCHAR(150) NULL,
	`Supplier 3` VARCHAR(150) NULL,
	`Supplier Part Number 3` VARCHAR(150) NULL,
	`Supplier 4` VARCHAR(150) NULL,
	`Supplier Part Number 4` VARCHAR(150) NULL,
	`Supplier 5` VARCHAR(150) NULL,
	`Supplier Part Number 5` VARCHAR(150) NULL,
	`Supplier 6` VARCHAR(150) NULL,
	`Supplier Part Number 6` VARCHAR(150) NULL,
	`Library Path` VARCHAR(100) NULL,
	`Library Ref` VARCHAR(100) NULL,
	`Type` VARCHAR(100) NOT NULL,
	Value VARCHAR(100) NULL,
	CONSTRAINT primary_key PRIMARY KEY (PartID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

INSERT INTO sample_table 
(ComponentLink1Description, ComponentLink1URL, `Component Type`, Description, 
`Footprint Path`, `Footprint Ref`, Manufacturer, `Manufacturer Part Number`, `Supplier 1`, `Supplier Part Number 1`, `Type`) 
VALUES
('test','test','test','test','test','test','test','test','test','test','test');

UPDATE sample_table SET ComponentLink1Description = 'test1';

SELECT Created, LastUpdated FROM sample_table ;