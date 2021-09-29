ans=""
read x

while [[ $x != "q" ]]
do
ans+="$x"
read x
done

echo "$ans"
