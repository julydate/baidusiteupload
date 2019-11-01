# 百度站长平台链接主动提交脚本

## 关于

baidusiteupload.sh Script

关于百度站长平台： https://ziyuan.baidu.com/

为什么要写这个脚本呢，因为本来实在百度站长平台上面提交的 sitemap 的地址等待百度自己抓取的，但是无法控制抓取频次，最主要的是不知道什么的原因，导致百度无法抓取，上面一直是抓取失败。

然后自动推送需要在网页上添加相关代码，但是我不想使用在网站上引入百度相关的代码，然后就只剩主动推送和手动提交的方法了，那肯定弄个自动推送呀，既是实时推送的，又能自己控制频次，所以就随手弄了个这个脚本。

## 用法

```bash
wget --no-chech-certificate https://raw.githubusercontent.com/julydate/baidusiteupload/master/baidusiteupload.sh && chmod baidusiteupload.sh
bash baidusiteupload.sh {type(url/file)} {domain} {token} {siteMapUrl/siteMapFile}
```

type 数据来源类型，只能为 url 或 file

domain 为网站域名，不带 https/http 头，如 www.example.com

token 为百度站长平台网站数据主动提交的 token，参见： https://ziyuan.baidu.com/linksubmit/index

siteMapUrl/siteMapFile 为数据来源：

- 若前面 type 为 url，则此处填写站点 sitemap 的 URL，如 https://www.example.com/sitemap.xml ；

- 若前面 type 为 file，则此处填写站点 URL 的列表文件的名字，如 siteurl.txt

  siteurl.txt 的格式如下，每条链接为一行

```txt
https://www.example.com/tags/index.html
https://www.example.com/categories/index.html
https://www.example.com/post/34476582/
https://www.example.com/post/28305593/
https://www.example.com/post/10359648/
https://www.example.com/post/10408363/
https://www.example.com/post/38162341/
https://www.example.com/post/7716610/
https://www.example.com/post/32984033/
```

## 其它

脚本运行时若 type 为 url，则会在当前目录生成一个 siteurl.txt 文件，这个是提取出的站点 URL 的列表文件，如果已经存在会被覆盖。

另外可以在 crontab 里面设置脚本定期执行，这样就可以实现定期向百度推送链接了

> **注意**：请不要设置太高频次，提交重复链接[会有一定影响](https://ziyuan.baidu.com/college/courseinfo?id=267&page=2#h2_article_title0)
>
>  6，重复提交已经发布的链接会有什么问题？
>
> 答：会有两个影响。第一，将浪费您提交的配额，每个站点每天可提交的数量是有限制的，如果您都提交了旧链接，当有新链接时可能因为配额耗尽无法提交。第二，如果您经常重复提交旧链接，我们会下调您的配额，您可能会失去主动推送功能的权限 

所以感觉这个脚本并没有多大用处quq，为什么我的 sitemap 就用不了呢