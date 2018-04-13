#!/usr/bin/env bash
#export LD_LIBRARY_PATH=pwd:$LD_LIBRARY_PATH
module=$1
dataset=$2
developerId=$3
targetId=$4
FEATUREDB=$dataset/FeatureDB
errorProcess()
{
    if [ $1 -ne "0" ]
    then
         curl -s --header "service-param-developerId:$developerId" \
              --header "Content-Type: application/json" \
              -X PUT "http://106.15.45.70:8280/api/dev/targets/$targetId" \
              -d '{"targetStatus":3}'
        exit 1;
    fi
    echo "Video2Image success" ;
}
chooseAlg()
{
   result=$(($1 % 2))
   if [ $result = 1 ]
   then
      echo "bin"
   else
      echo "bin"
   fi
}
alg=`chooseAlg $developerId`
echo "$alg"
cd /usr/local/algComp
export LD_LIBRARY_PATH=/usr/local/algComp/$alg:$LD_LIBRARY_PATH
echo "$LD_LIBRARY_PATH"
if [ ! -f $FEATUREDB ]; then
 ./$alg/train $dataset $module
else
  echo "no action"
fi
ret=$?
errorProcess $ret