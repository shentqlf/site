title: 串口
---
* 串口支持：USART1、USART2、USART3、UART4、UART5
* 中断支持：
5个串口的接收中断源 USART_IT_RXNE；当单片机接收到一个字节后会产生一次中断。
5个串口的发送完成中断源USART_IT_TC；当单片机发送完成一个字符串或者缓冲区后产生一次中断。
* 串口1,2,3发送模式采用DMA自动发送模式，大大节省CPU占用。
* 发送缓冲区最大为UART_MAX_SEND_BUF。用户可以根据自己的需要进行配置。默认配置为128.
* 完美支持printf。注意：本文并不是对printf的接收和发送进行了重定义。而是通过其他方法来实现的。
* 暂时不支持remap引脚。
* 默认开启串口接收和发送中断，用户如果不需要可以不绑定相关函数，
* 由于内部串口忙机制基于串口发送完成中断来实现，所以不能在no_interrupt的情况下使用串口发送函数，否则将导致该串口一直处于忙状态。
* 串口中使用了DMA,会是串口发送函数执行为异步模型，当cpu执行完发送函数后，其实并没有真正的执行完串口输出，如果其后续的代码必须要等待串口执行完成才能处理必须要添加等待wait_busy()函数(一般不会使用这种情况)。两个连续的printf不需要用户去处理，内部做好了处理。如果有操作系统的支持，建议用户在两个printf之间加一个系统延时OS_delayTimes(1)，以降低CPU使用率。如果不在乎这点时间也可以不做处理。

## UART类

``` cpp
class Uart:public Print
{
public:
    Uart(USART_TypeDef *USARTx, Gpio *tx_pin, Gpio *rx_pin);

    //initial uart
    void    begin(uint32_t baud_rate,uint8_t _use_dma = 1);
    void    begin(uint32_t baud_rate, uint8_t data_bit, uint8_t parity, float stop_bit,uint8_t _use_dma);

    //write method
    virtual size_t  write(uint8_t c);
    virtual size_t  write(const uint8_t *buffer, size_t size);
    using   Print::write;

    //read method
    uint16_t    read();

    //user addation method
    void    printf(const char *fmt, ...); 
    void    wait_busy();
    /** Attach a function to call whenever a serial interrupt is generated
     *
     *  @param fptr A pointer to a void function, or 0 to set as none
     *  @param type Which serial interrupt to attach the member function to (Seriall::RxIrq for receive, TxIrq for transmit buffer empty)
     */
    //attach user event
}
```
参数 | 描述 | 默认值
--- | --- | ---
`debug` | 开启调试模式。在终端中显示调试信息，并在根目录中存储 `debug.log` 日志文件。| `false`
`safe` | 开启安全模式。不加载任何插件。| `false`
`silent` | 开启安静模式。不在终端中显示任何信息。| `false`
`config` | 指定配置文件的路径。| `_config.yml`

## 载入文件

Hexo 提供了两种方法来载入文件：`load`, `watch`，前者用于载入 `source` 文件夹内的所有文件及主题资源；而后者除了执行 `load` 以外，还会继续监视文件变动。

这两个方法实际上所做的，就是载入文件列表，并把文件传给相对应的处理器（Processor），当文件全部处理完毕后，就执行生成器（Generator）来建立路由。

``` js
hexo.load().then(function(){
  // ...
});

hexo.watch().then(function(){
  // 之后可以调用 hexo.unwatch()，停止监视文件
});
```

## 执行指令

您可以通过 `call` 方法来调用控制台（Console），第一个参数是控制台的名称，而第二个参数是选项——根据不同控制台有所不同。

``` js
hexo.call('generate', {}).then(function(){
  // ...
});
```

## 结束

当指令完毕后，请执行 `exit` 方法让 Hexo 退出结束前的准备工作（如存储资料库）。

``` js
hexo.call('generate').then(function(){
  return hexo.exit();
}).catch(function(err){
  return hexo.exit(err);
});
```
