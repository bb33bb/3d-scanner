echo f >> /dev/ttyUSB0 
for ((a=1; a <= 40 ; a++))
do
  echo p >> /dev/ttyUSB0 
  echo r >> /dev/ttyUSB0
  sleep 1
done
