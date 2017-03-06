library ieee;
use ieee.std_logic_1164.all;

entity hw5_2 is
  port(sel, clk, lda, ldb : in std_logic := '0';
       d1_in, d2_in : in std_logic_vector(7 downto 0);
       reg_a, reg_b : out std_logic_vector(7 downto 0));
end hw5_2;

architecture hw5_2_arch of hw5_2 is

  component mux
    port(sel : in std_logic;
         d1, d2 : in std_logic_vector(7 downto 0);
         x : out std_logic_vector(7 downto 0));
  end component;

  component reg
    port(ld, clk : in std_logic;
         d : in std_logic_vector(7 downto 0);
         q : out std_logic_vector(7 downto 0));
  end component;

  -- internal signal for mux output
  signal F,reg_a_int,reg_b_int : std_logic_vector(7 downto 0);
  
  
begin
  M0: mux port map(sel, d1_in, d2_in, F);
  RA: reg port map(lda, clk, F, reg_a_int);
  RB: reg port map(ldb, clk, F, reg_b_int);

  process(clk)
  begin
    if(clk'event and clk='1') then
      reg_a <= reg_a_int;
      reg_b <= reg_b_int;
    end if;
  end process;
  
end hw5_2_arch;

