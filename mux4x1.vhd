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
    process(SEL) is
    begin
      case SEL is
          when "00" => SAIDA <= A;
          when "01" => SAIDA <= B;
          when "10" => SAIDA <= C;
          when "11" => SAIDA <= D;
          when others => SAIDA <= "XXXXXXXXXXXXXXXX";
      end case;
    end process;                    
end selecao;