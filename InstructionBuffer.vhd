-------------------------------------------------------------------------------
--
-- Title       : InstructionBuffer
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\InstructionBuffer.vhd
-- Generated   : Wed Dec  7 14:16:19 2016
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
--{entity {InstructionBuffer} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.NUMERIC_STD.ALL;

entity InstructionBuffer is	
	port (
	instruction_din: in std_logic_vector(255 downto 0);
	instruction_load_enable : in std_logic;
	clk : in std_logic;
	instruction_dout : out std_logic_vector(15 downto 0)
	);
end InstructionBuffer;

--}} End of automatically maintained section

architecture behavioral of InstructionBuffer is	

type instruction_buffer is array (0 to 15) of std_logic_vector(15 downto 0);   --16 ,16 bit instructions
begin

	instructions: process(clk)
	variable instruction_buffer_v : instruction_buffer;
	variable program_counter : integer range 0 to 15 := 0;
	begin
	
		if instruction_load_enable = '1' then
			program_counter := 0;
			instruction_buffer_v(0) := instruction_din(255 downto 240);
			instruction_buffer_v(1) := instruction_din(239 downto 224);
			instruction_buffer_v(2) := instruction_din(223 downto 208);
			instruction_buffer_v(3) := instruction_din(207 downto 192);
			instruction_buffer_v(4) := instruction_din(191 downto 176);
			instruction_buffer_v(5) := instruction_din(175 downto 160);
			instruction_buffer_v(6) := instruction_din(159 downto 144);
			instruction_buffer_v(7) := instruction_din(143 downto 128);
			instruction_buffer_v(8) := instruction_din(127 downto 112);
			instruction_buffer_v(9) := instruction_din(111 downto 96);
			instruction_buffer_v(10) := instruction_din(95 downto 80);
			instruction_buffer_v(11) := instruction_din(79 downto 64);
			instruction_buffer_v(12) := instruction_din(63 downto 48);
			instruction_buffer_v(13) := instruction_din(47 downto 32);
			instruction_buffer_v(14) := instruction_din(31 downto 16); 
			instruction_buffer_v(15) := instruction_din(15 downto 0);
		else
			if rising_edge(clk) then
				instruction_dout <= instruction_buffer_v(program_counter);
				if program_counter /= 15 then
					program_counter := program_counter + 1;
				end if;
			end if;
		end if;
		end process;
end behavioral;
