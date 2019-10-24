-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
entity grupo is
	port(
    	X: in std_logic_vector(7 downto 0);
        LX, LS, LH, H, clk: in std_logic;
        M0, M1, M2: in std_logic_vector(1 downto 0);
        A, B, C: in std_logic_vector(15 downto 0);
      	Resultado: out std_logic_vector(15 downto 0));
end grupo;

architecture esquema of grupo is

	component reg8
    	port(
        	D: in std_logic_vector(7 downto 0);
			clk, load, reset: in std_logic;
			Q: out  std_logic_vector(15 downto 0));
    end component;
    
    component reg16
    	port(
        	D: in std_logic_vector(15 downto 0);
			clk, load, reset: in std_logic;
			Q: out  std_logic_vector(15 downto 0));
    end component;

	component mux
    	port(
        	A, B, C, D: in std_logic_vector(15 downto 0);
        	SEL: in std_logic_vector(1 downto 0);
        	SAIDA: out std_logic_vector(15 downto 0));
    end component;

    component calculo
        port(
            EN1, EN2: in std_logic_vector(15 downto 0);
            CONTRL: in std_logic;
            CARRY: out std_logic;
            SAIDA: out std_logic_vector(15 downto 0));
    end component;
    
	signal s_X, s_H: std_logic_vector(15 downto 0);
	signal s_M0, s_M1, s_M2: std_logic_vector(15 downto 0);
    signal s_Aritm: std_logic_vector(15 downto 0);
    signal cout: std_logic;
    
begin

	RX: reg8 port map(D => X, clk => 'X', load => 'X', reset => '0', Q => s_X);
    IM0: mux port map(A => "XXXXXXXXXXXXXXXX", B => A, C => B, D => C, SEL => "XX", SAIDA => s_M0);
    IM1: mux port map(A => s_M0, B => s_X, C => Resultado, D => s_H, SEL => "XX", SAIDA => s_M1);
    IM2: mux port map(A => s_X, B => s_M0, C => Resultado, D => s_H, SEL => "XX", SAIDA => s_M2);
    ART: calculo port map(EN1 => s_M2, EN2 => s_M1, CONTRL => 'X', CARRY => cout, SAIDA => Resultado);
    RS: reg16 port map(D => s_Aritm, clk => 'X', load => 'X', reset => '0', Q => Resultado);
    RH: reg16 port map(D => s_Aritm, clk => 'X', load => 'X', reset => '0', Q => s_H);
    
end esquema;
    
	
        