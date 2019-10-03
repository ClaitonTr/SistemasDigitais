library IEEE;
use IEEE.std_logic_1164.all;

entity somador_1bit is
	port(
		
    	A, B, CIN: in std_logic;
        S, COUT: out std_logic
    );
end entity;

architecture soma of somador_1bit is

	begin
    
    	S <= (A xor B) xor CIN;
        COUT <= (A and B) or (A and CIN) or (B and CIN);

    end soma;