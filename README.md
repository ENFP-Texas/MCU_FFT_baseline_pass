\# MCU 8-point FFT Baseline



本仓库保存数字电路与微处理器系统设计课程设计中 MCU 完成 8 点 FFT 的 baseline 版本。



\## 当前状态



该版本已经完成 FFT 功能正确性验证：



\* 使用 `test\_ROM` 读取 16 个 16-bit 输入数据，包括 8 个复数采样点的实部和虚部。

\* 使用 MCU 指令完成 8 点 FFT 运算。

\* 结果通过 `verify\_RAM` / `verify\_vector\_out` 输出。

\* ILA 中已观察到 `test\_vector\_in` 输入正确、`verify\_vector\_out` 输出正确、`cnt\_test` 正常计数并停止。

\* Python 检查脚本验证结果为 PASS。

\* Vivado 已成功完成 Synthesis、Implementation 和 Generate Bitstream。

\* Timing Summary 中 WNS 为正。



\## 工程环境



\* Vivado Version: 2025.1

\* FPGA Board: K7 / xc7k160t

\* Clock: 50 MHz

\* Main Application: 8-point FFT

\* Test ROM: Distributed Memory Generator IP

\* Test ROM Init File: `mem/test\_vector.coe`

\* Instruction Memory: `mem/instr\_fft8.mem`



\## 目录结构



```text

MCU\_FFT\_baseline\_pass/

├─ src/              # Verilog 源代码

├─ constraints/      # XDC 约束文件

├─ ip/               # Vivado IP 配置文件，例如 test\_rom\_dist.xci

├─ mem/              # 指令和测试向量文件

├─ scripts/          # Python 验证脚本

├─ results/          # ILA 输出、Python 检查结果、截图等

├─ vivado\_project/   # Vivado 工程文件

└─ README.md

```



\## 关键文件说明



\* `src/test\_rom\_ip.v`

&#x20; 外层 `test\_ROM` 包装模块，内部调用 `test\_rom\_dist` ROM IP。



\* `ip/test\_rom\_dist/test\_rom\_dist.xci`

&#x20; Distributed Memory Generator ROM IP 配置文件。



\* `mem/test\_vector.coe`

&#x20; ROM IP 的初始化文件。现场更换测试数据时，需要替换该文件并重新生成 bitstream。



\* `mem/instr\_fft8.mem`

&#x20; MCU 执行 8 点 FFT 的指令存储文件。



\* `results/verify\_output1.txt`

&#x20; 板上 ILA 抓取到的 16 个 FFT 输出结果。



\* `scripts/check\_fft\_output.py`

&#x20; 用于比较板上输出和参考 FFT 结果的 Python 检查脚本。



\## 当前测试输入



```text

0229

02ba

fca5

0024

03c6

027a

00da

03a0

01ba

ff7e

fe3a

0082

fe3c

fd84

0002

fe59

```



\## 当前板上输出



```text

05b5

0889

06b3

0073

f98f

ff67

f541

0315

04a5

0463

06af

0771

0ba3

fc8d

ff19

01f7

```



\## Python 验证方法



在 Windows PowerShell 中进入工程目录：



```powershell

cd E:\\vivado\\MCU

```



运行：



```powershell

python .\\scripts\\check\_fft\_output.py --input .\\mem\\test\_vector.mem --got .\\results\\verify\_output1.txt

```



如果 `python` 不可用，可以尝试：



```powershell

py .\\scripts\\check\_fft\_output.py --input .\\mem\\test\_vector.mem --got .\\results\\verify\_output1.txt

```



预期结果：



```text

Overall: PASS

```



\## 现场更换随机测试数据的方法



1\. 修改 `mem/test\_vector.coe`，填入老师提供的 16 个 16-bit 测试数据。

2\. 在 Vivado 中重新生成 `test\_rom\_dist` IP 的 Output Products。

3\. 重新运行：



&#x20;  \* Run Synthesis

&#x20;  \* Run Implementation

&#x20;  \* Generate Bitstream

4\. Program Device。

5\. 用 ILA 检查：



&#x20;  \* `test\_vector\_in`

&#x20;  \* `verify\_vector\_out`

&#x20;  \* `cnt\_test`

6\. 用 Python 脚本检查结果是否 PASS。



\## 当前版本用途



该版本作为 FFT 赛道 baseline 正确版本，用于后续优化前的备份。后续优化方向包括：



\* 减少 `cnt\_test` 计数值，提高处理速度。

\* 在 WNS 为正的前提下提高工作频率。

\* 减少 LUT 和 FF 使用量，提高硬件效率。

\* 优化 FFT 汇编指令序列。

\* 扩展适合 FFT 的 MCU 指令，但仍保持 FFT 由 MCU 指令完成。



