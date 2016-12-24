title: spark board
---
## 概述
SPARK是基于STM32F103C8T6的控制板，作为eBox入门级的控制板，主要起到引导用户熟悉eBox固件库的使用方法。RAM20K，FLASH64K[注解]，他包含了32个数字IO口、10路模拟输入、12路PWM、3个串口、2个SPI、2个I2C、1个USB、1个xdebug（下载调试）所有的接口都以排针的方式引出，方便用户在不同场合的调试使用。
**注解：**STM32F103C8T6的FLASH官方称为64K，其实大小为128K。但是高64K的FLASH不一定保证完全是可用的，可能会出现坏点。
### 引脚示意图
![](http://p1.bpimg.com/567571/481d6e60d6c89d52.png)
![](http://i1.piimg.com/567571/5a269bbf1b1feb0e.png)
## 板载资源
类型|型号
----|----
主控|STM32F103C8T6
按键|一个
网卡|w5500
sd卡|microSD
USB|USB-device
LED|两个
RGB彩色LED|一个
spiFlash|W25Q16
IIC存储器|AT24C02
485总线|MAX3485
CAN总线|TJA1050
光线传感器|光敏电阻
红外发射管|一个
红外接收管|一个
温湿度传感器|DHT11
WIFI|ESP8266模块（ESP-12）
液晶屏|1.8寸SPI接口屏幕
USB-to-serial|CP2102
调试器|Xdebug（jlink-arm-ob）