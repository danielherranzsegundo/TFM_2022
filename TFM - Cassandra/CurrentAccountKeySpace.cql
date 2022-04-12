CREATE KEYSPACE CurrentAccountKeySpace 
  WITH REPLICATION = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 1
  }
AND DURABLE_WRITES = true; 

USE CurrentAccountKeySpace;

CREATE TYPE IF NOT EXISTS CurrentAccountKeySpace.Address (
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

CREATE TYPE IF NOT EXISTS CurrentAccountKeySpace.AccountInfo (
  Name text,
  Identification text,
  SchemeName text
);

CREATE TABLE CurrentAccountKeySpace.CurrentAccount (
  PartyId text,
  AccountId bigint,
  StatusUpdateDateTime timestamp,
  AccountType text,
  NickName text,
  AccountInfo frozen<list<AccountInfo>>,
  OpeningDate timestamp,
  Status text,
  PRIMARY KEY ((AccountId, PartyId), Status)
)
WITH CLUSTERING ORDER BY (Status ASC);
