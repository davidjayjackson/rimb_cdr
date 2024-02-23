USE CDR
GO

UPDATE FactCalls
SET Audit = da.Code
FROM FactCalls fc
INNER JOIN DimAudit da ON fc.Audit_id = da.Id;

CREATE VIEW datamine_view AS
SELECT
    fc.Call_Index,
    fc.CallDate,
    fc.call_num,
    fc.destination_num,
    fc.trip_sequence,
    fc.total_distance,
    fc.time_index,
    fc.CallTimeSeconds,
    fc.CallTimeMinutes,
    fc.Classification,
    fc.Audit,
    dc.PkDate,
    dc.DayOfWeekNumber,
    dc.DayOfWeekName,
    dc.MonthNumber,
    dc.MonthName,
    dc.Year,
    dc.Quarter,
    dm.mobility_type_name,
    dt.transport_mode_name,
    fc.Audit AS AuditCode
FROM
    [dbo].[FactCalls] fc
INNER JOIN
    [dbo].[DimCalendar] dc ON fc.CallDate = dc.PkDate
LEFT JOIN
    [dbo].[DimMobilityType] dm ON fc.mobility_type_id = dm.mobility_type_id
LEFT JOIN
    [dbo].[DimTransportMode] dt ON fc.transport_mode_id = dt.transport_mode_id
LEFT JOIN
    DimAudit da ON fc.Audit = da.Id;


	SELECT AuditCode,count(*) FROM datamine_view  GROUP BY AuditCode;

SELECT 
    AuditCode,
    COUNT(*) AS TotalCount,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS Percentage
FROM 
    datamine_view  
GROUP BY 
    AuditCode;
