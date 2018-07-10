# Three stage pipelined multimedia cell lite unit
## Project Goal
The main goal of our project is to use VHDL , a hardware description language in order 
to design the behavior of a triple stage pipelined multimedia Cell-Lite unit with reduced 
multimedia functions just like how it was done in the Sony Cell SPU architecture. 
The use of cad tools such as a VHDL/Verilog simulator was used to test our results. 
In our case, we used Aldec Active HDL simulator to write and test our code in VHDL.

## Procedure
In order to implement the Three-stage pipelined Cell-lite unit, we first implemented the ALU. 
The ALU consisted of two major sub-modules, each with different functions. 
These modules are the arithmetic module which consist of the adding and subtractions functions 
and the logic and shift module which consist of all the logic and shift operations.  
In order to do the arithmetic module, we needed to create a 16-bit/32-bit arithmetic module 
using a triple level carry look ahead system. We tested our carry-look ahead system using the 
simulation in AHDL. We input values into our registers and using a mux to select whether 
it was addition or subtraction, we tested our CLA. 

![alt text](https://raw.githubusercontent.com/rickyzhangNYC/Three-Staged-Pipelined-Multimedia-Cell-Lite-Unit/master/Images/overviewofstages.png)

##Required OP Code functionality
|OPCODE 3-0 | Description of Instruction Opcode |
| --- | --- |
|0000 |	nop |
|0001 | lv: Load a 8-bit immediate value from the [11:4] instruction field into the every byteof register rd.(This is done by bypassing the ALU’s arithmetic and logical/shift modules. The lv 'execution" takes the same amount of time as all other operations.) |
|0010 | and: bitwise logical and of the contents of registers rs1 and rs2 |
|0011 | or: bitwise logical or of the contents of registers rs1 and rs2 |
|0100 | cnth: count ones in halfwords: the number of 1s in each of the four halfword-slots in register rs1 is computed. If the halfword slot in register rs1 is zero, the result is 0. Each of the results is placed into corresponding 16-bit slot in register rd. (Comments: 4 separate 16-bit halfword values  in each 64-bit register) |
|0101 | clz: count leading zeroes in words: for each of the two 32-bit word slots in register rs1 the number of zero bits to the left of the first “1” is computed. If the word slot in register rs1 is zero, the result is 32. The two results are placed into the corresponding 32-bit word slots in register rd. (Comments: 2 separate 32-bit values in each 64-bit register) |
|0110 | rot: rotate right: the contents of register rs1 are rotated to the right according to the count in the 6 least significant bits (5 to 0) of the contents of register rs2. The result is placed in register rd. If the count is zero, the contents of register rs1 are copied unchanged into register rd. Bits rotated out of the right end of the 64-bit contents of register rs1 are rotated in at the left end. |
|0111 | shlhi: shift left halfword immediate: packed 16-bit halfword shift left logical of the contents of register rs1 by the 4-bit immediate value of instruction field rs2. Each of the results is placed into the corresponding 16-bit slot in register rd. (Comments: 4 separate 16-bit values in each 64-bit register) |
|1000 | a: add word: packed 32-bit unsigned add of the contents of registers rs1 and rs2 (Comments: 2 separate 32-bit values in each 64-bit register) |
|1001 | sfw: subtract from word: (packed) 32-bit unsigned subtract of the contents of registers rs1 and rs2 (Comments: 2 separate 32-bit values in each 64-bit register) |
|1010 | ah: add halfword : (packed) (16-bit) halfword unsigned add of the contents of registers rs1 and rs2 (Comments: 4 separate 16-bit values in each 64-bit register) |
|1011 | sfh: subtract from halfword: (packed) (16-bit) halfword unsigned subtract of the contents of registers rs1 and rs2 |
|1100 | ahs: add halfword saturated: (packed) (16-bit) halfword unsigned add with saturation of the contents of registers rs1 and rs2 |
|1101 | sfhs: subtract from halfword saturated: (packed) (16-bit) unsigned subtract with saturation of the contents of registers rs1 and rs2 |
|1110 | mpyu:  multiply unsigned: the 16 rightmost bits of each of the two 32-bit slots in registers rs1 are multiplied by the 16 rightmost bits of the corresponding 32-bit slots in register rs2, treating both operands as unsigned. The two 32-bit products are placed into the corresponding slots of register rd. (Comments: 2 separate 32-bit values in each 64-bit register) |
|1111 | absdb:  absolute difference of bytes: the contents of each of the eight byte slots in register rs2 is subtracted from the contents of the corresponding byte slot in register rs1. The absolute value of each of the results is placed into the corresponding byte slot in register rd. (Comments: 8 separate 8-bit values in each 64-bit register) |

## Synthesized hardware circuit design:
![alt text](https://raw.githubusercontent.com/rickyzhangNYC/Three-Staged-Pipelined-Multimedia-Cell-Lite-Unit/master/Images/finalcircuit.png)