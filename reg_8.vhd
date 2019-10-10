library IEEE;
use IEEE.std_logic_1164.all;

entity reg8 is
port (
    D: in std_logic_vector(7 downto 0);
    clk, load, reset: in std_logic;
    Q: out  std_logic_vector(15 downto 0) 
);
end reg8;

architecture arq of reg8 is
begin
process (clk, load, reset) is
begin
if (reset = '1') then 
	Q <= "0000000000000000";
elsif (clk'event and clk = '1') then
	if (load = '1') then 
    	Q <= "00000000" & D;
    end if;
end if;
end process;