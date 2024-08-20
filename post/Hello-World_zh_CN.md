---
title: Hello World
date: 2021-06-15 00:00:02
banner_img: /img/default.webp
category: Hello
tags: 
  - Moment
  - zh_CN
excerpt: 来自未来の自己
---
{% note danger %}
此文件时间过于久远不具备时效性
{% endnote %} 
{% note warning %}
此文件来自过去的时间线  
{% endnote %} 
{% note warning %}
此文件根据记忆所恢复
{% endnote %} 
   
这应该是我能找到的有记录以来最远的时间线，21年的自己应该很难想象现在的我在干什么）虽然当时的文件不是用 MarkDown 写的，但是从这一天启往后发生的事情我都会用 Blog 的形式复原。给自己留下一个完整的故事线，那么"今天"就是梦开始的地方。

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
        const startDate = "2021-06-15T00:00:00";
        const timeElapsedElement = document.getElementById("time-elapsed");

        // 更新元素内容的函数
        const updateTimeElapsed = updateElement(timeElapsedElement);

        // 初始化调用，显示初始值
        updateTimeElapsed(`故事已经开始了 ${calculateElapsedTime(startDate)}`);

        // 1s更新一次显示的时间
        setInterval(() => {
            updateTimeElapsed(`故事已经开始了 ${calculateElapsedTime(startDate)}`);
        }, 1000);
    });
</script>