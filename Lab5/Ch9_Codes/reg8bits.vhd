library IEEE;
use IEEE.Std_Logic_1164.all;

entity D_8FF is
port (
	CLK : in std_logic;
	EN : in std_logic;
	RST : in std_logic;
	D : in std_logic_vector(7 downto 0);
	Q : out std_logic_vector(7 downto 0)
		);
end D_8FF;

architecture behv of D_8FF is
begin
	process(CLK, D)
	begin
		if RST = '0' then
			Q <= "00000000";
		elsif (CLK'event and CLK = '1') then
			if EN = '1' then	
				Q <= D;
			end if;
		end if;
	end process;
end behv;