-------------------------------------------------------------------------------
--
-- Title       : mux14to2
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\mux14to2.vhd
-- Generated   : Tue Dec  6 21:54:38 2016
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
--{entity {mux14to2} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux14to2 is	 
	port(
	in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14: in std_logic_vector(63 downto 0);
	mux_select: in std_logic_vector(3 downto 0);
	o1: out std_logic_vector(63 downto 0);
	writeback: out std_logic
	);
end mux14to2;

--}} End of automatically maintained section

architecture behavioral of mux14to2 is
begin

	
	mux: process (in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,mux_select)
	begin
	if mux_select = "0010" then
		o1 <= in1;				  
		writeback <= '1';
	elsif mux_select = "0011" then
		o1 <= in2;
		writeback <= '1';
	elsif mux_select = "0100" then
		o1 <= in3;
		writeback <= '1';
	elsif mux_select = "0101" then
		o1 <= in4;					 
		writeback <= '1';
	elsif mux_select = "0110" then
		o1 <= in5; 
		writeback <= '1';
	elsif mux_select = "0111" then
		o1 <= in6; 
		writeback <= '1';
	elsif mux_select = "1000" then
		o1 <= in7; 
		writeback <= '1';
	elsif mux_select = "1001" then
		o1 <= in8;		
		writeback <= '1';
	elsif mux_select = "1010" then
		o1 <= in9;	   
		writeback <= '1';
	elsif mux_select = "1011" then
		o1 <= in10;	   
		writeback <= '1';
	elsif mux_select = "1100" then
		o1 <= in11;	  
		writeback <= '1';
	elsif mux_select = "1101" then
		o1 <= in12;	  
		writeback <= '1';
	elsif mux_select = "1110" then
		o1 <= in13;
		writeback <= '1';
	elsif mux_select = "1111" then
		o1 <= in14;		
		writeback <= '1';
	else
		o1 <= (others => '-');
		writeback <= '0';
	end if;
	
	end process;

end behavioral;
