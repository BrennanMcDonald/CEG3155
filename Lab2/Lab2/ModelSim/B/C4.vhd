library ieee;
use ieee.std_logic_1164.all;

entity C4 is
	port(
		A, B, C: in std_logic;
		F: out std_logic
	);
end C4;

architecture c4_estr of C4 is
begin
	F <= (A and B) or C;
end c4_estr;



