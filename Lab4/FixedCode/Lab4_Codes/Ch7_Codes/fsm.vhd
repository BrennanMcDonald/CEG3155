library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM is
	port(
		clk: in std_logic;
		reset: in std_logic;
		count: out std_logic_vector(7 downto 0)
	);
end FSM;

architecture behv of FSM is
	type states is (S0, S1, D1, D2, D3,D4);  	-- Define the states
	signal delay: INTEGER RANGE 0 to  16#800001#:=0;
	signal ASCII: INTEGER RANGE 0 to     16#FF#:=0;
	signal CS: states;			-- Current state
begin
	process(clk, reset)
	begin
		if(reset = '0')then
			CS <= S0;
			ASCII <= 16#40#;
		elsif clk'event and clk = '1' then
			case CS is
				when S0 => 
					 CS <= S1;
				when S1 => 
					delay <=  16#000000#;
					if ASCII > 16#5A# then 
						ASCII <= 16#41#;
					else
						ASCII <= ASCII + 1;
					end if;
					CS <= D1;
				when D1 =>
					delay <= 16#000000#;
					CS <= D2;
				when D2 =>
					delay <= delay + 1;
					CS <= D3;
				when D3 =>
					if(delay >= 16#000000#)then	
						CS <= S1;
					else	
						CS <= D4;
					end if;
			   when D4 =>
					CS <= D2;
			end case;
		end if;
	end process;
	count <= std_logic_vector(to_signed(ASCII,count'length));
end behv;





