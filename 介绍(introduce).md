本项目使用verilog语言在quartus平台上实现了AM的解调功能。（This project uses the verilog language to implement the AM demodulation function on the quartus platform.）



# Chinese：

原理：将AM信号进行整流，然后低通滤波就可以得到AM解调波形。其实就是包络检波的原理，非常简单。

AM信号载波是1M，调制信号频率是10K，调制度是100%。

一些说明：我使用的AD芯片是AD9280，8位ADC，它将输入的信号全部转换为正信号，0~127是负信号，128~255是正信号。所以整流操作为：判断，小于128是负信号，然后使用255减去得到整流后的信号，如果大于128就保持不变。

在本项目中调制度是100%，如果调制度不是100%，最后的结果会有直流分量，需要找到并减掉。

实际效果：

![实际效果](E:\项目\FPGA解调AM\实际效果.JPG)

最后如果有什么意见，以及问题可以通过邮箱1977823861@qq.com联系我。谢谢



# English：

Principle: The AM signal is rectified, and then the AM demodulation waveform can be obtained by low-pass filtering. In fact, it is the principle of envelope detection, which is very simple.

The AM signal carrier is 1M, the modulation signal frequency is 10K, and the modulation system is 100%.

Some notes: The AD chip I use is the AD9280, an 8-bit ADC, which converts all the input signals to positive signals, 0~127 is a negative signal, and 128~255 is a positive signal. Therefore, the rectification operation is: judge, less than 128 is a negative signal, and then use 255 to subtract to get the rectified signal, if greater than 128 remains unchanged.

In this project, the adjustment system is 100%, if the adjustment system is not 100%, the final result will have a DC component, which needs to be found and subtracted.

Practical results：

![实际效果](E:\项目\FPGA解调AM\实际效果.JPG)

Finally, if you have any comments and questions, you can contact me by email 1977823861@qq.com. Thank you.