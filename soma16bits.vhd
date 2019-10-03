library IEEE;
use IEEE.std_logic_1164.all;


entity somador_16bits is
	port(
    	I1, I2: in std_logic_vector(15 downto 0);
        C_in: in std_logic;
        RESULTADO    : out std_logic_vector(15 downto 0);
        C_out      : out std_logic
    );
end entity;



architecture logica of somador_16bits is
	signal c_int: std_logic_vector(15 downto 1);
    
	begin
    
	S0: entity work.somador_1bit port map(A => I1(0), B => I2(0), CIN => C_in, S => RESULTADO(0), COUT => c_int(1));
    S1: entity work.somador_1bit port map(A => I1(1), B => I2(1), CIN => c_int(1), S => RESULTADO(1), COUT => c_int(2));
	S2: entity work.somador_1bit port map(A => I1(2), B => I2(2), CIN => c_int(2), S => RESULTADO(2), COUT => c_int(3));
	S3: entity work.somador_1bit port map(A => I1(3), B => I2(3), CIN => c_int(3), S => RESULTADO(3), COUT => c_int(4));
    S4: entity work.somador_1bit port map(A => I1(4), B => I2(4), CIN => C_int(4), S => RESULTADO(4), COUT => c_int(5));
    S5: entity work.somador_1bit port map(A => I1(5), B => I2(5), CIN => c_int(5), S => RESULTADO(5), COUT => c_int(6));
	S6: entity work.somador_1bit port map(A => I1(6), B => I2(6), CIN => c_int(6), S => RESULTADO(6), COUT => c_int(7));
	S7: entity work.somador_1bit port map(A => I1(7), B => I2(7), CIN => c_int(7), S => RESULTADO(7), COUT => c_int(8));
    S8: entity work.somador_1bit port map(A => I1(8), B => I2(8), CIN => C_int(8), S => RESULTADO(8), COUT => c_int(9));
    S9: entity work.somador_1bit port map(A => I1(9), B => I2(9), CIN => c_int(9), S => RESULTADO(9), COUT => c_int(10));
	S10: entity work.somador_1bit port map(A => I1(10), B => I2(10), CIN => c_int(10), S => RESULTADO(10), COUT => c_int(11));
	S11: entity work.somador_1bit port map(A => I1(11), B => I2(11), CIN => c_int(11), S => RESULTADO(11), COUT => c_int(12));
    S12: entity work.somador_1bit port map(A => I1(12), B => I2(12), CIN => C_int(12), S => RESULTADO(12), COUT => c_int(13));
    S13: entity work.somador_1bit port map(A => I1(13), B => I2(13), CIN => c_int(13), S => RESULTADO(13), COUT => c_int(14));
	S14: entity work.somador_1bit port map(A => I1(14), B => I2(14), CIN => c_int(14), S => RESULTADO(14), COUT => c_int(15));
	S15: entity work.somador_1bit port map(A => I1(15), B => I2(15), CIN => c_int(15), S => RESULTADO(15), COUT => C_out);
    
    
end architecture;