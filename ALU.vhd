-------------------------------------------------------------------------------
--
-- Title       : ALU
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\ALU.vhd
-- Generated   : Wed Dec  7 15:44:11 2016
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
--{entity {ALU} architecture {structural}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ALU is	   	 
	port(
	rs1 : in std_logic_vector(63 downto 0);
	rs2 : in std_logic_vector(63 downto 0);
	alu_op : in std_logic_vector(3 downto 0);	  
	rd : out std_logic_vector(63 downto 0);	 
	rd_address_in: in std_logic_vector(3 downto 0);
	rd_address_writeback: out std_logic_vector(3 downto 0);
	writeback: out std_logic
	);
end ALU;

--}} End of automatically maintained section

architecture structural of ALU is	
signal s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14: std_logic_vector(63 downto 0);
begin

	or64: entity or64bit port map(rs1 => rs1, rs2 => rs2, rd => s1);
	and64: entity and64bit port map(rs1 => rs1, rs2 => rs2, rd => s2);
	cnth: entity cnth port map(rs1 => rs1, rd => s3);
	clz: entity clz port map(rs1 => rs1, rd => s4);
	rot: entity rot port map(rs1 => rs1, rs2 => rs2, rd => s5);
	shlhi: entity shlhi port map(rs1 => rs1, rs2 => rs2, rd => s6);
	a: entity a port map(rs1 => rs1, rs2 => rs2, rd => s7);
	sfw: entity sfw port map(rs1 => rs1, rs2 => rs2, rd => s8);
	ah: entity ah port map(rs1 => rs1, rs2 => rs2, rd => s9);
	sfh: entity sfh port map(rs1 => rs1, rs2 => rs2, rd => s10);
	ahs: entity ahs port map(rs1 => rs1, rs2 => rs2, rd => s11);
	sfhs: entity sfhs port map(rs1 => rs1, rs2 => rs2, rd => s12);
	mpyu: entity mpyu port map(rs1 => rs1, rs2 => rs2, rd => s13);
	absdb: entity absdb port map(rs1 => rs1, rs2 => rs2, rd => s14);
	mux_out: entity mux14to2 port map(mux_select => alu_op, in1 => s1, in2 => s2, in3 => s3, in4 => s4, in5 => s5, in6 => s6, in7 => s7, in8 => s8, in9 => s9, in10 => s10, in11 => s11, in12 => s12, in13 => s13, in14 => s14, o1 => rd, writeback => writeback);	
	
	rd_address_writeback <= rd_address_in;

end structural;
