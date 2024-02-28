USE CDR
GO

CREATE TABLE [dbo].[DIM_AUDIT](
    [Id] [char](1) NOT NULL,
    [Code] [varchar](10) NULL);




CREATE TABLE [dbo].[DIM_CALENDAR](
	[PkDate] [datetime2](7) NOT NULL,
	[Year] [int] NULL,
	[Quarter] [varchar](6) NULL,
	[MonthNumber] [int] NULL,
	[MonthName] [varchar](20) NULL,
	[MonthAbbreviation] [char](3) NULL,
	[DayOfWeekNumber] [int] NULL,
	[DayOfWeekName] [varchar](20) NULL,
	[DayOfWeekAbbreviation] [char](3) NULL);

CREATE TABLE [dbo].[DIM_CUST](
	[call_from] [int] NOT NULL,
	[CallDate] [date] NOT NULL,
	[MNC] [int] NOT NULL,
	[DataPlan] [int]);


CREATE TABLE [dbo].[DIM_MOBILE](
	[network] [nvarchar](50) NOT NULL,
	[MNC] [int] NOT NULL);



CREATE TABLE [dbo].[DIM_MOBILITY_TYPE](
	[mobility_type_id] [int] IDENTITY(1,1) NOT NULL,
	[mobility_type_name] [varchar](50) NULL);

CREATE TABLE [dbo].[FACT_CALLS](
	[Call_Index] [int] NOT NULL,
	[CallDate] [datetime2](7) NULL,
	[call_from] [int] NULL,
	[call_to] [int] NULL,
	[trip_sequence] [int] NULL,
	[mobility_type] [nvarchar](50) NULL,
	[transport_mode] [nvarchar](50) NULL,
	[total_distance] [int] NULL,
	[time_index] [int] NULL,
	[CallTimeSeconds] [nvarchar](50) NULL,
	[CallTimeMinutes] [int] NULL,
	[Classification] [nvarchar](50) NULL,
	[Audit] [nvarchar](50) NULL,
	[mobility_type_id] [int] NULL,
	[transport_mode_id] [int] NULL,
	[Audit_id] [char](1) NULL);

CREATE TABLE [dbo].[FACT_SMS](
	[call_from] [int] NOT NULL,
	[date] [datetime2](7) NOT NULL,
	[num_texts] [tinyint] NOT NULL);

	
	-- Copy data from RIMB to CDR

INSERT INTO CDR.dbo.[DIM_AUDIT]
SELECT * FROM RIMB.dbo.DOM_AUDIT;


INSERT INTO CDR.dbo.[DIM_CALENDAR]
SELECT * FROM RIMB.dbo.DIM_CALENDAR;

INSERT INTO CDR.dbo.[DIM_CUST]
SELECT * FROM RIMB.dbo.DIM_CUST;

INSERT INTO [dbo].[DIM_CUST] ([call_from], [CallDate], [MNC])
SELECT [call_from], [CallDate], [MNC]
FROM [dbo].[DIM_CUST];

INSERT INTO CDR.dbo.[DIM_MOBILE]
SELECT * FROM RIMB.dbo.[DIM_MOBILE];

INSERT INTO CDR.dbo.[FACT_CALLS]
SELECT * FROM RIMB.dbo.[FACT_CALLS];

INSERT INTO CDR.dbo.[FACT_SMS]
SELECT * FROM RIMB.dbo.[FACT_SMS];

SET IDENTITY_INSERT CDR.dbo.[DIM_MOBILITY_TYPE] ON;

INSERT INTO CDR.dbo.[DIM_MOBILITY_TYPE] (mobility_type_id, mobility_type_name)
SELECT mobility_type_id, mobility_type_name
FROM RIMB.dbo.[DIM_MOBILITY_TYPE];

SET IDENTITY_INSERT CDR.dbo.[DIM_MOBILITY_TYPE] OFF;

