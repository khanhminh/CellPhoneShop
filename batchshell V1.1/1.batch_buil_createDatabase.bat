set root_dir=C:
set mysql_dir=C:\Program Files (x86)\MySQL\MySQL Server 5.5\bin\mysql.exe
set name_db=cellphoneshop.sql
%root_dir%
cd \
cd batchshell
"%mysql_dir%" -u root -p12345 < database\%name_db%
cd source
mvn compile install
pause


