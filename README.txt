# Exercise-2
Basic Linux service setup

Step-1 : Upload the script docker-elastic.sh to the Ubuntu VM
Step-2 : chmod +x docker-elastic.sh to set execution permisions
Step-3 : Run docker-elastic.sh
Step-4 : Sit back relax till the script outputs the elasticsearch container health check


Note: Just in case if the the bash script throws up an error "/bin/bash^M: bad interpreter: No such file or direct"

Kindly run sed -i -e 's/\r$//' docker-elastic.sh

Since the scripts were written in a windows text editor and then saved as bash shell the line ending might differ. 
