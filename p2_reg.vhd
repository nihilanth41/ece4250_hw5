library ieee;
use ieee.std_logic_1164.all;

entity reg is
  port(ld, clk : in std_logic;
       d : in std_logic_vector(7 downto 0);
       q : out std_logic_vector(7 downto 0));
end reg;

architecture reg_arch of reg is
  signal qint : std_logic_vector(7 downto 0) := "00000000";
begin
  -- assuming rising edge, and LD is active low 
  process(clk, ld)
  begin
    if(clk'event and clk='1' ) then
      if(ld='0') then
        qint <= d;
      end if;
    end if;
    q <= qint;
  end process;
end reg_arch;
