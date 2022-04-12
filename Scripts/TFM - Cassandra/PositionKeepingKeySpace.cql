CREATE KEYSPACE PositionKeepingKeySpace 
  WITH REPLICATION = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 1
  }
AND DURABLE_WRITES = true; 

USE PositionKeepingKeySpace;

CREATE TYPE IF NOT EXISTS PositionKeepingKeySpace.Currency (
  Code text,
  Description text
);

CREATE TYPE IF NOT EXISTS PositionKeepingKeySpace.Address (
  PartyId text,
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

CREATE TYPE IF NOT EXISTS PositionKeepingKeySpace.Amount (
  Amount double,
  Currency frozen<Currency>
);

CREATE TYPE IF NOT EXISTS PositionKeepingKeySpace.CreditLine (
  Included text,
  Type text,
  Currency frozen<Currency>,
  Amount double
);

CREATE TABLE PositionKeepingKeySpace.PositionKeepingKeySpace (
  CreditDebtIndicator text,
  AccountId uuid,
  Type text,
  CreditLine frozen<CreditLine>,
  Amount frozen<Amount>,
  DateTime timestamp,
  PRIMARY KEY (AccountId)
);
