
#!/bin/bash -x
#To find heads or tails.
#variables
head=1;
tail=0;
number=0;
count=0;
count1=0;
count0=0;
count11=0;
count00=0;
count10=0;
count01=0;
count111=0;
count011=0;
count101=0;
count001=0;
count110=0;
count010=0;
count100=0;
count000=0;
#Defining dictionary.
declare -A dictionary;
dictionary=([h]=$count1 [t]=$count0 [hh]=$count11 [tt]=$count00 [ht]=$count10 [th]=$count01 [hhh]=$count111	[thh]=$count011 [hth]=$count101 [tth]=$count001	[hht]=$count110 [tht]=$count010 [htt]=$count100 [ttt]=$count000	);
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
	for((itr=1;itr<=$(($num));itr++))
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

percentageOfhh=`echo "scale=3; (${dictionary[hh]}*100)/$num" | bc -l`;
echo "Percentage for hh is : $percentageOfhh"
percentageOftt=`echo "scale=3; (${dictionary[tt]}*100)/$num" | bc -l`;
echo "percentage for tt is : $percentageOftt"
percentageOfht=`echo "scale=3; (${dictionary[ht]}*100)/$num" | bc -l`;
echo "Percentage for ht is : $percentageOfht"
percentageOfth=`echo "scale=3; (${dictionary[th]}*100)/$num" | bc -l`;
echo "Percentage for th is : $percentageOfth"

read -p "How many times flip do you want for triplet?" num
   for((itr=1;itr<=$(($num));itr++))
   do
      flip=$(($RANDOM%8))
      case $flip in
         0)
         dictionary[hhh]=$((${dictionary[hhh]}+1))
         ;;
         1)
         dictionary[thh]=$((${dictionary[thh]}+1))
         ;;
         2)  
         dictionary[hth]=$((${dictionary[hth]}+1))
         ;;
         3)
         dictionary[tth]=$((${dictionary[tth]}+1))
         ;;
			4)
         dictionary[hht]=$((${dictionary[hht]}+1))
         ;;
         5)
         dictionary[tht]=$((${dictionary[tht]}+1))
         ;;
         6)  
         dictionary[htt]=$((${dictionary[htt]}+1))
         ;;
         7)
         dictionary[ttt]=$((${dictionary[ttt]}+1))
         ;;

      esac
   done
for keys in ${!dictionary[@]}
do 
   echo "$keys : ${dictionary[$keys]}"
done

percentageOfhhh=`echo "scale=3; (${dictionary[hhh]}*100)/$num" | bc -l`;
echo "Percentage for hhh is : $percentageOfhhh"
percentageOfthh=`echo "scale=3; (${dictionary[thh]}*100)/$num" | bc -l`;
echo "percentage for thh is : $percentageOfthh"
percentageOfhth=`echo "scale=3; (${dictionary[hth]}*100)/$num" | bc -l`;
echo "Percentage for hth is : $percentageOfhth"
percentageOftth=`echo "scale=3; (${dictionary[tth]}*100)/$num" | bc -l`;
echo "Percentage for tth is : $percentageOftth"
percentageOfhht=`echo "scale=3; (${dictionary[hht]}*100)/$num" | bc -l`;
echo "Percentage for hht is : $percentageOfhht"
percentageOftht=`echo "scale=3; (${dictionary[tht]}*100)/$num" | bc -l`;
echo "percentage for tht is : $percentageOftht"
percentageOfhtt=`echo "scale=3; (${dictionary[htt]}*100)/$num" | bc -l`;
echo "Percentage for htt is : $percentageOfhtt"
percentageOfttt=`echo "scale=3; (${dictionary[ttt]}*100)/$num" | bc -l`;
echo "Percentage for ttt is : $percentageOfttt"

for itr in ${dictionary[@]}
do 
	flipArray[((count++))]=$itr;
done
for((itr=0;itr<=13;itr++))
do 
	for((inr=0;inr<=12;inr++))
	do
		if (("${flipArray[$inr]}" > "${flipArray[$(($inr+1))]}"))
		then
				temp="${flipArray[$inr]}";
				flipArray[inr]="${flipArray[inr+1]}";
				flipArray[inr+1]=$temp;
		fi
	done
done
echo ${flipArray[@]}
