---
title: MI120 A->C 10G
date: 2024-06-30 23:39:45
banner_img: /img/default.webp
category: XIAOMI
tags: 
  - XIAOMI
  - STM32
  - zh_CN
excerpt: XIAOMI 10G USBA2USBC
---

{% note success %}
此项目为"MI120 AC 10G"的一个 Update
{% endnote %} 
{% note info %}
此项目已经终止，正在计划集成进 Source 端
{% endnote %} 

# MI120 AC 10G
### DEMO
![Front](/img/blog/MI120-AC-2/MI120-AC-F.jpg)
![Bottom](/img/blog/MI120-AC-2/MI120-AC-B.jpg)

### 起因
#### wsm 要做这个东西？
我已经被不只一次问过这个问题了，这个转接头本质就是一根小米 6AのAC 线 + 一个 10GのAC MUX(转接头) 至于上面的芯片呢，那当然是从原装线上面扣的啊。
#### 它能做什么
本质上任意 CC线 + 转接头 = 原装充电线 附赠一个平时作为 10G 双面转接头的属性( )

### 制作
![PCB](/img/blog/MI120-AC-2/MI120-AC-PCB.jpg)
#### 关于它的PCB
这次用了 JLCの3313 6层结构，原因很简单我想白嫖盘中孔( )
![EDA](/img/blog/MI120-AC-2/MI120-AC-F-EDA.png)
可以看到 USBC 上已经被打满了( ) 这种情况下没有塞孔工艺将会导致 USBC 在焊接的时候虚焊、漏锡。
#### SMT
塞孔之后刷锡膏就很平整
![SMT](/img/blog/MI120-AC-2/MI120-AC-SMT.jpg)
#### 人肉贴片机
u1s1，0201 比想象中的大很多( ) 基本属于可以拿捏的范围中，感觉我的极限还是 008004

### 固件
#### 检测思路
{% note info %}
此处借用了他人的示意图
{% endnote %} 
总所周知在 USB PD 下存在两条 CC 那么就得从插入开始讲起
{% fold info @USBC -> USB+PD+Audio %}
#### 插入检测
- Detect attach of USB ports，e.g. a DFP to a UFP   

USBC 物理接口 USB 中存在在 DFP（Downstream Facing Port）为Host端，UFP（Upstream Facing Port）为device端。在DFP的CC pin会有上拉电阻Rp，在UFP会有下拉电阻Rd。在DFP与UFP未连接之前，DFP的VBUS是没有输出的。当DFP与UFP连接后，CC pin相接，DFP的CC pin侦测到UFP pulldown Rd，表示接到Device，DFP便打开VBUS的FET开关，输出VBUS电源给UFP。
![ ](/img/blog/USB/PD/USBC/20210512152120246798.png)
DFP可由CC1与CC2 pin的负载阻抗来判断连接状态，并侦测它是否接到debug or Audio accessory装置
{% note info %}
这也使得 CC1 和 CC2 将会被用于侦测正反插
{% endnote %} 
   
![ ](/img/blog/USB/PD/USBC/2021051215225495565.png)    
   
- Resolve cable orientation and twist connections to establish USB data bus routing   

DFP（Downstream Facing Port）为Host端，UFP（Upstream Facing Port）为device端。在DFP的CC pin会有上拉电阻Rp，在UFP会有下拉电阻Rd。在DFP与UFP未连接之前，DFP的VBUS是没有输出的。当DFP与UFP连接后，CC pin相接，DFP的CC pin侦测到UFP pulldown Rd，表示接到Device，DFP便打开VBUS的FET开关，输出VBUS电源给UFP。
![ ](/img/blog/USB/PD/USBC/20210512152325326856.png)    
   
- Establish DFP and UFP roles between two attached ports   

除了DFP、UFP，Type-C spec还定义了DRP（Dual Role port），DRP可以做为DFP也可以做为UFP，可以供电，也可以受电。当DPR接到UFP装置，DRP会转换为DFP。当DRP接到DFP装置，DRP会转换为UFP。当两个DRP装置接在一起，两个装置会Random地，一方为DFP，一方为UFP。
![ ](/img/blog/USB/PD/USBC/2021051215234454088.png)   
   
- Discover and configure VBUS: USB Type-C Current modes or USB Power Delivery   

下表为Type-C VBUS输出选项，USB 2.0，USB3.1，USB BC1.2是先前USB协会定义的标准，可以跟Type-C兼容。USB Type-C current 1.5A与3A是Type-C所定义的，需要有CC pin来做侦测。USB PD的功能还需要有USB PD Phy chip来完成Protocol沟通，而Protocol信号是载在两端连接的CC pin上。
![ ](/img/blog/USB/PD/USBC/2021051215240143909.png)    
   
Type-C如何去决定要执行那个模式呢？这也需要靠CC pin。先前提到DFP会有上拉电阻Rp，UFP会有下拉电阻Rd，当DFP与UFP相接，CC pin上就会有分压，Rd是固定5.1k，而Rp就会依照DFP的类别，而有不一样的阻值。UFP会monitor CC pin上的分压来知道DFP的VBUS种类。另外DFP也用不同大小的定电流源来供给CC pin，当电流流到uRd，同样可以产生电压，让UFP知道DFP的VBUS模式。
![ ](/img/blog/USB/PD/USBC/20210512152419799503.png)    
   
Type-C spec定义了DFP在不同模式下，在CC pin要供多大的电流或是要用多大的上拉电阻Rp阻值。
![ ](/img/blog/USB/PD/USBC/20210512152438504686.png)    
   
在UFP是由CC pin上的电压，来得知DFP的VBUS输出能力。例如DFP为5V/3A，它可以在CC pin上供330uA的电流，在UFP端的CC pin上就会得到330uA * 5.1k=1.683V，UFP就可以判断
   
DFP为vRd-3.0。或是DFP用一个上拉电阻10K到VBUS，UFP端的CC pin上的电压为
   
5v * 5.1k /（5.1k+10k）=1.688V，UFP一样可以判断DFP为vRd-3.0。
![ ](/img/blog/USB/PD/USBC/20210512152502770860.png)    
   
USB Type C也支持USB PD，而USB PD的Protocol会转为BMC的信号，在CC pin上传输。
![ ](/img/blog/USB/PD/USBC/20210512152519864051.png)    
   
- Configure VCONN   

CC pin有CC1，CC2，当其中1 pin被用来做DFP，UFP之间的连接，另1pin用就来供VCONN。由Figure4.5可以发现，当Cable内将另一个CC pin接一个下拉电阻Ra，这表示这是一条主动式Cable，需要被供电的。DFP侦测到Ra，便会输出VCONN在CC pin，供电给Cable。Ra的阻抗是定义为800ohm ~1200ohm。
- Discover and configure optional Alternate and Accessory modes
   
USB PD的VDM（Vendor defined message）功能，可以让host与device认到对方的ID，而进到alternate mode.，VDM也是透过CC pin来传输的。下面为一个Alternate mode在Dock的例子，system认到dock装置，知道dock有PCIe装置，于是system利用Type-C的SBU1/SBU2、Tx2/Rx2来传输PCIe信号。
   
![ ](/img/blog/USB/PD/USBC/20210512152544309187.png) 

当CC1与CC2 pin上各接一个下拉电阻，阻值≤Ra，这表示system接到了Audio Accessory，system
   
进到accessory mode。如下图，Type C的CC pin接到耳机的DET pin，当耳机插入时，DET pin被拉到low，system进到accessory mode。system需要自动切换Type C上的信号，让DP/DN甩来输出耳机的左右声道。SBU1/SBU2用来作MIC/AGND function，依照system是支持OMTP或CTIA的耳机。
   
![ ](/img/blog/USB/PD/USBC/20210512152602807967.png)
CC Function Table
   
![ ](/img/blog/USB/PD/USBC/20210512152609983993.png)
   
{% endfold %}
#### 判断CC
那么有了下面的思路就会变得非常简单：   
已知小米A口充电头只有一条 CC，那么一下简称"左边的CC"为小米A口的原生CC "右边的两个CC"为转出来的 USBC 母座的 2组CC( ) 实际上这样会导致只有一条 CC 最后会建立确定的 CC 连接用于发送 BMC 协议，那么我们就可以使用左边的 CC 以200ms 切换，轮回连接至右边的 CC，然后使用 MCUのADC 来读取 CC 电压。

#### 判断思路
已知2组 CC 最后会变成 CC+NC 或者 CC+VCONN 在这个例子下，但是这里我不打算做VCONN检测逻辑(个人偏好日常使用带有5A~Emark)，所以只需要考虑如何分辨:
- 0.0~0.3V NC
- 0.4~0.8V VCONN
- 1.2~2.1V CC
- 2.1V+ Unconnected   
   
上面规定了 CC 从 0-3.3V(36kΩ) 或者 0-5V(56kΩ) 上拉下的所有定义情况，所以我们循环扫描的逻辑 200ms 间隔停止的时候，就是 ADC 到当下电压处于 1.2~2.1V 时。此时我们就可以确认 CC 建立了正确的连接。

{% note danger %}
现在看来这也成了本次项目失败的一个因素
{% endnote %} 

#### 特性分析
为什么这么说呢，那是因为小米的A口充电头本来就不属于标准 PD，他是使用的 A口的 Pin:5 作为一条无法改变的 CC 通道(A口不支持正反插)，至于为 Emark(电子标签) 服务的 VCONN 呢? 那当然是砍掉了，取而代之的是一个全新的魔改标签，因为失去了 VCONN 供电，所以该方案从 VBUS 上直接取电，但是我觉得他严格意义上来说已经不能叫做标签了，应该称为寄存器。小米私有寄存器的内部包含了完整的 LDO+ROM+SOP+ID 采用 USON-8(DFN-8) 封装(2024.3) 后续新版的AC线改成了 DFN-8(2*2mm) 我选择的是老版的( )   
   
就像图上这个印着小米 Logo 的定制芯片：
![Bottom](/img/blog/MI120-AC-2/MI120-AC-B.jpg)

#### 魔改代价
那么这么做的代价是什么呢，答案是融合了 A口的工作逻辑以及协议 + C口的工作逻辑但是不包含翻转的环节，只用于 PD 协议。

#### 角色转换
那么既然存在两种工作模式，那么就代表着需要使用特殊的方式来切换，那么小米做的是复位逻辑
具体的操作就是读取 CC 电压：
- 2.1-3.3V USBA Mode
- 1.2-2.1V USBC Mode
- 0.8-1.2V USBC Err
- 0.0-0.8V USBC Reset

#### 复位特性
{% note danger %}
复位将会导致 VBUS 电压归0
{% endnote %} 
这对于本次的项目来说意味着彻底的失败，数字电路于模拟电路的有缺也就体现在这里了，在数字电路下由于复位的时候 MCU 完全离电了，导致我不能对 MCU 执行任何操作。
![XIAOMI Pad5 Pro Mobile](/img/blog/MI120-AC-2/MI120-AC-Test.jpg)
这也就导致了由于硬件电路存在一个下拉电阻，所以可以实现单面转接，但是一但涉及到翻面的时候就会出现我一动 CC 就会导致复位，复位就导致了系统重启、掉电；这期间我无法对 MCU 执行任何操作，无法切换到正确的 CC 上来继续获取电力。

#### 外置供电
那么解决方案很简单，让系统不掉电不就行了(x)
![AC with Large Csys](/img/blog/MI120-AC-2/MI120-AC-Solution.jpg)
的确，通过外挂一个超级大的电容确实可以扛过 0.4s 的复位掉电时间，但是问题是体积呢?

#### 记忆存储
还有一种之前想到的方案，但是很快被我自己否决了：
我有想过因为只有操作 CC 才会导致掉电，那么其实掉电时间我们是可以预知的。换句话说我们可以在掉电前保存当前的 CC 通道状态，然后下次启动的一瞬间就加载，理论上和我模拟方案一样，只要在 10ms 内能够正确连接 CC 就能赶上小米 50ms 的复位 CD。但是另外一个问题就是，你都等你再一次上电的时候再去操作 CC 已经晚了因为等你触发复位后上电，此时协议已经握手完了，然后由于你没有在这个期间内加载好 CC，所以再次上电的时候进入的是小米的 USBA Mode，此时上电的瞬间操作 CC 会导致再次出发复位逻辑，从而陷入死循环... ...

#### 公版特性
还有过一个想法是试试公版 PD 的特性是否在小米魔改 PD 上得到了保留，指上电9s内握手 PD 后可以切换 PDO，角色等待一些列东西，后续就只能切换申请的 PDO 档位了。
![CC Logic](/img/blog/MI120-AC-2/MI120-AC-Test-MIPPS.jpg)
那么就飞线测试了一下，简单来说就是上电前默认 5.1kΩ 下拉这样第一次上电就进入了小米充电头的 USBC PD Mode 可以无痛免去重启，但是很遗憾的是在转接头里面默认加一个 5.1kΩ 下拉会导致 PD Source 进入保护模式。即类似那种单 USBC 转很多接口的线，此时充电头为了保护设备会锁定 PDO -> Vsafe(5V)。这样就导致了提前下拉 5.1kΩ 在接入第二个 Try.sink 设备会导致最大只能获取到 5V@3A(15W) 的档位。以及在面对一个 Try.Sink 设备比如手机，平板或者电脑的时候会触发此类角色转换为 Source 角色，以及顺带触发 OTG 模式，使得这里本来期望的作为受电角色的设备转化为 Host。  

### 总结
那么到这里我已经宣布放弃数字方案实现的转接了，准备转向集成转接头的逻辑电路到 Source 里面，这样可以实现整个系统不会因为充电头本来的 Vout 被复位而导致的系统 Vsys 断电。