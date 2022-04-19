CREATE KEYSPACE CustomerProfileKeySpace 
  WITH REPLICATION = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 2
  }
AND DURABLE_WRITES = true; 

USE CustomerProfileKeySpace;


CREATE TABLE CustomerProfile (
  PartyId text,
  PartyNumber text,
  PartyType text,
  Name text,
  FullLegalName text,
  LegalStructure text,
  BeneficialOwnership text,
  AccountRole text,
  emailAddress text,
  Phone text,
  Mobile text,
  PRIMARY KEY (PartyId, AccountRole)
)
WITH CLUSTERING ORDER BY (AccountRole ASC);


CREATE TABLE CustomerProfile_Address (
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
  Country_Description text,
  PRIMARY KEY (PartyId, Country_code)
  ) 
WITH CLUSTERING ORDER BY (Country_code ASC);

