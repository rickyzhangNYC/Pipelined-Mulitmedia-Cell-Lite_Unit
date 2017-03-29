-------------------------------------------------------------------------------
--
-- Title       : ID_EXE_Register
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\ID_EXE_Register.vhd
-- Generated   : Wed Dec  7 15:21:24 2016
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
--{entity {ID_EXE_Register} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ID_EXE_Register is 
	port (
	rs1_in, rs2_in : in std_logic_vector(63 downto 0);
	op_code_in : in std_logic_vector(3 downto 0);
	rd_address_in : in std_logic_vector(3 downto 0);	
	rs1_out, rs2_out : out std_logic_vector(63 downto 0);
	op_code_out : out std_logic_vector(3 downto 0);
	rd_address_out : out std_logic_vector(3 downto 0);
	clk : in std_logic
	);
end ID_EXE_Register;
												

architecture behavioral of ID_EXE_Register is
begin
	process	(clk)
	variable rs1_in_reg, rs2_in_reg : std_logic_vector(63 downto 0);
	variable op_code_in_reg : std_logic_vector(3 downto 0) := "0000";
	variable rd_address_in_reg : std_logic_vector(3 downto 0);
	variable rs1_out_reg, rs2_out_reg : std_logic_vector(63 downto 0);
	variable op_code_out_reg : std_logic_vector(3 downto 0) := "0000";
	variable rd_address_out_reg : std_logic_vector(3 downto 0);
	begin
		if rising_edge(clk) then
			rs1_out_reg := rs1_in_reg;
			rs2_out_reg := rs2_in_reg;
			op_code_out_reg := op_code_in_reg;
			rd_address_out_reg := rd_address_in_reg;		
			rs1_in_reg := rs1_in;
			rs2_in_reg := rs2_in;
			op_code_in_reg := op_code_in;
			rd_address_in_reg := rd_address_in;
		end if;	
	rs1_out <= rs1_out_reg;
	rs2_out <= rs2_out_reg;
	op_code_out <= op_code_out_reg;
	rd_address_out <= rd_address_out_reg;
	end process;
end behavioral;
