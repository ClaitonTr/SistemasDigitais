library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
	port(

    	A, B, C, D: in std_logic_vector(15 downto 0);
        SEL: in std_logic_vector(1 downto 0);
        SAIDA: out std_logic_vector(15 downto 0)
    );
end mux;

architecture selecao of mux is

	begin
    SAIDA <= A  when (SEL = "00")
			  else B when (SEL = "01") 
			  else C when (SEL = "10") 
			  else D ; 
              
end selecao;