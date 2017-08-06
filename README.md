This is an example how to run cron script inside raspberry pi docker container

The app was tested against Raspberry Pi A and Raspberry Pi 2 

* Get Raspberry PI
* Install Jessie image and configure it so that it can connect to the internet
* Update firmware (rpi-update) and software (apt-get update && at-get upgrade)
* Make sure camera module is enabled (raspi-config)
* Install docker
<pre>
$ curl -sSL get.docker.com | sh
$ sudo usermod pi -aG docker
$ reboot
</pre>
        
* Clone this repository
<pre>
$ git clone https://github.com/ChieftainY2k/raspberrypi-cron 
</pre>
 
* Goto repo directory
<pre>
$ cd raspberrypi-cron
</pre>
 
* Build docker image for the "camera" container
<pre>
$ docker build -t cronimage ./docker 
</pre>
 
* Initiate and run cron container
<pre>
$ docker run --detach --restart unless-stopped --name croncontainer cronimage
</pre>
Note: cron container will restart automatically on reboot or failure unless you stop it with the "docker stop" command. 

* Show and follow container logs (press ctrl-c to break)
<pre>
$ docker logs -f croncontainer
</pre>

* Stop the container (may take a while)
<pre>
$ docker stop croncontainer  
</pre>

* Start the stopped cron container
<pre>
$ docker start croncontainer
</pre>

* Attach to container console
<pre>
$ docker attach croncontainer
</pre>

* Kill cron process and remove container
<pre>
$ docker rm -f croncontainer
</pre>

