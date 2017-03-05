library ieee;
use ieee.std_logic_1164.all;

entity reg is
  port(ld, clk : in std_logic;
       d : in std_logic_vector(7 downto 0);
       q : out std_logic_vector(7 downto 0));
end reg;

architecture reg_arch of reg is
begin
  q <= (others => '0'); -- default value
  -- assuming rising edge, and LD is active low 
  process(clk)
  begin
    if(clk'event and clk='1' and ld='0') then
      q <= d;
    end if;
  end process;
end reg_arch;
