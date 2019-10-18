# A Working tutorial for installing genieacs with gui on a fresh "Ubuntu Server 18.04.3 LTS"

Folow the steps in the video or folow the steps here :

1st step :
Download Ubuntu Server 18.04.3 LTS and install on the HDD !
and run:
"sudo apt-get update"
enter password to continue
once finshed updating run :
"sudo apt-get upgrade"
This may take a while on your internet and server speeds.
once done reboot by runing :
"sudo reboot"

2nd step :
copy the script code from https://github.com/skull-candy/genieacs/blob/master/genieacsautoinstallscript.sh
and open you fav. ssh client and connect to your server using the username and password you inserted during installation !

3rd Step :
Once Connected run the followings :
"sudo nano script.sh"
enter password to continue
right click or paste in the editor
press CTRL + O and Press Enter 
then press CTRL + X to exit the editor

4th Step:
once out of the editor run the following command to make it executable :
"chmod +x script.sh" 
and run the script :
"sudo ./script.sh"
and LET IT FINISH (PRESS Y (Case Sensitive) when promted during the installation.

5th Step: 
Technique 1 :
Start of the service by runing the scripts in the location of the installation folder:
"sudo /home/**USERNAME**/genieacs-gui/genieacs-start.sh"
 and to stop the service run
"sudo /home/**USERNAME**/genieacs-gui/genieacs-stop.sh"

Technique 2 :
or cd to the folder and run the scripts :
"cd /genieacs-gui/"
To start the Service 
"sudo ./genieacs-start.sh"
To stop the Service 
"sudo ./genieacs-stop.sh"

6th Step:
Open Browser and point to : http://ServerIPAddress:3000 to open the GenieASC GUI Dashboard and login :
by the followings :
Admin login : 
username : admin 
password : admin
User login :
username : user
password : user

7th Step:
Now come back to the ssh client and update the folowing files to display Mikrotik devices related info on our tables and detail veiw  :

Update the index_parameters.yml by runing the following :
"sudo nano genieacs-gui/config/index_parameters.yml"

and paste variables from the file :
