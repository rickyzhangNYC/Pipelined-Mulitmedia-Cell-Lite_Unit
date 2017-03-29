-------------------------------------------------------------------------------
--
-- Title       : register_file_control
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\register_file_control.vhd
-- Generated   : Wed Dec  7 01:59:37 2016
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
--{entity {register_file_control} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.NUMERIC_STD.ALL;

entity register_file_control is	 
	port(
	op_code : in std_logic_vector(3 downto 0);
	rd, rs1, rs2 : in std_logic_vector(3 downto 0);
	load_enable : out std_logic;
	load_addr : out std_logic_vector(3 downto 0) 
	);
end register_file_control;
											  

architecture behavioral of register_file_control is
begin

	 process(op_code, rs1, rs2, rd)
	variable load_enable_v : std_logic := '0';
	variable load_addr_v : std_logic_vector(3 downto 0);  
	variable load_data_v: std_logic_vector (11 downto 4);
	begin	  
		--load logic implementation
		if op_code = "0001" then
			load_enable_v := '1';
			load_addr_v := rd;

		else
			load_enable_v := '0';
		end if;

		load_enable <= load_enable_v;
		load_addr	<= load_addr_v;		   
	end process;

end behavioral;
