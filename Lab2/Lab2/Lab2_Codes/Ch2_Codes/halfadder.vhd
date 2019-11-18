library ieee;
use ieee.std_logic_1164.all;

entity halfadder is
	port(
		SW: in std_logic_vector(17 downto 0);
		LEDR: out std_logic_vector(17 downto 0)
	);
end halfadder;

architecture ha_stru of halfadder is
begin
	LEDR(0) <= SW(0) xor SW(1);
	LEDR(1) <= SW(0) and SW(1);
end ha_stru;