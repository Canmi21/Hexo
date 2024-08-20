---
title: Hello Hexo
date: 2024-07-18 14:37:02
banner_img: /img/default.webp
category: Hello
tags: 
  - Hexo
  - Moment
  - zh_CN
excerpt: 新，新的开始!?
---

今天开始搭这个奇怪的网站，一方面是某些平台不允许发布奇怪的主观内容(x) 另一方面是给自己找个可以记录生活的地方(√) 以后希望能抽空写点东西吧。之前的内容我会想办法从各大平台中搬过来，也算是补齐一段完整的旅程。今天又是一个新的起点呢!?   

另外介绍一下吧(√)   
本网站依赖于Node.js，使用Hexo框架のFluid主题，分布式部署在3个 Github Page 上顺便采用 Cloudflare 作为代理以及全球CDN缓存服务）至于wsm要开验证，那当然是已经被 DDoS 过了哇 (つェ⊂)

获取受信Cookie
{% btn https://Canmi.Xyy, Cookie, title %}

<script type="text/javascript">
  document.addEventListener('DOMContentLoaded', function() {
    // 设置Cookie
    function setCookie(name, value, days) {
      var expires = "";
      if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        expires = "; expires=" + date.toUTCString();
      }
      document.cookie = name + "=" + (value || "")  + expires + "; path=/";
    }

    // 检查Cookie是否已经设置
    function getCookie(name) {
      var nameEQ = name + "=";
      var ca = document.cookie.split(';');
      for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
      }
      return null;
    }

    // 监听按钮事件
    var button = document.querySelector('a[href="https://Canmi.Xyy"]');
    if (button) {
      button.addEventListener('click', function(event) {
        event.preventDefault(); // 阻止默认的跳转行为
        if (!getCookie('skip_challenge')) {
          setCookie('skip_challenge', '1', 30);
          alert('Cookie "skip_challenge" 已设置 Cloudflare 规则，有效期30天');
        } else {
          alert('Cookie "skip_challenge" 已存在');
        }
      });
    }
  });
</script>

<p id="time-elapsed"></p>

<script>
    // 计算经过的时间函数：String -> String
    const calculateElapsedTime = startDate => {
        const start = new Date(startDate);
        const now = new Date();
        const diff = now - start; // 时间差，单位为毫秒

        const years = Math.floor(diff / (1000 * 60 * 60 * 24 * 365));
        const days = Math.floor((diff % (1000 * 60 * 60 * 24 * 365)) / (1000 * 60 * 60 * 24));
        const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((diff % (1000 * 60)) / 1000);

        return `${years}y ${days}d ${hours}h ${minutes}m ${seconds}s`;
    };

    // 更新元素内容的函数：HTMLElement -> String -> ()
    const updateElement = obj => str => obj.innerHTML = str;

    // 页面加载后执行
    document.addEventListener("DOMContentLoaded", () => {
        const startDate = "2024-07-03T15:03:21";
        const timeElapsedElement = document.getElementById("time-elapsed");

        // 更新元素内容的函数
        const updateTimeElapsed = updateElement(timeElapsedElement);

        // 初始化调用，显示初始值
        updateTimeElapsed(`网页已运行 ${calculateElapsedTime(startDate)}`);

        // 1s更新一次显示的时间
        setInterval(() => {
            updateTimeElapsed(`网页已运行 ${calculateElapsedTime(startDate)}`);
        }, 1000);
    });
</script>