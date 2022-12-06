tiqu_proxy_url=''
test -f /tmp/proxyip || touch /tmp/proxyip
cachedproxyip=$(cat /tmp/proxyip | sed -n 's/[\r]*$//gp')
if [ ! -z ${cachedproxyip} ];
then
	# 不为空, 先测试缓存代理ip是否可用
	r=$(curl  --proxy http://${cachedproxyip} -sI -w "%{http_code}" https://www.baidu.com -o /dev/null)
	if [[ ${r} =~ ^2 ]];
	then
        # 可用
		tiqu_proxy=${cachedproxyip}
        echo ${tiqu_proxy}
	else
		# 不可用, 请求新ip
		tiqu_proxy=$(curl -s ${tiqu_proxy_url})
        echo  ${tiqu_proxy}
		echo  ${tiqu_proxy} > /tmp/proxyip
	fi
else
	# 为空
	tiqu_proxy=$(curl -s ${tiqu_proxy_url})
    echo  ${tiqu_proxy}
	echo ${tiqu_proxy} > /tmp/proxyip
	
fi


