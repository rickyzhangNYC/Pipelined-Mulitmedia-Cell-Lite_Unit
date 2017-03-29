-------------------------------------------------------------------------------
--
-- Title       : registerfile_toplevel
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\registerfile_toplevel.vhd
-- Generated   : Wed Dec  7 03:59:54 2016
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
--{entity {registerfile_toplevel} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity registerfile_toplevel is		
	port(
	instruction : in std_logic_vector(15 downto 0);
	rd	: in std_logic_vector(63 downto 0);
	rd_address_writeback : in std_logic_vector(3 downto 0);
	writeback : in std_logic;
	clk : in std_logic;
	rs1, rs2 : out std_logic_vector(63 downto 0);
	op_code : out std_logic_vector(3 downto 0);
	rd_address : out std_logic_vector(3 downto 0);
	reg_port0,reg_port1,reg_port2,reg_port3,reg_port4,reg_port5,reg_port6,reg_port7,reg_port8,
	reg_port9,reg_port10,reg_port11,reg_port12,reg_port13,reg_port14,reg_port15: out std_logic_vector(63 downto 0)
	);
end registerfile_toplevel;

--}} End of automatically maintained section

architecture behavioral of registerfile_toplevel is		

signal rd_addr_sig, rs1_addr_sig, rs2_addr_sig: std_logic_vector(3 downto 0);			
signal op_code_sig : std_logic_vector(3 downto 0);
signal load_enable_sig : std_logic;
signal load_addr_sig : std_logic_vector(3 downto 0);   
signal load_data_v: std_logic_vector(7 downto 0);
begin
	
	op_code <= op_code_sig;
	rd_address <= rd_addr_sig;
	
	decoder : entity regfile_decode 
		port map(instruction => instruction, rd_addr => rd_addr_sig, rs1_addr => rs1_addr_sig,
		rs2_addr => rs2_addr_sig, op_code => op_code_sig);
		
	control : entity register_file_control
		port map(op_code => op_code_sig, rd => rd_addr_sig, 
		rs1 => rs1_addr_sig, rs2 => rs2_addr_sig,
		load_enable => load_enable_sig,
		load_addr => load_addr_sig);
		
	register_file : entity register_file_operations
		port map(rs1_addr => rs1_addr_sig, rs2_addr => rs2_addr_sig, load_data => instruction(11 downto 4),
		load_enable => load_enable_sig, load_addr => load_addr_sig, writeback => writeback,
		rd_address_writeback => rd_address_writeback, rd => rd, rs1 => rs1,
		rs2 => rs2, clk => clk,
		reg_port0 => reg_port0,reg_port1 => reg_port1,reg_port2 => reg_port2,reg_port3 => reg_port3,
		reg_port4 => reg_port4,reg_port5 => reg_port5,reg_port6 => reg_port6,reg_port7 => reg_port7,
		reg_port8 => reg_port8,reg_port9 => reg_port9,reg_port10 => reg_port10,reg_port11 => reg_port11,
		reg_port12 => reg_port12, reg_port13 => reg_port13, reg_port14 => reg_port14,reg_port15 => reg_port15);
		

end behavioral;
