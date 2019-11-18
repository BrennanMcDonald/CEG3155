library IEEE;
use IEEE.Std_Logic_1164.all;

entity C3 is
port (A : in std_logic_vector(7 downto 0);
		B : in std_logic_vector(7 downto 0);
		F : out std_logic_vector(7 downto 0)
		);
end C3;

architecture c3_estr of C3 is
begin
	 F <= A xor B;
end c3_estr;