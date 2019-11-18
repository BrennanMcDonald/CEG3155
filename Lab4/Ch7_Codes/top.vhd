library ieee;
use IEEE.Std_Logic_1164.all;

entity top is
	port ( 
		CLOCK_50: in std_logic;
		KEY: in std_logic_vector(3 downto 0); --KEY(0)=>RST and --KEY(1)=>EN
		HEX0, HEX1: out std_logic_vector(6 downto 0)
  );
end top;

architecture top_stru of top is
	signal F : std_logic_vector(7 downto 0);
	
	component FSM
		port (
			clk : in std_logic;
			reset : in std_logic;
			count : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component Decode7seg
		port (
			A : in std_logic_vector(3 downto 0);
			F : out std_logic_vector(6 downto 0)
		);
	end component;
	
begin
	L1: FSM port map (CLOCK_50, KEY(0), F);
	L2: Decode7seg port map (F(7 downto 4), HEX1);
	L3: Decode7seg port map (F(3 downto 0), HEX0);
end top_stru;

