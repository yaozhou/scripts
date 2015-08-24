#!/bin/sh



usage() {
    echo "$0 usage : start config.json | stop "    
}



start() {
    local CONFIG="$1"

    local TOP=`cat $CONFIG | jq .path | tr -d [\"]`
    local NUM=`cat $CONFIG | jq '.sounds | length'`
    
    i=0
    while [ $i -lt $NUM ]
    do
        local name=`cat $CONFIG | jq .sounds | jq .[$i] | jq .name | tr -d [\"]`
        local gap=`cat $CONFIG | jq .sounds | jq .[$i] | jq .gap | tr -d [\"]`
        local off=`cat $CONFIG | jq .sounds | jq .[$i] | jq .off | tr -d [\"]`
        local vol=`cat $CONFIG | jq .sounds | jq .[$i] | jq .volume | tr -d [\"]`

        if [ $off -eq 0 ] ; then
            [ -z "$vol" ] && vol="1"
            
            ./play_single.sh $name $gap $vol &
            echo "play name ($name) gap($gap) vol($vol)"
        fi
        
        i=`expr $i + 1`
    done
}


stop() {
    killall play_single.sh ; 
    killall sleep ; 
    killall play
}

case "$1" in
    "start")
        start $2 ;;
    "stop")
        stop;;
    *)
        usage;;
esac