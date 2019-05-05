#!/bin/bash 
workpath=/home/wen/work/gitproject/YiLuXing
tafpath=/usr/local/app/taf/tafnode/data
logpath=/usr/local/app/taf/app_log/YiLuXing


function syncfile() {
	for element in `ls $1`
	do 
		dir_or_file=$1"/"$element
		targetpath=$2"/"$element
		if [ -d $dir_or_file ] 
		then 
			if [ "node_modules" == $element ]
			then 
				# echo $dir_or_file 
				# cp $dir_or_file $targetpath
				:
			else 
				syncfile $dir_or_file $targetpath
			fi

		else 
			# echo $dir_or_file 
			# cp $dir_or_file $targetpath
			# echo $dir_or_file $targetpath
			cp $dir_or_file $targetpath
		fi 
	done
}

function getserverdir() {
	for element in `ls $2`
	do 
		dir_or_file=$1"/"$element
		if [ -d $dir_or_file ] 
		then 
			result=$(echo $element |grep Server)
			if [[ "$result" != "" ]] 
			then 
				# echo $element
				# isTestServer=$(echo $element | grep TestServer) 
				# isSiteServer=$(echo $element | grep SiteServer) 
				# isReconServer=$(echo $element | grep ReconServer)
				# isPatchServer=$(echo $element | grep PatchServer)
				# # isKafkaServer=$(echo $element | grep KafkaServer)
				# isCameraServer=$(echo $element | grep CameraServer)
				# isKafkaMessageServer=$(echo $element | grep KafkaMessageServer)
				# isICloudServer=$(echo $element | grep ICloudServer)
				
				
				# if [[ "$isTestServer" != "" ]]; then
				# 	echo "ignore $element "
				# elif [[ "$isSiteServer" != "" ]]; then 
				# 	echo "ignore $element "
				# elif [[ "$isReconServer" != "" ]]; then 
				# 	echo "ignore $element "
				# elif [[ "$isPatchServer" != ""  ]]; then 
				# 	echo "ignore $element "
				# # elif [[ "$isKafkaServer" != ""  ]]; then 
				# # 	echo "ignore $element "
				# elif [[ "$isCameraServer" != ""  ]]; then 
				# 	echo "ignore $element "
				# elif [[ "$isKafkaMessageServer" != ""  ]]; then 
				# 	echo "ignore $element "
				# elif [[ "$isICloudServer" != ""  ]]; then 
				# 	echo "ignore $element "
				# else 

					targetpath=$tafpath"/YiLuXing."$element"/bin"
					syncfile $dir_or_file $targetpath
					# echo $targetpath
				# fi
			fi
		fi
	done 
}

# getdir $workpath
getserverdir $workpath $logpath

		 
