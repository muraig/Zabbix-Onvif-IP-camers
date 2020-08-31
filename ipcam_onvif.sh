#!/bin/sh

####################################################
ADDRESS=$1
PORT=$2
key=$3

username=admin
if [ "$4"  ] ;then password=$4
else password=000000
fi

if [ -z "$1" ] ;    then    echo '$1 bad';    exit;
elif [ -z "$2" ] ;    then    echo '$2 bad';    exit;
elif [ -z "$3" ] ;    then    echo '$3 bad';    exit;
fi

onvif='onvif-cli devicemgmt '$key' --user '$username' --password '$password' --host '$ADDRESS' --port '$PORT
#echo 'onvif= '${onvif}

RET=`$onvif`
echo $RET | sed 's/True: OrderedDict//g'| sed 's/(\[(/{/g' | sed 's/)\])/}/g' | sed "s/', '/\" : \"/g" |sed "s/'/\"/g"| sed 's/"), ("/", "/g'

#./ipcam_onvif.sh 10.10.37.71 80 GetDeviceInformation 123456
