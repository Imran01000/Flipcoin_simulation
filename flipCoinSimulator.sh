
#!/bin/bash -x
#To find heads or tails.
#variables
head=1;
tail=0;
number=0

#Defining dictionary.
declare -A dictionary;
dictionary=([h]=$count1 [t]=$count0 [hh]=$count11 [tt]=$count00 [ht]=$count10 [th]=$count01);
read -p "How many times flip do you want for singlet?" number 
for((itr=1;itr<=$number;itr++))
do 
	flip=$(($RANDOM%2))
	case $flip in
		1)
		dictionary[h]=$((${dictionary[h]}+1));
		;;
		0)
		dictionary[t]=$((${dictionary[t]}+1));
		;;
	esac
done
for keys in ${!dictionary[@]}
do 
	echo "${keys} : ${dictionary[$keys]}"
done
headPercentage=`echo "scale=3; (${dictionary[h]}*100)/$number" | bc -l`
echo "Percentage for h is : $headPercentage";
tailPercentage=`echo "scale=3; (${dictionary[t]}*100)/$number" | bc -l`
echo "Percentage for t is : $tailPercentage";
	
read -p "How many times flip do you want for doublet?" num
	for((itr=1;itr<=$(($num*2));itr++))
	do
		flip=$(($RANDOM%4))
		case $flip in
      	0)
   		dictionary[hh]=$((${dictionary[hh]}+1))
			;;
			1)
      	dictionary[tt]=$((${dictionary[tt]}+1))
			;;
 			2)  
      	dictionary[ht]=$((${dictionary[ht]}+1))
			;;
			3)
      	dictionary[th]=$((${dictionary[th]}+1))
			;;
   	esac
	done
for keys in ${!dictionary[@]}
do 
   echo "$keys : ${dictionary[$keys]}"
done

percentageOfhh=`echo "scale=3; (${dictionary[hh]}*100)/($num*2)" | bc -l`;
echo "Percentage for hh is : $percentageOfhh"
percentageOftt=`echo "scale=3; (${dictionary[tt]}*100)/($num*2)" | bc -l`;
echo "percentage for tt is : $percentageOftt"
percentageOfht=`echo "scale=3; (${dictionary[ht]}*100)/($num*2)" | bc -l`;
echo "Percentage for ht is : $percentageOfht"
percentageOfth=`echo "scale=3; (${dictionary[th]}*100)/($num*2)" | bc -l`;
echo "Percentage for th is : $percentageOfth"

