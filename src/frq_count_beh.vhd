LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY sig_count IS
  port(
    clk: in std_logic;
    rst: in std_logic;
    en : in std_logic;
    sig: in std_logic;
    frq_count : out std_logic_vector(15 downto 0)
  );
-- Declarations

END sig_count ;

--
ARCHITECTURE beh OF sig_count IS
  
  --Configuration
  constant reg_length : integer range <> := 36; 
  constant offset : unsigned(32 downto 0) := "000110110000000000000000000000000";
  constant incr : unsigned(7 downto 0) := "01101010";
  
  signal s_frq_reg : unsigned(reg_length downto 0); --27 downto 0
  
BEGIN
  
  process(clk)
  variable v_frq_cnt : unsigned(reg_length downto 0) := (others=>'0');
    begin
      if rising_edge(clk) then
        if rst = '0' then
          s_frq_reg <= (others => '0');
				else
          if en = '1' then -- count delta-sigma signal when en = 1
            if sig ='1' then -- increment counter when delta sigma signal = 1
              v_frq_cnt := v_frq_cnt + incr;
					  end if;
					else -- if enable goes off, write counter value in s_frq_reg signal
					 s_frq_reg <= (v_frq_cnt - offset);
           v_frq_cnt := (others=>'0');
					end if;
        end if;
      end if;
    end process;

      frq_count <= std_logic_vector((s_frq_reg(s_frq_reg'high downto (s_frq_reg'high-15))));
      
END ARCHITECTURE beh;