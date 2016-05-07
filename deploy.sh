mvn clean package
# My tomcat webapps are found at /var/lib/tomcat6/webapps
# The application I wish to deploy is the main (ROOT) application
webapps_dir=/var/lib/tomcat7/webapps
# The application I wish to deploy is the main (ROOT) application
war_app=target/spring3-mvc-maven-xml-hello-world-1.0-SNAPSHOT.war
# The application I wish to deploy is the main (ROOT) application
# Remove existing assets (if any)
rm $webapps_dir/spring3-mvc-maven-xml-hello-world-1.0-SNAPSHOT.war
rm -r $webapps_dir/spring3-mvc-maven-xml-hello-world-1.0-SNAPSHOT
# Copy WAR file into place
cp $war_app $webapps_dir
#Restart tomcat
#service tomcat7 restart