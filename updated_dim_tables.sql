USE CDR
GO

-- Remove Audit Values
UPDATE calldetails
SET Audit = '';


--- Fixed Null values
UPDATE calldetails
SET transport_mode = 'UFO'
WHERE transport_mode is null;

SELECT transport_mode FROM calldetails GROUP BY transport_mode;

-- Create Dim Table for  MobilityType
CREATE TABLE DimMobilityType (
    mobility_type_id INT PRIMARY KEY IDENTITY,
    mobility_type_name VARCHAR(50)
);


INSERT INTO DimMobilityType (mobility_type_name)
SELECT DISTINCT mobility_type
FROM calldetails;

SELECT * FROM DimMobilityType;

--- Create DimTransportMode
CREATE TABLE DimTransportMode (
    transport_mode_id INT PRIMARY KEY IDENTITY,
    transport_mode_name VARCHAR(50)
);
-- Populate Transport Mode Dimension Table
INSERT INTO DimTransportMode (transport_mode_name)
SELECT DISTINCT transport_mode
FROM calldetails;

SELECT * FROM DimTransportMode;

ALTER TABLE calldetails
ADD mobility_type_id INT;

ALTER TABLE calldetails
ADD CONSTRAINT FK_MobilityType
FOREIGN KEY (mobility_type_id)
REFERENCES DimMobilityType(mobility_type_id);

UPDATE  cc
SET cc.mobility_type_id = mt.mobility_type_id
FROM calldetails cc
INNER JOIN DimMobilityType mt ON cc.mobility_type = mt.mobility_type_name;

SELECT mobility_type_id, count(*) FROM calldetails GROUP BY mobility_type_id;

---


ALTER TABLE calldetails
ADD transport_mode_id INT;

ALTER TABLE calldetails
ADD CONSTRAINT FK_TransportMode
FOREIGN KEY (transport_mode_id)
REFERENCES DimTransportMode(transport_mode_id);

SELECT  transport_mode_id,count(*) FROM calldetails GROUP BY transport_mode_id

UPDATE cc
SET cc.transport_mode_id = tm.transport_mode_id
FROM calldetails cc
INNER JOIN DimTransportMode tm ON cc.transport_mode = tm.transport_mode_name;

--- Set ip FK for Calldate
SELECT distinct transport_mode_id FROM calldetails;
Create Foreign Key for CallDate
ALTER TABLE calldetials
ALTER COLUMN CallDate DATE;

ALTER TABLE calldetails
ADD CONSTRAINT FK_CallDate
FOREIGN KEY (CallDate)
REFERENCES DimCalendar(Date);

--- Drop ma mobility_type and  transport_mode

ALTER TABLE calldetails
DROP COLUMN transport_mode;

