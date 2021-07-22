library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity BCD_Decoder is
  port ( BCD_Data: in std_logic_vector(3 downto 0);
			Seg_Display: out std_logic_vector(6 downto 0)	
		 );  
end BCD_Decoder;
 
architecture behaviour of BCD_Decoder is
 
begin
 
  with BCD_Data(3 downto 0) select	
		Seg_Display <= "0000001" when "0000",	-- 0
							"1001111" when "0001",	-- 1
							"0010010" when "0010",	-- 2
							"0000110" when "0011",	-- 3
							"1001100" when "0100",	-- 4
							"0100100" when "0101",	-- 5
							"0100000" when "0110",	-- 6
							"0001111" when "0111",	-- 7
							"0000000" when "1000",	-- 8
							"0000100" when "1001",	-- 9
		--					"0001001" when "1010",	-- N	-- Pseudotetraden
		--					"0000001" when "1011",	-- O
		--					"1110001" when "1100",	-- L
		--					"0001000" when "1101",	-- A
		--					"1000010" when "1110",	-- d
		--					"1111110" when "1111",	-- (-)
							"1111111" when others;
				  
end behaviour;