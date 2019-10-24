library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult is
port(
  a: in std_logic_vector(15 downto 0);
  b: in std_logic_vector(15 downto 0);
  cout: out std_logic;
  q: out std_logic_vector(15 downto 0));
end mult;

architecture calc of mult is
  signal total: std_logic_vector(31 downto 0);
  signal res: std_logic_vector(15 downto 0);
  signal sobra: std_logic_vector(15 downto 0);
begin
  process(a, b)
    begin
      res <= total(15 downto 0);
      sobra <= total(31 downto 16);
      total <= std_logic_vector(signed(a) * signed(b));
      q <= res;
      if(sobra = "0000000000000000") then
        cout <= '0';
      else
        cout <= '1';
      end if;
  end process;
end calc;
