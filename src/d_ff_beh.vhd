--
-- VHDL Architecture AME_Frequenzzaehler_lib.d_ff.beh
--
-- Created:
--          by - abeer.UNKNOWN (IMES17)
--          at - 15:11:08 19.12.2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.1 (Build 8)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY d_ff IS
  port(
    clk : in std_logic;
    en  : in std_logic;
    d   : in std_logic;
    q   : out std_logic;
    nq  : out std_logic
  );
    
END ENTITY d_ff;

--
ARCHITECTURE beh OF d_ff IS
  
BEGIN
  
  process(clk)
    begin
      if rising_edge(clk) then
        if en = '1' then
          q <= d;
          nq <= not d;
         end if;
      end if;
    end process;
END ARCHITECTURE beh;

