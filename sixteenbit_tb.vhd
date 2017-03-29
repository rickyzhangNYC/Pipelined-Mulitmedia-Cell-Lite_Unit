-------------------------------------------------------------------------------
--
-- Title       : sixteenbit_tb
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\sixteenbit_tb.vhd
-- Generated   : Sun Nov 20 18:23:18 2016
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
--{entity {sixteenbit_tb} architecture {behavior}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;	  
use IEEE.numeric_std.all;

entity sixteenbit_tb is
end sixteenbit_tb;

--}} End of automatically maintained section

architecture behavior of sixteenbit_tb is
signal a_tb, b_tb, sum_tb: std_logic_vector (15 downto 0); 
signal c0: std_logic;
signal Carry_tb: std_logic;
	
begin
	-- Create an instance of the circuit to be tested
	uut: entity sixteenbit_module port map(c0 => c0, a => a_tb, b => b_tb,
	s => sum_tb, Carry => Carry_tb);
	-- Define a process to apply input stimulus and test outputs
	tb : process			  
	variable tempC : std_logic_vector(15 downto 0);
	constant period: time := 20 ns;
	constant n: integer := 16;
	begin -- Apply every possible input combination
		tempC(0) := c0;
		for i in 0 to 2**n-1 loop
			(a_tb, b_tb) <= to_unsigned(i,n); 
			wait for period;
			assert ((sum_tb = ((a(i) xor b(i)) xor tempC(i)))
			)
			report "test failed" severity error;
		end loop;
		wait; -- indefinitely suspend process
	end process;

end behavior;
