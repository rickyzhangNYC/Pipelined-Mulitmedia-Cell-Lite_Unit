-------------------------------------------------------------------------------
--
-- Title       : register_file_operations
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\register_file_operations.vhd
-- Generated   : Wed Dec  7 03:45:40 2016
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
--{entity {register_file_operations} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use	IEEE.NUMERIC_STD.ALL;

entity register_file_operations is	   	
	port (
	clk : std_logic;  --clk
	rs1_addr, rs2_addr : in std_logic_vector(3 downto 0); --register addressing
	rs1, rs2: out std_logic_vector(63 downto 0);  --data registers		
	rd: in std_logic_vector(63 downto 0);  --data registers
	load_data : in std_logic_vector(11 downto 4); --8 bit immediate
	load_addr, rd_address_writeback : in std_logic_vector(3 downto 0); --addressing for load and writeback
	load_enable, writeback : in std_logic;		 --enables	  
	reg_port0, reg_port1, reg_port2, reg_port3, reg_port4, reg_port5, reg_port6, reg_port7, reg_port8, reg_port9, 
	reg_port10, reg_port11, reg_port12, reg_port13, reg_port14, reg_port15: out std_logic_vector(63 downto 0)
	);					 
	
end register_file_operations;												

architecture behavioral of register_file_operations is	 
type registers is array (0 to 15) of std_logic_vector(63 downto 0);
begin

	process(rs1, rs2, load_data, rd, load_addr, rd_address_writeback, load_enable, writeback, clk)
	variable registers_updated : registers;	 
	variable load_data_64bit: std_logic_vector(63 downto 0);
	begin 
		
		load_data_64bit(63 downto 56) := load_data;	
		load_data_64bit(55 downto 48) := load_data;	
		load_data_64bit(47 downto 40) := load_data;	 
		load_data_64bit(39 downto 32) := load_data;	
		load_data_64bit(31 downto 24) := load_data;	
		load_data_64bit(23 downto 16) := load_data;	
		load_data_64bit(15 downto 8) := load_data;	
		load_data_64bit(7 downto 0) := load_data;	
		
		rs1 <= registers_updated(to_integer(unsigned(rs1_addr)));
		rs2 <= registers_updated(to_integer(unsigned(rs2_addr)));
																  
		if rising_edge(clk) then   
			if load_enable = '1' then
				registers_updated(to_integer(unsigned(load_addr))) := load_data_64bit;
			end if;	
			if writeback = '1' then
				registers_updated(to_integer(unsigned(rd_address_writeback))) := rd;
			end if;	
		end if;	  
		
		reg_port0 <= registers_updated(0);
		reg_port1 <= registers_updated(1);
		reg_port2 <= registers_updated(2); 
		reg_port3 <= registers_updated(3); 
		reg_port4 <= registers_updated(4);	
		reg_port5 <= registers_updated(5);	
		reg_port6 <= registers_updated(6);
		reg_port7 <= registers_updated(7);
		reg_port8 <= registers_updated(8);
		reg_port9 <= registers_updated(9);
		reg_port10 <= registers_updated(10);
		reg_port11 <= registers_updated(11);
		reg_port12 <= registers_updated(12);
		reg_port13 <= registers_updated(13);
		reg_port14 <= registers_updated(14);  
		reg_port15 <= registers_updated(15);
		
	end process;

end behavioral;
