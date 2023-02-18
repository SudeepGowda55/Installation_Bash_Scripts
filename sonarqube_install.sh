#!/bin/bash

sudo apt update && sudo apt upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y

sudo apt install openjdk-11-jre -y

sudo apt update

echo "Setup Postgresql Database"

sleep 2

read -p "Have You Installed Postgresql and configured: [y/n] " postgresql_installation 

for (( ;; ))
do
    if [ $postgresql_installation = "y" ]
    then
        sudo apt-get install zip -y
        read -p "Copy and paste the sonarqube download link HERE: " link
        wget $link
        zipfile=$( ls | grep "sonarqube" )
        sudo unzip $zipfile
        sudo mv $zipfile sonarqube
        sudo mv sonarqube /opt/
        sudo groupadd sonar
        sudo useradd -d /opt/sonarqube -g sonar sonar
        sudo chown sonar:sonar /opt/sonarqube -R
        sudo echo -e "#!/bin/bash\nRUN_AS_USER=sonar" >> /opt/sonarqube/bin/linux-x86-64/sonarqube.sh
        sudo cat /opt/sonarqube/bin/linux-x86-64/sonar.sh >> /opt/sonarqube/bin/linux-x86-64/sonarqube.sh
        sudo echo -e "[Unit]\nDescription=SonarQube service\nAfter=syslog.target network.target\n[Service]\nType=forking\nExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start\nExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop\nUser=sonar\nGroup=sonar\nRestart=always\nLimitNOFILE=65536\nLimitNPROC=4096\n[Install]\nWantedBy=multi-user.target" >> /etc/systemd/system/sonar.service 
        for (( ;; ))
        do
            echo "Update few changes in this sonar config file"
            sleep 2
            echo "sonar.jdbc.username=sonar"
            echo "sonar.jdbc.password=sonar_password"
            echo "sonar.jdbc.url=jdbc:postgresql://localhost:5432/sonarqube"
            sleep 2
            sudo nano /opt/sonarqube/conf/sonar.properties
            read -p "Are the changes Done [y/n]: " done
            if [ done = "y" ]
            then
                sudo systemctl enable sonar
                sudo systemctl start sonar
                sudo systemctl status sonar
                sudo echo -e "vm.max_map_count=262144\nfs.file-max=65536\nulimit -n 65536\nulimit -u 4096" >> /etc/sysctl.conf
                sudo reboot
            else 
                echo "Please Update it"
            fi
        done
        exit
    else
        echo "Postgresql Installation and configuration steps"
        echo "Go to official Site for package info, After the installation enter this command in that psql db installed server"
        sleep 3
        echo -e "sudo systemctl enable postgresql\nsudo systemctl start postgresql\nsudo passwd postgres\nsu - postgres\ncreateuser sonar\npsql"
        sleep 1
        read -p "Enter the password You want to add for the sonar user inside psql: " SONAR
        echo -e "Inside the psql console Enter this command\nALTER USER sonar WITH ENCRYPTED password $SONAR;\nCREATE DATABASE sonarqube OWNER sonar;\nGRANT ALL PRIVILEGES ON DATABASE sonarqube to sonar;\n\q"
        sleep 2
        echo "Now re-execute the script"
    fi
done