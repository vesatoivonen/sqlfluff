CREATE TABLE dbo.doc_exa (column_a INT) ;
GO
ALTER TABLE dbo.doc_exa ADD column_b VARCHAR(20) NULL ;
GO

CREATE TABLE dbo.doc_exc (column_a INT) ;
GO
ALTER TABLE dbo.doc_exc ADD column_b VARCHAR(20) NULL
    CONSTRAINT exb_unique UNIQUE, DROP COLUMN column_a, DROP COLUMN IF EXISTS column_c ;
GO
EXEC sp_help doc_exc ;
GO
DROP TABLE dbo.doc_exc ;
GO


CREATE TABLE dbo.doc_exz (column_a INT, column_b INT) ;
GO
INSERT INTO dbo.doc_exz (column_a) VALUES (7) ;
GO
ALTER TABLE dbo.doc_exz
  ADD CONSTRAINT col_b_def
  DEFAULT 50 FOR column_b ;
GO
INSERT INTO dbo.doc_exz (column_a) VALUES (10) ;
GO
SELECT * FROM dbo.doc_exz ;
GO
DROP TABLE dbo.doc_exz ;
GO


ALTER TABLE Production.TransactionHistoryArchive
ADD CONSTRAINT PK_TransactionHistoryArchive_TransactionID PRIMARY KEY CLUSTERED (TransactionID)
GO

ALTER TABLE Production.TransactionHistoryArchive
ALTER COLUMN rec_number VARCHAR(36)
GO

ALTER TABLE Production.TransactionHistoryArchive
DROP CONSTRAINT PK_TransactionHistoryArchive_TransactionID

ALTER TABLE [Production].[ProductCostHistory]
WITH CHECK ADD CONSTRAINT [FK_ProductCostHistory_Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [Production].[Product] ([ProductID])
GO

ALTER TABLE [Production].[ProductCostHistory]
CHECK CONSTRAINT [FK_ProductCostHistory_Product_ProductID]
GO

ALTER TABLE my_table
ADD my_col_1 INT
  , my_col_2 INT
GO

ALTER TABLE TestTable SET (SYSTEM_VERSIONING = ON); GO
ALTER TABLE TestTable SET (SYSTEM_VERSIONING = OFF); GO

ALTER TABLE TestTable SET
  (SYSTEM_VERSIONING = OFF (
    HISTORY_TABLE = TestTableHistory
  ));
GO

ALTER TABLE TestTable SET
  (SYSTEM_VERSIONING = OFF (
    HISTORY_TABLE = TestTableHistory,
    DATA_CONSISTENCY_CHECK = ON
  ));
GO

ALTER TABLE TestTable SET
  (SYSTEM_VERSIONING = OFF (
    HISTORY_TABLE = TestTableHistory,
    DATA_CONSISTENCY_CHECK = ON,
    HISTORY_RETENTION_PERIOD = INFINITE
  ));
GO

ALTER TABLE TestTable SET
  (SYSTEM_VERSIONING = OFF (
    HISTORY_TABLE = TestTableHistory,
    DATA_CONSISTENCY_CHECK = ON,
    HISTORY_RETENTION_PERIOD = 1 YEAR
  ));
GO

ALTER TABLE TestTable SET
  (SYSTEM_VERSIONING = OFF (
    HISTORY_TABLE = TestTableHistory,
    DATA_CONSISTENCY_CHECK = ON,
    HISTORY_RETENTION_PERIOD = 7 MONTHS
  ));
GO

ALTER TABLE TestTable SET (FILESTREAM_ON = "NULL"); GO
ALTER TABLE TestTable SET (FILESTREAM_ON = "default"); GO
ALTER TABLE TestTable SET (FILESTREAM_ON = PartitionSchemeName); GO
ALTER TABLE TestTable SET (DATA_DELETION = ON); GO
ALTER TABLE TestTable SET (DATA_DELETION = OFF(FILTER_COLUMN = ColumnName)); GO
ALTER TABLE TestTable SET (DATA_DELETION = OFF(FILTER_COLUMN = ColumnName, RETENTION_PERIOD = 1 YEAR)); GO
ALTER TABLE TestTable SET (DATA_DELETION = OFF(FILTER_COLUMN = ColumnName, RETENTION_PERIOD = INFINITE)); GO
ALTER TABLE TestTable SET (DATA_DELETION = OFF(FILTER_COLUMN = ColumnName, RETENTION_PERIOD = 7 YEARS)); GO
ALTER TABLE TestTable SET (DATA_DELETION = OFF(FILTER_COLUMN = ColumnName, RETENTION_PERIOD = 7 DAYS)); GO
