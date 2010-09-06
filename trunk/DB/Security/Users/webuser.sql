IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'webuser')
CREATE LOGIN [webuser] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [webuser] FOR LOGIN [webuser] WITH DEFAULT_SCHEMA=[webuser]
GO
DENY ALTER ANY DATABASE DDL TRIGGER TO [webuser]
GRANT CONNECT TO [webuser]
