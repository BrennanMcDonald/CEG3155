library IEEE;
use IEEE.Std_Logic_1164.all;

entity C4 is
port (A : in std_logic_vector(7 downto 0);
		F : out std_logic_vector(7 downto 0)
		);
end C4;

architecture c4_stru of C4 is
begin
	 F <= not A;
end c4_stru;