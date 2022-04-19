CREATE KEYSPACE PositionKeepingKeySpace 
  WITH REPLICATION = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 2
  }
AND DURABLE_WRITES = true; 

USE PositionKeepingKeySpace;

CREATE TYPE IF NOT EXISTS PositionKeepingKeySpace.Address (
  AddressType text,
  AddressLine text,
  StreetName text,
  TownName text,
  BuildingNumber text,
  PostCode text,
  CountrySubDivision text,
  Country_code text,
  Country_ShortName text,
  Country_Description text
);

CREATE TYPE IF NOT EXISTS PositionKeepingKeySpace.AccountInfo (
  Name text,
  Identification text,
  SchemeName text
);

CREATE TABLE PositionKeeping (
  CreditDebtIndicator text,
  Type text,
  DateTime timestamp,
  Amount_Amount double,
  Amount_Currency_code text,
  Amount_Currency_description text,
  CreditLine_Type text,
  AccountId text,
  CreditLine_Included boolean,																																																																																																																																																																																																																																																																																					
  Credit_Line_Amount double,
  Credit_line_Currency_code  text,
  PRIMARY KEY (AccountId, Amount_Currency_code, Credit_line_Currency_code )
)
WITH CLUSTERING ORDER BY (Amount_Currency_code ASC, Credit_line_Currency_code  ASC);

CREATE INDEX accountid_pk ON PositionKeepingKeySpace.PositionKeeping (AccountId);
