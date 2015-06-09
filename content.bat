#!/bin/bash
#TO SCRIPT POU THA DIMIOURGISEI TO PERIEXOMENO

CURRENT_TIME=$(date +"%x %r %Z")
TIME_STAMP="Generated $CURRENT_TIME, by $USER"

#---------------------
#SYNARTISEIS ARXH
#---------------------

report_uptime () {
	cat <<- _EOF_
<PRE>$(uptime)</PRE>
_EOF_
return
}

report_disk_space () {
	cat <<- _EOF_
<PRE id="space_utilize">$(df -h)</PRE>
_EOF_
return
}

report_home_space () {
	cat <<- _EOF_
<PRE id="home_space">$(du -sh /home/*)</PRE>
_EOF_
return
}

report_ram_stat () {
	cat <<- _EOF_
	<PRE id="ram">$(free -m)</PRE>
_EOF_
return
}

report_ls_stat () {
	cat <<- _EOF_
	<PRE id="ls">$(ls -l ~)</PRE>
_EOF_
return
}

report_ps_com () {
	cat <<- _EOF_
	<PRE id="ps">$(ps -A | tail -25)</PRE>
_EOF_
return
}

repot_net_stat () {
	cat <<- _EOF_
	<PRE id="net">$(netstat | head -55)</PRE>
	_EOF_
}

#---------------------
#SYNARTISEIS TELOS
#---------------------

cat <<  _EOF_
<!DOCTYPE html>
<html>
<head>
    <title>Kedro</title>
    <link href='http://fonts.googleapis.com/css?family=Montserrat+Subrayada:700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Orbitron:400,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="css/layout.css">
</head>
<body>
<header>
<div class="container">
<p id="logo">KEDRO //</p>
<p id="uptime">Uptime: $(uptime) <br/>
                $TIME_STAMP  </p>

<p id="mega">@ $HOSTNAME</p>


<div class="kouti_disk">
<div class="titlos"><p id="titlou">Disk space Utilization</p></div>
$(report_disk_space)
</div>

<div class="kouti_home">
<div class="titlos"><p id="titlou">Home space utilization</p></div>
$(report_home_space)
</div>

<div class="kouti_ram">
<div class="titlos"><p id="titlou">RAM</p></div>
$(report_ram_stat)
</div>

<div class="kouti_ls">
<div class="titlos"><p id="titlou">List of files</p></div>
$(report_ls_stat)
</div>

<div class="kouti_ps">
<div class="titlos"><p id="titlou">Processes</p></div>
$(report_ps_com)
</div>


<div class="kouti_net">
<div class="titlos"><p id="titlou">Network stat</div>
$(repot_net_stat)
</div>
</div>

</header>
<footer>
</footer>
</body>
</html>
_EOF_