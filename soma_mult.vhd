library IEEE;
use IEEE.std_logic_1164.all;

entity calculo is
	port(
    	EN1, EN2: in std_logic_vector(15 downto 0);
        CONTRL: in std_logic;
        CARRY: out std_logic;
        SAIDA: out std_logic_vector(15 downto 0)
    );
end calculo;

architecture comp of calculo is
    component somador_16bits
        port(
            I1, I2: in std_logic_vector(15 downto 0);
            C_in: in std_logic;
            RESULTADO    : out std_logic_vector(15 downto 0);
            C_out      : out std_logic));
    end component;

    component mult
        port(
            a: in std_logic_vector(15 downto 0);
            b: in std_logic_vector(15 downto 0);
            cout: out std_logic;
            q: out std_logic_vector(15 downto 0));
    end component;

    signal int_a, int_b: std_logic_vector(15 downto 0);

begin
    S0: somador_16bits port map(I1 => EN1, I2 => EN2, C_in => '0', C_out => CARRY, RESULTADO => int_a);
    M0: mult port map(a => EN1, b => EN2, cout => CARRY, q => int_b);
    process(CONTRL)
        begin
            if(CONTRL = '0') then
                SAIDA <= int_a;
            elsif(CONTRL = '1') then
            SAIDA <= int_b;
            end if;
    end process;              
end comp;