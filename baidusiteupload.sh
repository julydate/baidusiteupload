#!/usr/bin/env bash

#====================================================
#	Description: Upload site URL to ziyuan.baidu.com
#	Version: 1.0.0
#	Author: Julydate
#	Blog: https://www.julydate.com
#====================================================

echo "========================================================"
echo "#  百度站长平台链接主动提交脚本"
echo "#  version: 1.0.0"
echo "#  about: https://ziyuan.baidu.com/linksubmit/index"
echo "#  made by 七夏浅笑"
echo "========================================================"
echo ""
echo " Usage: bash baidusiteupload.sh {type(url/file)} {domain} {token} {siteMapUrl/siteMapFile}"
echo " Example bash baidusiteupload.sh url www.example.com Ch1a41dcPI9VRu4iYU https://www.example.com/sitemap.xml"
echo ""

type=$1
domain=$2
token=$3
para=$4

if [[ -n $token ]]; then
	if [[ $type = "url" ]]; then
		curl $para | grep "<loc"|sed -e 's/<[^>]*>//g' | awk '{print $1}' > siteurl.txt
		curl -H 'Content-Type:text/plain' --data-binary @siteurl.txt "http://data.zz.baidu.com/urls?site=$domain&token=$token"
	else
		if [[ $type = "file" ]]; then
			curl -H 'Content-Type:text/plain' --data-binary @$para "http://data.zz.baidu.com/urls?site=$domain&token=$token"
		else
			echo "type 有误, 只能为 url 或 file"
		fi
	fi
else
	echo "token 为空"
fi
echo ""