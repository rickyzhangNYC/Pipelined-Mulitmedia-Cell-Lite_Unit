-------------------------------------------------------------------------------
--
-- Title       : Pipelined_CellLite_Unit
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\Pipelined_CellLite_Unit.vhd
-- Generated   : Thu Dec  8 14:09:43 2016
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
--{entity {Pipelined_CellLite_Unit} architecture {structural}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity Pipelined_CellLite_Unit is	
	port(
	full_instruction_data : in std_logic_vector(255 downto 0);
	instruction_load_en : in std_logic;
	clk : in std_logic;								
	reg_port0,reg_port1,reg_port2,reg_port3,reg_port4,reg_port5,reg_port6,reg_port7,reg_port8,
	reg_port9,reg_port10,reg_port11,reg_port12,reg_port13,reg_port14,reg_port15: out std_logic_vector(63 downto 0)
	);
end Pipelined_CellLite_Unit;

--}} End of automatically maintained section

architecture structural of Pipelined_CellLite_Unit is

signal instruction_if_phase, instruction_id_phase : std_logic_vector(15 downto 0);
signal rs1_id_phase, rs2_id_phase : std_logic_vector(63 downto 0);
signal op_code_id_phase, rd_addr_id_phase : std_logic_vector(3 downto 0);
signal rs1_exe_phase, rs2_exe_phase : std_logic_vector(63 downto 0);
signal op_code_exe_phase, rd_address_exe_phase : std_logic_vector(3 downto 0);
signal writeback : std_logic;
signal rd : std_logic_vector(63 downto 0);
signal rd_addr : std_logic_vector(3 downto 0);
begin

	 instruction_buffer : entity InstructionBuffer
		port map(instruction_din => full_instruction_data, instruction_load_enable => instruction_load_en,
		clk => clk, instruction_dout => instruction_if_phase);
		
	IF_ID : entity IF_ID_Register 
		port map(instruction_in => instruction_if_phase, instruction_out => instruction_id_phase, clk => clk);
		
	register_file : entity registerfile_toplevel 
		port map(instruction => instruction_id_phase, rd_address_writeback => rd_addr,
		rd => rd, writeback => writeback, rs1 => rs1_id_phase,
		rs2 => rs2_id_phase, op_code => op_code_id_phase, rd_address => rd_addr_id_phase,
		reg_port0 => reg_port0,reg_port1 => reg_port1,reg_port2 => reg_port2,reg_port3 => reg_port3,
		reg_port4 => reg_port4,reg_port5 => reg_port5,reg_port6 => reg_port6,reg_port7 => reg_port7,
		reg_port8 => reg_port8,reg_port9 => reg_port9,reg_port10 => reg_port10,reg_port11 => reg_port11,
		reg_port12 => reg_port12, reg_port13 => reg_port13, reg_port14 => reg_port14,reg_port15 => reg_port15,
		clk => clk);
	
	ID_EXE : entity ID_EXE_Register
		port map(rs1_in => rs1_id_phase, rs2_in => rs2_id_phase,
		op_code_in => op_code_id_phase, rd_address_in => rd_addr_id_phase, rs1_out => rs1_exe_phase,
		rs2_out => rs2_exe_phase, op_code_out => op_code_exe_phase, rd_address_out => rd_address_exe_phase,
		clk => clk);
		
	multimedia_ALU : entity ALU
		port map(rs1 => rs1_exe_phase, rs2 => rs2_exe_phase, alu_op => op_code_exe_phase,
		rd_address_in => rd_address_exe_phase, writeback => writeback, rd => rd,
		rd_address_writeback => rd_addr);


end structural;
