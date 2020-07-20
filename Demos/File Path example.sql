DECLARE @Path VARCHAR(200) = 'C:\temp\class\files\demo.sql';

SELECT @Path;

SELECT REVERSE(@Path);

SELECT CHARINDEX('\',REVERSE(@path))

SELECT RIGHT(@Path,CHARINDEX('\',REVERSE(@path)))


SELECT RIGHT(@Path,CHARINDEX('\',REVERSE(@path))-1)