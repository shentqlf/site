title: 开始使用eBox
---
此例程向大家展示如何控制spark板上的LED实现闪动。

## 硬件准备
* spark board

## 原理图
分别连接PB8和PB9。可以通过GPIO来控制亮灭，也可以通过TIM4的CH3和CH4通道PWM来控制。在ebox中可以直接调用PWM相关API来控制LED的亮度。
![](http://i1.piimg.com/567571/2e13c1e5fd143223.png)
## 讲解
我们选择控制PB8引脚的LED 1，GPIO当做数字输出IO引脚使用，并且要带有一定的输出电流能力才能驱动LED1发光。所以要把IO设置为OUTPUT_PP模式。当GPIO输出高电平的时候LED1变亮，当PB8输出低电平的时候LED1灭。
通过学习GPIO类我们知道可以控制IO输出的有四种方法。
* set和reset
``` c
PB8.set();
PB8.reset();
```
set和reset的方法是执行效率最高的。建议用户在写驱动代码的时候使用此方法
* write
``` c
PB8.write(1);
PB8.write(0);
```
* toggle翻转
``` c
PB8.toggle();
```
* 另外一种是通过重载操作符的方法
``` c
PB8 = 1;
PB8 = 0;
PB8 = !PB8;
```
## 代码
如何每隔一秒钟变化一次，所以我们要通过delay_ms的功能控制亮灭的时间。
``` c++
#include "ebox.h"
void setup()
{
    ebox_init();//系统初始化
    PB8.mode(OUTPUT_PP);//设置PB8为推挽输出模式
}
int main(void)
{
    setup();
    while(1)
    {
        PB8.set();//设置PB8为高电平
        delay_ms(1000);//延时1s钟
        PB8.reset();//设置PB8为低电平
        delay_ms(1000);//延时1s钟
    }
}
```



