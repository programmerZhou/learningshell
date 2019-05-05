#! /usr/bin/bash
projectDir=/home/wen/work/gitproject/YiLuXing
function npminstall() {
    cp package.json package.json.backup 
    sed -i '/taf/d' package.json
    npm install
    mv package.json.backup package.json
}

if [[ $1 == all ]]; then
    savepath=`pwd`
    echo "current path is: $savepath"
    for element in `ls $projectDir`
	do 
		dir_or_file=$projectDir"/"$element
		if [ -d $dir_or_file ] 
		then 
            cd $dir_or_file
            if [ -f "package.json" ]; then 
                npminstall
            fi
        fi
    done 
    cd $savepath
else 
    npminstall 
fi 
