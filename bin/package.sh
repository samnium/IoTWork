!#/bin/bash




relname=$(date +%Y%m%d_%H%M%S)
relpackage=iotreader_$relname.tar.gz

currpath=$(pwd)
source=/iot/iotreader
destination=$currpath/releases/iotreader/

echo
echo "Building a IoTWork.Reader release on " $(date)
echo
echo "Version           $relname"
echo "Package           $relpackage"
echo
echo "Current Path      $currpath"
echo "Source            $source"
echo "Destination       $destination"
echo

if [ -a $source ]
then
  mkdir -p $destination
  
  tar cvzf $destination/$relpackage $source 2&> /dev/null

  if [ -a $destination/$relpackage ]
  then
    echo "Built package $relpackage"
    echo "Copied at $destination/$relpackage"
    echo
  fi

fi

