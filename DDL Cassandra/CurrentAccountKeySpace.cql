DROP KEYSPACE IF EXISTS CurrentAccountKeySpace;
	
CREATE KEYSPACE CurrentAccountKeySpace 
  WITH REPLICATION = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 2
  }
AND DURABLE_WRITES = true; 

USE CurrentAccountKeySpace;


CREATE TYPE IF NOT EXISTS CurrentAccountKeySpace.AccountInfo (
  Name text,
  Identification text,
  SchemeName text
);

CREATE TABLE CurrentAccountKeySpace.CurrentAccountbyschemename (
  AccountId text,
  SchemeName text,
  PRIMARY KEY (AccountId, SchemeName)
) WITH CLUSTERING ORDER BY (SchemeName ASC);

CREATE CUSTOM INDEX idx_name ON CurrentAccountKeySpace.CurrentAccountbyschemename (SchemeName) 
USING 'org.apache.cassandra.index.sasi.SASIIndex' 
WITH OPTIONS = {
'mode': 'CONTAINS', 
'analyzer_class': 'org.apache.cassandra.index.sasi.analyzer.NonTokenizingAnalyzer', 
'case_sensitive': 'false'};

CREATE TABLE CurrentAccountKeySpace.CurrentAccount (
  PartyId text,
  AccountId text,
  StatusUpdateDateTime timestamp,
  AccountType text,
  NickName text,
  AccountInfo frozen<list<AccountInfo>>,
  OpeningDate timestamp,
  Status text,
  PRIMARY KEY (AccountId)
) WITH CLUSTERING ORDER BY (Status ASC);
	
CREATE INDEX accountid_ca ON CurrentAccountKeySpace.CurrentAccount (AccountId);

