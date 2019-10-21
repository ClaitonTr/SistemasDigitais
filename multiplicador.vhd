library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult is
port(
  a: in std_logic_vector(15 downto 0);
  b: in std_logic_vector(15 downto 0);
  q: out std_logic_vector(15 downto 0));
end mult;

architecture rtl of mult is
  signal next_state: std_logic_vector(31 downto 0);
  signal state: std_logic_vector(15 downto 0);
begin
    state <= next_state(15 downto 0);
    next_state <= std_logic_vector(signed(a) * signed(b));
    q <= state;
end architecture;
