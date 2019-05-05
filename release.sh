#! /usr/bin/bash
cd /home/wen/work/gitproject/YiLuXing/Tools
node Command.js --jce
if [[ $? == 0 ]]; then 
    node Command.js --copy
    if [[ $? == 0 ]]; then 
        node Command.js --release 
    fi
fi
cd -