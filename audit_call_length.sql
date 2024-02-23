USE CDR
GO

UPDATE FactCalls
SET Audit_id = 
    CASE 
        WHEN CallTimeMinutes <= 0 THEN 'E'
        WHEN CallTimeMinutes > 0 AND CallTimeMinutes <= 1.1 OR CallTimeMinutes >= 146 THEN 'S'
        ELSE 'G'
    END;


CREATE TABLE DimAudit (
    Id CHAR(1) PRIMARY KEY,
    Code VARCHAR(10)
);

INSERT INTO DimAudit (Id, Code)
VALUES
    ('G', 'Good'),
    ('S', 'Suspect'),
    ('E', 'Error');

	-- Add the Audit_id column to the FactCalls table
ALTER TABLE FactCalls
ADD Audit_id CHAR(1) NULL;

-- Add the foreign key constraint
ALTER TABLE FactCalls
ADD CONSTRAINT FK_Audit
FOREIGN KEY (Audit_id)
REFERENCES DimAudit(Id);

SELECT Audit_id, count(*) FROM FactCalls GROUP BY Audit_id;