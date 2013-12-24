rmdir /S /Q "C:\Program Files\Tomcat\apache-tomcat-7.0.47\apache-tomcat-7.0.47\webapps\cellphoneshop"
del /Q "C:\Program Files\Tomcat\apache-tomcat-7.0.47\apache-tomcat-7.0.47\webapps\cellphoneshop.war"
cd \
C:
copy batchshell\source\target\cellphoneshop.war "C:\Program Files\Tomcat\apache-tomcat-7.0.47\apache-tomcat-7.0.47\webapps"
echo Nhan Enter De Start ServiceTomcat
pause
C:
cd C:\Program Files\Tomcat\apache-tomcat-7.0.47\apache-tomcat-7.0.47\bin\
startup.bat

