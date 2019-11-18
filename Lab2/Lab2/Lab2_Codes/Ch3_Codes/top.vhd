library ieee;
use ieee.std_logic_1164.all;

entity top is
	port(
		A, B, C: in std_logic;
		F: out std_logic
	);
end top;

architecture top_map of top is
	signal F1, F2, F3: std_logic;

	component C1 is
		port(
			A, B, C: in std_logic;
			F: out std_logic
		);
	end component;
	
	component C2 is
		port(
			A, B: in std_logic;
			F: out std_logic
		);
	end component;
	
	--------------------------
	-- Add component C3 here
	--------------------------
	
	component C4 is
		port(
			A, B, C: in std_logic;
			F: out std_logic
		);
	end component;
	
begin
	L0: C1 port map(A, B, C, F1);
	L1: C2 port map(B, C, F2);
	----- Add C3 port mapping here
	L3: C4 port map(F1, F2, F3, F);
end top_map;


