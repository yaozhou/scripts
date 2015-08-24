#!/bin/sh

OP_TAG=$1
ROM_TAG=$2
RELEASE_NOTE=$3

OP_DIR="/home/eric-zhou/work/mtk-openwrt"
ROM_DIR="/home/eric-zhou/work/mochui-rom"

usage()
{
    echo "$0 tag: op_tag rom_tag release_note : commit tag "
}

tag_process()
{
    local op_tag=$1
    local rom_tag=$2
    local release_note=$3

    if [ -z "$op_tag" -o -z "$rom_tag" -o -z "$release_note" ] ; then
        usage
        exit 1
    fi

    # checkout master
    cd $ROM_DIR
    echo "git checkout master ......."
    git checkout master 1>/dev/null 2>&1
    if [ "$?" != "0" ] ; then
        echo "git checkout master failed"
        exit 1
    fi
    

    # 修改version文件
    echo "modify version file ......"
    local file=m101b.version
    
    sed -ie "/openwrttag/d" $file
    cp -f $file m101c.version
    git add m101b.version
    git add m101c.version

    # 添加release_note
    echo $release_note > releasenote/releasenote_$rom_tag
    git add releasenote/releasenote_$rom_tag
    
    # git commit
    echo "commiting ......"
    #git commit -m "new release tag:$rom_tag"
    if [ "$?" != 0 ] ; then
        echo "git commit failed"
        exit 1
    fi    

    # git tag
    echo "git tag $rom_tag ......"
    #git tag $rom_tag

    if [ "$?" != 0 ] ; then
        echo "git tag $rom_tag failed"
        exit 1
    fi

    # 推送
    echo "git pushing ......"
    #git push
    #git push --tags    
}


case "$1" in
    "tag" )
        tag_process $2 $3 $4 ;;
    * )
    usage;;
esac
