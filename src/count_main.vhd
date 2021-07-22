--
-- VHDL Architecture AME_Frequenzzaehler_lib.count.main
--
-- Created:
--          by - abeer.UNKNOWN (IMES17)
--          at - 14:08:02 14.11.2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.1 (Build 8)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY count IS
   PORT( 
      clk     : IN     std_logic;
      rst     : IN     std_logic;
      en      : OUT    std_logic
   );

-- Declarations

END count ;

--
ARCHITECTURE main OF count IS
  
  constant clk_count_max : integer := 20**6; -- defines counting timespan, 25**6 = 0,5s ; t = clk_count_max * clk in ns
  
begin
  
  process(clk)
    variable v_clk_count : integer range 0 to clk_count_max := clk_count_max;
    begin
      if rising_edge(clk) then
        if rst = '0' then
          v_clk_count := clk_count_max;
          en <= '0';
        else
          if v_clk_count = 0 then
            en <= '0';
            v_clk_count := clk_count_max;
          else
            v_clk_count := v_clk_count - 1;
            en <= '1';
          end if;
        end if;
      end if;
    end process;
    
  end architecture main;
