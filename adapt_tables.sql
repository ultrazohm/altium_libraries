ALTER TABLE ics 
CHANGE COLUMN IF EXISTS `Library_Path` `Library Path` VARCHAR(255);

ALTER TABLE ics 
CHANGE COLUMN IF EXISTS `Library_Path` `Library Path` VARCHAR(255);

ALTER TABLE ics 
CHANGE COLUMN IF EXISTS `Footprint_Path` `Footprint Path` VARCHAR(255);

ALTER TABLE ics 
CHANGE COLUMN IF EXISTS `Footprint_Ref` `Footprint Ref` VARCHAR(255);

ALTER TABLE ics 
CHANGE COLUMN IF EXISTS `Manufacturer_Part_Number` `Part Number` VARCHAR(255);
