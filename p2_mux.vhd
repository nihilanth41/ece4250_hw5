library ieee;
use ieee.std_logic_1164.all;

entity mux is
  port(sel : in std_logic;
       d1, d2 : in std_logic_vector(7 downto 0);
       x : out std_logic_vector(7 downto 0));
end mux;

architecture mux_arch of mux is
begin
  x <= d2 when (sel='1') else d1;
end mux_arch;
