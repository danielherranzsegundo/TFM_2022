CREATE KEYSPACE CustomerProfileKeySpace 
  WITH REPLICATION = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 1
  }
AND DURABLE_WRITES = true; 

USE CustomerProfileKeySpace;

CREATE TYPE IF NOT EXISTS CustomerProfileKeySpace.Address (
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

CREATE TYPE IF NOT EXISTS CustomerProfileKeySpace.AccountInfo (
  Name text,
  Identification text,
  SchemeName text
);

CREATE TABLE CustomerProfileKeySpace.CustomerProfile (
  PartyId uuid,
  PartyType text,
  Name text,
  FullLegalName text,
  LegalStructure text,
  BeneficialOwnership text,
  AccountRole text,
  emailAddress text,
  Phone text,
  Address frozen<list<Address>>,
  Mobile text,
  PRIMARY KEY (PartyId)
);

CREATE SEARCH INDEX ON CustomerProfileKeySpace.CustomerProfile
  WITH COLUMNS
    PartyId
  AND OPTIONS {reindex: false};
