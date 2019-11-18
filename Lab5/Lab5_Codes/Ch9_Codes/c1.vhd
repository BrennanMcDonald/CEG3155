library IEEE;
use IEEE.Std_Logic_1164.all;
use ieee.std_logic_unsigned.all;

entity C1 is
port (A : in std_logic_vector(7 downto 0);
		B : in std_logic_vector(7 downto 0);
		F : out std_logic_vector(7 downto 0)
		);
end C1;

architecture c1_estr of C1 is
begin
	 F <= A + B;
end c1_estr;