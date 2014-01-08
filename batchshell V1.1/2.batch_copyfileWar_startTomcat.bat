set name_app=cellphoneshop
set name_war=cellphoneshop.war
set root_dir=C:
set tomcat_dir=C:\Program Files\Tomcat\apache-tomcat-7.0.47\apache-tomcat-7.0.47\webapps
set startTomcat_dir=C:\Program Files\Tomcat\apache-tomcat-7.0.47\apache-tomcat-7.0.47\bin\
set nameStart=startup.bat

rmdir /S /Q "%tomcat_dir%\%name_app%"
del /Q "%tomcat_dir%\%name_war%"
cd \
%root_dir%
copy batchshell\source\target\%name_war% "%tomcat_dir%"
echo Nhan Enter De Start ServiceTomcat
pause
%root_dir%
cd %startTomcat_dir%
%nameStart%

