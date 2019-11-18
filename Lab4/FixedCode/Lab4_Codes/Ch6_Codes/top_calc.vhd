library ieee;
use IEEE.Std_Logic_1164.all;

entity top_calc is
	port ( 
			CLOCK_50: in std_logic;
			KEY: in std_logic_vector(3 downto 0); --KEY(0)=>RST and --KEY(1)=>EN
			SW: in std_logic_vector(17 downto 0);
		    HEX0, HEX1: out std_logic_vector(6 downto 0);
		    LEDR: out std_logic_vector(17 downto 0)
  );
end top_calc;

architecture top_stru of top_calc is
	signal F, F1, F2, F3, F4, G3: std_logic_vector(7 downto 0);
	signal G1, G2: std_logic_vector(3 downto 0);
	
	component C1
		port (A : in std_logic_vector(7 downto 0);
				B : in std_logic_vector(7 downto 0);
				F : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component C2
		port (A : in std_logic_vector(7 downto 0);
				B : in std_logic_vector(7 downto 0);
				F : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component C3
		port (A : in std_logic_vector(7 downto 0);
				B : in std_logic_vector(7 downto 0);
				F : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component C4
		port (A : in std_logic_vector(7 downto 0);
				F : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component mux4x1
		port (w, x, y, z : in std_logic_vector(7 downto 0);
							s : in std_logic_vector(1 downto 0);
							m : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component Decod7seg
		port (A : in std_logic_vector(3 downto 0);
				F : out std_logic_vector(6 downto 0)
		);
	end component;
	
	component D_4FF
		port (
			CLK : in std_logic;
			EN : in std_logic;
			RST : in std_logic;
			D : in std_logic_vector(3 downto 0);
			Q : out std_logic_vector(3 downto 0)
				);
	end component;
	
	component D_8FF
		port (
			CLK : in std_logic;
			EN : in std_logic;
			RST : in std_logic;
			D : in std_logic_vector(7 downto 0);
			Q : out std_logic_vector(7 downto 0)
				);
	end component;
	
begin
	L1: C1 port map (SW(7 downto 0), SW(15 downto 8), F1);
	L2: C2 port map (SW(7 downto 0), SW(15 downto 8), F2);
	L3: C3 port map (SW(7 downto 0), SW(15 downto 8), F3);
	L4: C4 port map (SW(7 downto 0), F4);
	L5: mux4x1 port map (F1, F2, F3, F4, SW(17 downto 16), F);
	
	--wire the output F to the relevant DFF registers before passing to below
	--add the required registers as L6, L7 and L8 and wire inputs CLK,EN and RST to them, 
	--also wire outputs of DFF to signals G1,G2 and G3
	  
	L9: Decod7seg port map (G1(3 downto 0), HEX1);
	L10: Decod7seg port map (G2(3 downto 0), HEX0);

	LEDR(17 downto 8) <= (others=>'0');

end top_stru;





