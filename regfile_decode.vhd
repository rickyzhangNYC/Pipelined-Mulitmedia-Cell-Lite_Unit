-------------------------------------------------------------------------------
--
-- Title       : regfile_decode
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\regfile_decode.vhd
-- Generated   : Wed Dec  7 00:53:08 2016
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
--{entity {regfile_decode} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity regfile_decode is	
	port(
	instruction: in std_logic_vector(15 downto 0);
	op_code, rs1_addr, rs2_addr, rd_addr : out std_logic_vector(3 downto 0)
	);
end regfile_decode;

--}} End of automatically maintained section

architecture behavioral of regfile_decode is
begin

	op_code <= instruction(15 downto 12);
	rs2_addr <= instruction(11 downto 8);
	rs1_addr <= instruction(7 downto 4);
	rd_addr <= instruction(3 downto 0);

end behavioral;
