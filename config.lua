RulePath = "/usr/local/openresty/nginx/conf/waf/wafconf/"
attacklog = "on"
logdir = "/usr/local/openresty/nginx/waflogs/"


AbnormalProxyCheck="on"
--禁止异常代理访问，例如127.0.0.1 以防绕过waf

UrlDeny="on"
--是否拦截url访问

Redirect="on"
--是否拦截后重定向
checkcode_path='/data/web/codeimg'
--需要开启图片验证码时，指定图片存储路径，需要与nginx的配置文件verification_code.conf中指定的路径一致

CookieMatch="on"
--是否拦截cookie攻击

whiteModule="on"
--是否开启URL白名单

Referer="on"
--是否开启防盗链黑白名单,在wafconf的WhiteReferer/BlockReferer配置，referer为空也不会限制

BlockRequestMethod={"TRACE","TRACK","OPTIONS","PUT","PATCH","DELETE","CONNECT"}
--HTTP/HTTPS协议请求方法限制（限制TRACE/TRACK/OPTIONS/PUT/PATCH/DELETE/CONNECT）,不允许未知方法

Bots_check="on"
--针对白名单爬虫user-agent 开启真假验证功能

ContinuousResponseCheck="off"
--是否开启404连续异常响应码检查
ContinuousResponseLimit="20"
--每5分钟，允许多少次异常响应码(排除常见内嵌资源)




white_fileExt={"bmp","jpg","png","tif","gif",
"wps","dps","et","doc","docx","ppt","pptx","xls","xlsx","csv","obt",
"zip","rar","gz","tar","gzip","7z","tgz","tbz","bz2",
"wav","mp3","wma","mmf","amr","aac","flac",
"txt","pdf","yml","yaml","conf","log","rpm"}
--填写可上传的文件后缀类型(不区分大小写)
PostMatch="on"
--是否拦截post攻击【所有post检查的总开关】
FileContentCheck="off"
--是否开启文件内容检查(严格对内容进行webshell/SQL注入等高危函数检查)【post中的小开关，只针对文件上传。开启的前提是PostMatch="on"】


ipWhitelist={"127.0.0.1"}
--ip白名单，多个ip用逗号分隔,
--支持:
--1)范围划分法 "192.168.0.70-192.168.0.99"  
--2)掩码划分法 "192.168.0.0/24"
ipBlocklist={"1.0.0.1"}
--ip黑名单，多个ip用逗号分隔
--支持:
----1)范围划分法 "192.168.0.70-192.168.0.99"  
----2)掩码划分法 "192.168.0.0/24"

whiteHostModule="off"
--是否开启主机(对应nginx里面的server_name)白名单
hostWhiteList = {"blog.whsir.com"}
--server_name白名单，多个用逗号分隔

CCDeny="on"
--是否开启拦截cc攻击(需要nginx.conf的http段增加lua_shared_dict limit 10m;)
SpecialURL={{target_url="/register/index.html",limit_per_min=10},{target_url="/public/login",limit_per_min=6}}
--针对特殊的URL进行每分钟限速频率，需要提供不含参数和协议的URL地址，
--例如：SpecialURL={{target_url="/public/login",limit_per_min=90},{target_url="/register/index.htm",limit_per_min=20}}
urlCCrate="300/60"
-- ip访问特定url频率（次/秒）
ipCCrate="1500/60"
-- 访问ip频次检测（次/秒）,该值应该是urlCCrate的5-20倍左右



SlowDos="on"
--是否开启慢速攻击防护(408)
SlowDosCrate="11/180"
--慢速攻击频率设置，建议3分钟内不超过12


CountryLimit="on"
--否开启IP源的国家限制，黑白名单。国家代码参考[ISO_3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) 
WhiteCountry={"CN"}
--白名单国家，优先级低于"ipBlocklist"。针对内网或无法识别的IP统一进行放行。
BlockCountry={}
--黑名单国家，优先级低于"ipWhitelist"。



FilterID="on"
--数据脱敏：过滤返回的身份证号码(仅支持18位的)
FilterPhoneNumbers="on"
--数据脱敏：过滤返回的手机号
Desensitization_log="on"
--数据脱敏记录日志


html=[[
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网站防火墙</title>
<style>
p {
        line-height:20px;
}
ul{ list-style-type:none;}
li{ list-style-type:none;}
</style>
</head>

<body style=" padding:0; margin:0; font:14px/1.5 Microsoft Yahei, 宋体,sans-serif; color:#555;">

 <div style="margin: 0 auto; width:1000px; padding-top:70px; overflow:hidden;">
  
        <div style="margin: 0 auto; width:1000px; padding-top:70px; overflow:hidden;">
        <div style="margin: 0 auto; width:600px; padding-top:70px; overflow:hidden;">
  <div style="width:600px; float:left;">
    <div style=" height:40px; line-height:40px; color:#fff; font-size:16px; overflow:hidden; background:#6bb3f6; padding-left:20px;">网站防火墙 </div>
    <div style="border:1px dashed #cdcece; border-top:none; font-size:14px; background:#fff; color:#555; line-height:24px;
            height:220px; padding:20px 20px 0 20px; overflow-y:auto;background:#f3f7f9;">
      <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">
<span style=" font-weight:600; color:#fc4f03;">您的请求带有不合法参数，已被网站管理员设置拦截！</span></p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">可能原因：您提交的内容包含危险的攻击请求</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">&emsp;&emsp;&emsp;&emsp;&emsp;%s</p>
<p style=" margin-top:12px; margin-bottom:12px; margin-left:0px; margin-right:0px; -qt-block-indent:1; text-indent:0px;">如何解决：</p>
<ul style="margin-top: 0px; margin-bottom: 0px; margin-left: 0px; margin-right: 0px; -qt-list-indent: 1;">
<li style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-in
dent:0; text-indent:0px;">1）检查提交内容；</li>
<li style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">2）如网站托管，请联系空间提供商；</li>
<li style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">3）普通网站访客，请联系网站管理员；</li></ul>
    </div>
  </div>
</div> </div> </div>
</body></html>
]]


