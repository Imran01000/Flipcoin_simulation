
#!/bin/bash -x
#To find heads or tails.
#variables
head=1;
tail=0;
count1=0;
count0=0;
#Defining dictionary.
declare -A dictionary;
dictionary=([HEAD]=$count1 [TAIL]=$count0);
#read -p "How many times flip do you wants?" number
function getFlipCoin(){

			flip=$(($RANDOM%2));
			if (($flip==$head))
			then
				echo 1;
			else
				echo 0;
			fi
		
}
read -p "How many times flip do you wants?" number


for((itr=1;itr<=$number;itr++))
do 
	if (("$(getFlipCoin)"==$head))
	then
		dictionary[HEAD]=$((${dictionary[HEAD]}+1));
	else
		dictionary[TAIL]=$((${dictionary[TAIL]}+1));
	fi
done
for keys in ${!dictionary[@]}
do 
	echo "${keys} : ${dictionary[$keys]}"
done
headPercentage=`echo "scale=3; (${dictionary[HEAD]}*100)/$number" | bc -l`
echo $headPercentage;
tailPercentage=`echo "scale=3; (${dictionary[TAIL]}*100)/$number" | bc -l`
echo $tailPercentage;
