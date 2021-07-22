--
-- VHDL Architecture AME_Frequenzzaehler_lib.bin2bcd.beh
--
-- Created:
--          by - abeer.UNKNOWN (IMES17)
--          at - 11:35:05 30.11.2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.1 (Build 8)
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2bcd is
-- declarations
    port ( binin : in  std_logic_vector (15 downto 0);
           ones : out  std_logic_vector (3 downto 0);
           tens : out  std_logic_vector (3 downto 0);
           hundreds : out  std_logic_vector (3 downto 0);
           thousands : out  std_logic_vector (3 downto 0);
           tenthousands : out std_logic_vector(3 downto 0)
          );
end bin2bcd ;

--
architecture beh of bin2bcd is
  
begin

bcd1: process(binin)

  variable temp : std_logic_vector (15 downto 0);
  variable bcd : unsigned (19 downto 0) := (others => '0');

  begin

    bcd := (others => '0');    
    temp(15 downto 0) := binin(15 downto 0);
    
    for i in 0 to 15 loop
      
      if bcd(3 downto 0) > 4 then 
        bcd(3 downto 0) := bcd(3 downto 0) + 3;
      end if;
      
      if bcd(7 downto 4) > 4 then 
        bcd(7 downto 4) := bcd(7 downto 4) + 3;
      end if;
    
      if bcd(11 downto 8) > 4 then  
        bcd(11 downto 8) := bcd(11 downto 8) + 3;
      end if;
      
      if bcd(15 downto 12) > 4 then
        bcd(15 downto 12) := bcd(15 downto 12) + 3;
      end if;
           
      -- shift bcd left by 1 bit, copy msb of temp into lsb of bcd
      bcd := bcd(bcd'high-1 downto bcd'low) & temp(temp'high);
    
      temp := temp(temp'high-1 downto temp'low) & '0';
      
      
    end loop;

 

    -- outputs
    ones <= std_logic_vector(bcd(3 downto 0));
    tens <= std_logic_vector(bcd(7 downto 4));
    hundreds <= std_logic_vector(bcd(11 downto 8));
    thousands <= std_logic_vector(bcd(15 downto 12));
    tenthousands <= std_logic_vector(bcd(19 downto 16));
  end process bcd1;            
  
  
  
END ARCHITECTURE beh;

