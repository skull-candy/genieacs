# A Working tutorial for installing genieacs with GUI on a fresh "Ubuntu Server 18.04.3 LTS"

Follow the steps in the video or follow the steps here :

# 1st Step:
Download Ubuntu Server 18.04.3 LTS and install it on the HDD!
and run:
"Sudo apt-get update"
enter the password to continue
once finished updating run :
"Sudo apt-get upgrade"
This may take a while on your internet and server speeds.
once done reboot by running :
"Sudo reboot"

# 2nd Step :
Copy the script code from https://github.com/skull-candy/genieacs/blob/master/genieacsautoinstallscript.sh
and open your fav. ssh client and connect to your server using the username and password you inserted during installation!

# 3rd Step :
Once Connected run the followings :
"Sudo nano script.sh"
enter the password to continue
right-click or paste in the editor
Press CTRL + O and Press Enter to save the file
then press CTRL + X to exit the editor

# 4th Step:
Once out of the editor run the following command to make it executable :
"chmod +x script.sh" 
and run the script :
"Sudo ./script.sh"
and LET IT FINISH (PRESS Y (Case Sensitive) when prompted during the installation.

# 5th Step: 
Now There Are Two Techniques to Accomplish This Step :
Technique 1 :
Start of the service by running the scripts in the location of the installation folder:
"Sudo /home/**USERNAME**/genieacs-gui/genieacs-start.sh"
 and to stop the service run
"Sudo /home/**USERNAME**/genieacs-gui/genieacs-stop.sh"

Technique 2 :
cd to the folder and run the scripts by :
"cd /genieacs-gui/"
To start the Service 
"sudo ./genieacs-start.sh"
To stop the Service 
"sudo ./genieacs-stop.sh"

# 6th Step:
Open Browser and point to http://ServerIPAddress:3000 to open the GenieASC GUI Dashboard and log in:
by the followings :
Admin login : 
username: admin 
password: admin
User login :
username: user
password: user

# 7th Step:
Now come back to the ssh client and update the following files to display Mikrotik devices related info on our tables and detail view  :
Copy variables from the file https://github.com/skull-candy/genieacs/blob/master/MIKROTIK%20parameters%20for%20genieacs :

Update the index_parameters.yml by running the following :

"Sudo nano genieacs-gui/config/index_parameters.yml"
delete everything you see in the editor by pressing delete or backspace 
now right-click to paste in the editor 
Press CTRL + O and Press Enter to save the file
then press CTRL + X to exit the editor

Update the index_parameters.yml by running the following :

"Sudo nano genieacs-gui/config/summary_parameters.yml"
delete everything you see in the editor by pressing delete or backspace 
now right-click to paste in the editor 
Press CTRL + O and Press Enter to save the file
then press CTRL + X to exit the editor

# 8th Step :
Restart the Service to to apply changes by runing :
Technique 1 :
"sudo /home/**USERNAME**/genieacs-gui/genieacs-stop.sh"
and now run :
"sudo /home/**USERNAME**/genieacs-gui/genieacs-start.sh" to start the service again !

Technique 2 :
cd to the folder and run the scripts :
"cd /genieacs-gui/"
"sudo ./genieacs-stop.sh"
and now run :
"sudo ./genieacs-start.sh"

# 7th Step :
Open Browser and refresh the page or
Point to: http://ServerIPAddress:3000 to open the GenieASC GUI Dashboard and log in:
by the followings :
Admin login : 
username: admin 
password: admin
User login :
username: user
password: user

# 8th Step :
Now enable the TR-096 in the Mikrotik Routers by 
logging into the router via Winbox or ssh or telnet and
run on the TERMINAL the following :
"/tr069-client
set acs-url=http://ServerIPAddress:7547 enabled=yes periodic-inform-interval=30s:"

# 9th Step :
Your router should appear in the GenieASC GUI Dashboard give it some time to update the columns if they are blank or click on "show" then click on refresh to force refresh the columns and retrieve information from the router!


# THE END !!!
# Thank you For Reading And Following!
