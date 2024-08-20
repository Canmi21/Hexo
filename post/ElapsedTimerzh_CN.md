---
title: Elapsed Timer
date: 2024-07-20 20:34:21
banner_img: /img/default.webp
category: Code
tags: 
  - Code
  - Github
  - OpenSource
  - JavaScript
  - zh_CN
excerpt: 基于JS的简易计时器
---

# 随手写的通过JS实现的计时器
   
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
        const startDate = "2024-07-20T20:34:21";
        const timeElapsedElement = document.getElementById("time-elapsed");

        // 更新元素内容的函数
        const updateTimeElapsed = updateElement(timeElapsedElement);

        // 初始化调用，显示初始值
        updateTimeElapsed(`实现了=> 时间已经过去了 ${calculateElapsedTime(startDate)}`);

        // 1s更新一次显示的时间
        setInterval(() => {
            updateTimeElapsed(`实现了=> 时间已经过去了 ${calculateElapsedTime(startDate)}`);
        }, 1000);
    });
</script>

   
```javascript
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
        const startDate = "2024-07-20T20:34:21";
        const timeElapsedElement = document.getElementById("time-elapsed");

        // 更新元素内容的函数
        const updateTimeElapsed = updateElement(timeElapsedElement);

        // 初始化调用，显示初始值
        updateTimeElapsed(`时间已经过去了 ${calculateElapsedTime(startDate)}`);

        // 1s更新一次显示的时间
        setInterval(() => {
            updateTimeElapsed(`时间已经过去了 ${calculateElapsedTime(startDate)}`);
        }, 1000);
    });
</script>
```
   
## 工作原理
### 计算时间差
首先这段JS的本质是一个计算时间差, "calculateElapsedTime" 函数接收一个日期字符串作为参数，这个日期表示计时的开始时间。它首先将这个字符串转换成 Date 对象。然后，通过当前时间与开始时间的差值（以毫秒为单位），计算出经过的年数、天数、小时数、分钟数和秒数。
```javascript
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
```
### 更新此元素
更新网页元素内容的实现通过了 updateElement 函数接收一个 HTMLElement 对象，并返回另一个函数，这个返回的函数可以接受一个字符串并将其设置为传入的元素的 innerHTML。
```javascript
// 更新元素内容的函数：HTMLElement -> String -> ()
const updateElement = obj => str => obj.innerHTML = str;
```
### 刷新该元素
最后在页面加载后的执行 DOMContentLoaded 事件中（即所有DOM元素都已加载完成后），代码设置了开始日期 startDate，并获取了页面中的元素。然后，使用 updateElement 函数创建了 updateTimeElapsed 函数，该函数可以更新时间显示。
```javascript
// 页面加载后执行
document.addEventListener("DOMContentLoaded", () => {
    const startDate = "2024-07-20T20:34:21";
    const timeElapsedElement = document.getElementById("time-elapsed");

    // 更新元素内容的函数
    const updateTimeElapsed = updateElement(timeElapsedElement);

    // 初始化调用，显示初始值
    updateTimeElapsed(`时间已经过去了 ${calculateElapsedTime(startDate)}`);

    // 1s更新一次显示的时间
    setInterval(() => {
        updateTimeElapsed(`时间已经过去了 ${calculateElapsedTime(startDate)}`);
    }, 1000);
});
```
   
## 修正经历
### 初版思路
可以看到这里其实缺少了对于年份的统计，理论上这种方法也适用于时间轴不长的天数统计。但是在 days 的值中如果超过 356(366) 会看起来很奇怪，特别是用于统计网站的运行时间。
   
```javascript
<p id="time-elapsed"></p>

<script>
    function calculateElapsedTime(startDate) {
        var start = new Date(startDate);
        var now = new Date();
        var diff = now - start; // 时间差，单位为毫秒

        var days = Math.floor(diff / (1000 * 60 * 60 * 24));
        var hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((diff % (1000 * 60)) / 1000);

        return days + "d " + hours + "h " + minutes + "m " + seconds + "s";
    }

    document.addEventListener("DOMContentLoaded", function() {
        var startDate = "2024-07-13T00:00:00";
        var timeElapsedElement = document.getElementById("time-elapsed");
        timeElapsedElement.innerHTML = "网页已运行 " + calculateElapsedTime(startDate);

        setInterval(function() {
            timeElapsedElement.innerHTML = "网页已运行 " + calculateElapsedTime(startDate);
        }, 1000); // 每秒更新一次
    });
</script>
```
### 添加年份
到这里其实代码已经可以跑了，但是似乎某人觉得我写点很烂(Xd)
```javascript
<p id="time-elapsed"></p>

<script>
    function calculateElapsedTime(startDate) {
        var start = new Date(startDate);
        var now = new Date();
        var diff = now - start; // 时间差，单位为毫秒

        var years = Math.floor(diff / (1000 * 60 * 60 * 24 * 365));
        var days = Math.floor((diff % (1000 * 60 * 60 * 24 * 365)) / (1000 * 60 * 60 * 24));
        var hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((diff % (1000 * 60)) / 1000);

        return years + "y " + days + "d " + hours + "h " + minutes + "m " + seconds + "s";
    }

    document.addEventListener("DOMContentLoaded", function() {
        var startDate = "2024-07-03T15:03:00";
        var timeElapsedElement = document.getElementById("time-elapsed");
        timeElapsedElement.innerHTML = "网页已运行 " + calculateElapsedTime(startDate);

        setInterval(function() {
            timeElapsedElement.innerHTML = "网页已运行 " + calculateElapsedTime(startDate);
        }, 1000); // 每秒更新一次
    });
</script>
```
### 组合函数
所以这里改用定义一个组合函数(x)
```javascript
<p id="time-elapsed"></p>

<script>
    // 定义组合函数
    const compose = (f, g) => x => f(g(x));

    // 计算经过的时间
    function calculateElapsedTime(startDate) {
        var start = new Date(startDate);
        var now = new Date();
        var diff = now - start; // 时间差，单位为毫秒

        var years = Math.floor(diff / (1000 * 60 * 60 * 24 * 365));
        var days = Math.floor((diff % (1000 * 60 * 60 * 24 * 365)) / (1000 * 60 * 60 * 24));
        var hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((diff % (1000 * 60)) / 1000);

        return years + "y " + days + "d " + hours + "h " + minutes + "m " + seconds + "s";
    }

    // 页面加载后执行
    document.addEventListener("DOMContentLoaded", function() {
        var startDate = "2024-07-03T15:03:00";
        var timeElapsedElement = document.getElementById("time-elapsed");

        // 组合函数，用于更新页面运行时间
        const updateElapsedTime = compose(() => {
            timeElapsedElement.innerHTML = "网页已运行 " + calculateElapsedTime(startDate);
        }, () => new Date());

        // 初始化调用，显示初始值
        updateElapsedTime();

        // 每秒更新一次显示的时间
        setInterval(updateElapsedTime, 1000);
    });
</script>
```
### 规范函数
u1s1，其实我感觉上面也算某种意义上的"组合函数" 但是为了满足某人的XP，以下使用 f => g => args => f(g(args))
```javascript
<p id="time-elapsed"></p>

<script>
    // 定义组合函数
    const compose = f => g => args => f(g(args));

    // 计算经过的时间
    function calculateElapsedTime(startDate) {
        var start = new Date(startDate);
        var now = new Date();
        var diff = now - start; // 时间差，单位为毫秒

        var years = Math.floor(diff / (1000 * 60 * 60 * 24 * 365));
        var days = Math.floor((diff % (1000 * 60 * 60 * 24 * 365)) / (1000 * 60 * 60 * 24));
        var hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((diff % (1000 * 60)) / 1000);

        return years + "y " + days + "d " + hours + "h " + minutes + "m " + seconds + "s";
    }

    // 页面加载后执行
    document.addEventListener("DOMContentLoaded", function() {
        var startDate = "2024-07-03T15:03:00";
        var timeElapsedElement = document.getElementById("time-elapsed");

        // 组合函数，用于更新页面运行时间
        const updateElapsedTime = compose(timeElapsed => {
            timeElapsedElement.innerHTML = "网页已运行 " + timeElapsed;
        })(() => calculateElapsedTime(startDate));

        // 初始化调用，显示初始值
        updateElapsedTime();

        // 每秒更新一次显示的时间
        setInterval(updateElapsedTime, 1000);
    });
</script>
```
### 规范风格
但是似乎代码的可读性较差，所以可以改成这样：   
使用 calcuateDate 函数规范为 string -> string 然后更新 element.innerHTML    
最后 setInterval(() -> (), 1000) 来完成更新。   
   
那么顺应的写法应该是：
setInterval(() => updateElement(calcuateDate))
```javascript
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
        const startDate = "2024-07-03T15:03:00";
        const timeElapsedElement = document.getElementById("time-elapsed");

        // 更新元素内容的函数
        const updateTimeElapsed = updateElement(timeElapsedElement);

        // 初始化调用，显示初始值
        updateTimeElapsed(`网页已运行 ${calculateElapsedTime(startDate)}`);

        // 每秒更新一次显示的时间
        setInterval(() => {
            updateTimeElapsed(`网页已运行 ${calculateElapsedTime(startDate)}`);
        }, 1000);
    });
</script>
```
updateElement HTMLElement -> string -> ()   
updateElement = obj => str -> obj.innerHTML = str
```javascript
const calculateElapsedTime = startDate => {
    const start = new Date(startDate);
    const now = new Date();
    const diff = now - start;

    const years = Math.floor(diff / (1000 * 60 * 60 * 24 * 365));
    const days = Math.floor((diff % (1000 * 60 * 60 * 24 * 365)) / (1000 * 60 * 60 * 24));
    const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((diff % (1000 * 60)) / 1000);

    return `${years}y ${days}d ${hours}h ${minutes}m ${seconds}s`;
};

```
