-- Zachary Rump
-- ECE 4250 HW5
library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;

entity hw5_1 is
  generic (delay: time := 10 ns);
  port(x1, x2, clk : in std_logic;
       z : out std_logic);
end hw5_1;

-- assumptions:
-- state changes occur 10 ns after the falling edge of clk
-- output changes occur 10 ns after the state changes.

architecture hw5_1_arch of hw5_1 is
  signal state, next_state : integer range 1 to 2 := 1;
begin

  -- process for current state and current inputs
  process(state, x1, x2)
    variable input : std_logic_vector(1 downto 0) := "00";
  begin
    Z<='0'; -- default value
    input := (x1&x2);
    -- moore machine: set output depending on current state only 
    -- next state depends on current state and current inputs
    case state is
      when 1 =>
        z <= '0' after delay;
        if(input="00") then
          next_state <= 1;
        else
          next_state <= 2;
        end if;
      when 2 =>
        z <= '1' after delay;
        if(input="01" or input="11") then
          next_state <= 1;
        else
          next_state <= 2;
        end if;
      when others => null;
    end case;
  end process;

  process(clk) -- update other process on clk
  begin
    -- falling edge
    if(clk'event and clk='0') then
      -- state changes occur after delay = 10 ns
      state <= next_state after delay;
    end if;
  end process;
  
end hw5_1_arch;
