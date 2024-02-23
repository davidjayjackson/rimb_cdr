
CREATE TABLE [dbo].[FactCalls](
	[Call_Index] [int] NOT NULL,
	[CallDate] [date] NULL,
	[call_num] [int] NOT NULL,
	[destination_num] [int] NOT NULL,
	[trip_sequence] [tinyint] NOT NULL,
	-- [mobility_type] [nvarchar](50) NULL,
	-- [transport_mode] [nvarchar](50) NULL,
	[total_distance] [nvarchar](50) NOT NULL,
	[time_index] [int] NOT NULL,
	[CallTimeSeconds] [int] NOT NULL,
	[CallTimeMinutes] [int] NOT NULL,
	[Classification] [nvarchar](50) NOT NULL,
	[Audit] [nvarchar](50) NOT NULL,
	[mobility_type_id] [int] NULL,
	[transport_mode_id] [int] NULL;



CREATE TABLE [dbo].[DimCalendar](
	[PkDate] [datetime2](7) NOT NULL,
	[DayOfWeekNumber] [tinyint] NULL,
	[DayOfWeekName] [varchar](3) NULL,
	[MonthNumber] [tinyint] NULL,
	[MonthName] [varchar](3) NULL,
	[Year] [smallint] NULL,
	[Quarter] [char](6) NULL;



CREATE TABLE [dbo].[DimMobilityType](
	[mobility_type_id] [int] IDENTITY(1,1) NOT NULL,
	[mobility_type_name] [varchar](50) NULL;


CREATE TABLE [dbo].[DimTransportMode](
	[transport_mode_id] [int] IDENTITY(1,1) NOT NULL,
	[transport_mode_name] [varchar](50) NULL;

CREATE TABLE DimAudit (
    Id CHAR(1) PRIMARY KEY,
    Code VARCHAR(10)
);

