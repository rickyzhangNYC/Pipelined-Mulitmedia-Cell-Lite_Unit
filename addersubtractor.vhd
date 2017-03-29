-------------------------------------------------------------------------------
--
-- Title       : addersubtractor
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\addersubtractor.vhd
-- Generated   : Wed Dec  7 15:49:53 2016
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
--{entity {addersubtractor} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity addersubtractor is 
	port(	
	a: in std_logic_vector (63 downto 0);
	b: in std_logic_vector (63 downto 0);	
	s: out std_logic_vector (63 downto 0); 		
	Carry: out std_logic;	
	addorsub: in std_logic
	);
end addersubtractor;

--}} End of automatically maintained section

architecture behavioral of addersubtractor is
signal b_sig: std_logic_vector(63 downto 0); 
signal c_sig: std_logic;						  
begin
	
	
	u: entity addorsub port map(addorsub => addorsub, i1 => b, c0 => c_sig, o1 => b_sig); 
	u0: entity thirtytwobit_module port map( a => a, b =>b_sig, c0 => c_sig, Carry => Carry, s => s);  

		
			

end behavioral;
