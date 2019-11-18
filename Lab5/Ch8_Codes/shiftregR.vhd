-- Quartus Prime VHDL Template
-- One-bit wide, N-bit long shift register with asynchronous reset

library ieee;
use ieee.std_logic_1164.all;

entity shiftregR is

	generic
	(
		N : natural := 8
	);

	port 
	(
		clk	    : in std_logic;
--		enable	: in std_logic; -- we won't be needing the enable in our design
		reset   : in std_logic;
		sr_in	    : in std_logic_vector((N-1) downto 0);
		sr_out	: out std_logic_vector((N-1) downto 0)
	);

end entity;

architecture rtl of shiftregR is
	signal sr: std_logic_vector ((N-1) downto 0);
begin
	process (clk, reset)
	begin
		if (reset = '0') then
			sr <= (others=>'0');
		elsif (rising_edge(clk)) then

--			if (enable = '0') then

				sr((N-2) downto 0) <= sr_in((N-1) downto 1);
				sr(N-1) <= '0';

--			end if;
		end if;
	end process;
	sr_out <= sr;
end rtl;
