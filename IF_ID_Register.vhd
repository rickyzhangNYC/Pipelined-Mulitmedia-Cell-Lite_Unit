-------------------------------------------------------------------------------
--
-- Title       : IF_ID_Register
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\IF_ID_Register.vhd
-- Generated   : Wed Dec  7 14:30:02 2016
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
--{entity {IF_ID_Register} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IF_ID_Register is	
	port (
	instruction_in : in std_logic_vector(15 downto 0);
	clk : in std_logic;
	instruction_out : out std_logic_vector(15 downto 0)
	);
end IF_ID_Register;
												 

architecture behavioral of IF_ID_Register is
begin

	process(clk)
	variable instruction_in_reg : std_logic_vector(15 downto 0) := "0000000000000000";
	variable instruction_out_reg : std_logic_vector(15 downto 0) := "0000000000000000";
	begin	
		if rising_edge(clk) then
			instruction_out_reg := instruction_in_reg;
			instruction_in_reg := instruction_in;
		end if;
		instruction_out <= instruction_out_reg;
	end process;

end behavioral;
