-------------------------------------------------------------------------------
--
-- Title       : half_adder_gates
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\half_adder_gates.vhd
-- Generated   : Thu Nov 17 09:55:39 2016
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {half_adder_gates} architecture {half_adder_gates}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity inv is  
	port(
	i1: in std_logic;	
	o1: out std_logic
	);
	
end inv;

--}} End of automatically maintained section

architecture dataflow of inv is
begin
	
	o1 <= not i1;
	 -- enter your statements here --

end dataflow;


library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity or_2 is
	port(
	i1, i2: in std_logic;
	o1: out std_logic);
end or_2;

architecture dataflow of or_2 is
begin
	o1 <= i1 or i2;
end dataflow;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity and_2 is
	port(
	i1, i2: in std_logic;
	o1: out std_logic);
end and_2;

architecture dataflow of and_2 is
begin
	o1 <= i1 and i2;
	
end dataflow;
								 