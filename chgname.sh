content=$1
pat=$2

echo ${content}
echo ${pat}
echo --------------
#a=$(echo ${content} | awk -F$pat '{print "\""$1,$2"\""}')
a=($(echo ${content} | awk -F$pat '{print $1,$2,NF}'))

echo ${#a[@]}
if [ ${#a[@]} -eq 3 ]
then
  echo "mv ${content} ${a[0]}${a[1]}"
else
  echo "error"
fi




