library IEEE;
use IEEE.std_logic_1164.all;

entity reg16 is
port (
    D: in std_logic_vector(15 downto 0);
    clk, load, reset: in std_logic;
    Q: out  std_logic_vector(15 downto 0) 
);
end reg16;

architecture arq of reg16 is
begin
process (clk, load, reset) is
begin
if (reset = '1') then 
	Q <= "0000000000000000";
elsif (clk'event and clk = '1') then
	if (load = '1') then 
    	Q <= D;
    end if;
end if;
end process;