title: ESP32 Bluetooth 
---
ESP32 芯片是集成了 2.4 GHz Wi-Fi 和蓝牙双模的 SoC 方案。之前玩转 ESP8266 芯片的大都是 Wi-Fi 开发者，升级到 ESP32 芯片平台时对 Wi-Fi 部分还比较熟悉操作，但对新增加的蓝牙部分可能还不太了解，所以本文目的就是演示一下，指引想应用 ESP32 芯片蓝牙功能的开发者们该如何入手。

ESP32 芯片的 Wi-Fi 功能本文就略过不提了，直接谈蓝牙部分。ESP32 支持蓝牙 v4.2 的完整标准，包括传统蓝牙 (BR/EDR) 和低功耗蓝牙 (BLE)。
那么怎么来测试蓝牙功能呢？
在我们的 ESP-IDF 1.0 中已经包含了三个 BLE demo，分别是：05_ble_adv、14_gatt_server 和 15_gatt_client。

首先，我们来看第一个 demo：05_ble_adv
这是一个发送广播 (advertising) 的 demo。
进入 ESP-IDF 目录后（请在 github.com/espressif/esp-idf 下载），可以直接执行 make clean 再执行 make。弹出 make menuconfig 的图形用户界面 (GUI) 之后，可打开 BT 选项，如下图所示：

进入 14_gatt_server 的界面，同样可以直接编译，如果弹出 make menuconfig 的 GUI，同样检查一下 BT_ENABLE 的选项，并打开它。有了 05_ble_adv 的 demo 编译和烧录的经验，这个程序很快就能编译好，并且烧录成功。打开串口工具，发现了如下打印：
这个串口的打印，比 05_ble_adv 的 demo 多了一些 CREATE_SERVICE、ADD_CHAR、ADD_DESCR 的字眼，这个很明显就是创建了 GATT 的服务，添加了特性和描述。
此时，我们打开 iPhone 5s 的 LightBlue 软件，可以看到 iPhone 5s 搜索到了设备 ESP_GATTS_DEMO。
（之前已经提过 LightBlue 软件只能记住前一次通过 GATT 读到的设备名称，小编已经连接过一次，所以这里设备名称显示是正确的，否则显示的就是之前保存的名称）

## 原文出处-乐鑫
详细内容请打开原文[点我](http://mp.weixin.qq.com/s/NK47LWu7HAI0wdvt2UluxQ)