-------------------------------------------------------------------------------
--
-- Title       : and64bit
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\and64bit.vhd
-- Generated   : Mon Dec  5 17:41:48 2016
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
--{entity {and64bit} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity and64bit is
	port(
	rs1: in std_logic_vector(63 downto 0);
	rs2: in std_logic_vector(63 downto 0);
	rd: out std_logic_vector (63 downto 0)
	);
end and64bit;

--}} End of automatically maintained section

architecture behavioral of and64bit is
begin

	  rd <= rs1 and rs2;

end behavioral;
