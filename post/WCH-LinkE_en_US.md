---
title: WCH-LinkE
date: 2024-06-02 17:18:01
banner_img: /img/default.webp
category: Debugger
tags: 
  - Debugger
  - Programmer
  - WCH
  - en_US
  - Github
excerpt: USB -> JTAG & SWD for WCH chips
---

{% note info %}
你可以在我的[硬创社](https://x.jlc.com/platform/detail/112563caff0b4e818ca456a768e80dff)浏览中文版本
{% endnote %} 

# WCH-LinkE Rev2.1 06-02-2024
OpenSource (CC BY-NC)
Author: Canmi(21)
## What is the purpose of this?
WCH-LinkE is a multifunctional programmer and debugger designed primarily for WCH microcontrollers. It serves several key purposes:

{% fold info @WCH-LinkE %}
- Programming: The WCH-LinkE is used to program WCH microcontrollers. It supports a variety of microcontroller models, enabling developers to upload their firmware onto the target devices efficiently.

- Debugging: It offers powerful debugging capabilities, including breakpoints, watchpoints, and step-by-step execution. This helps developers identify and fix issues in their code by allowing them to monitor and control the execution of their programs in real-time.

- Compatibility: WCH-LinkE supports multiple debugging interfaces such as JTAG and SWD (Serial Wire Debug), making it a versatile tool for embedded development.

- Integration: It is compatible with popular Integrated Development Environments (IDEs) such as Keil MDK, IAR EWARM, and others, providing a seamless development experience.

- Affordability: As a cost-effective solution, WCH-LinkE is accessible to hobbyists, students, and professionals, making it a popular choice for a wide range of embedded system projects.
{% endfold %}
## Project Attributes
### Layer: 4 JLC3313 0.3/0.45
- L1 1.0oZ 
- L2 0.5oZ 
- L3 0.5oZ 
- L4 1.0oZ 
### EDA: LCEDA PRO (EasyEDA)
- Provide Gerber image for download.

![Front](/img/blog/WCH-LinkE/WCH-LinkE_F.webp)
![Bottom](/img/blog/WCH-LinkE/WCH-LinkE_B.webp)

## What makes it special?
- It is smaller than the original WCH-LinkE.
- It supports switching between JTAG and SWD via touch.
- It supports online firmware upgrades.   
   
![Front](/img/blog/WCH-LinkE/WCH-LinkE_F_D.jpg)
![Bottom](/img/blog/WCH-LinkE/WCH-LinkE_B_D.jpg)

## OpenSource (CC BY-NC)
### SCH [Download](https://github.com/Canmi21/WCH-LinkE/blob/main/SCH_WCH-LinkE_2024-06-04.pdf)
![SCH](/img/blog/WCH-LinkE/SCH_Rev2.1.png)

### iBOM [View](https://github.com/Canmi21/WCH-LinkE/blob/main/WCH-LinkE_2024-6-4.html)
- Go to Github and download it and open the ".html" in your browser.

### Gerber [Download](https://github.com/Canmi21/WCH-LinkE/tree/main/Gerber)

## Upgrade
![Upgrade](/img/blog/WCH-LinkE/WCH-LinkE_Upgrade.jpg)

## WCH-Mode (WinUSB)
![Mode](/img/blog/WCH-LinkE/WCH-LinkE_Mode.jpg)

### Firmware [Download](https://github.com/Canmi21/WCH-LinkE/blob/main/WCH-LinkE-APP-IAP.bin)