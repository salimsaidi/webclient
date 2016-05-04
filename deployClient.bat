call mvn clean package
rmdir /s /q D:\tomcat\apache-tomcat-9.0.0.M4\webapps\spring3-mvc-maven-xml-hello-world-1.0-SNAPSHOT
rm D:\tomcat\apache-tomcat-9.0.0.M4\webapps\spring3-mvc-maven-xml-hello-world-1.0-SNAPSHOT.war
copy target\spring3-mvc-maven-xml-hello-world-1.0-SNAPSHOT.war D:\tomcat\apache-tomcat-9.0.0.M4\webapps\
set /p DUMMY=Hit Enter to coninue...