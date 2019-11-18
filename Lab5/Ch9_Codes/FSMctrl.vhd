library ieee;
use ieee.std_logic_1164.all;


entity FSMctrl is
	port ( Clk, Rst, Enter : in std_logic;
			 Operation: in std_logic_vector(1 downto 0);
			 Selection: out std_logic_vector(1 downto 0);
			 Enable_1, Enable_2: out std_logic);
end FSMctrl;
architecture FSM_beh of FSMctrl is
	type states is (S0, S1, S2, S3, S4, S5, S6, S7);
	signal CS, NS, EA: states;
	signal clock, reset: std_logic;
begin
	clock <= Clk; reset <= Rst;
process (clock, reset)
begin
	if reset = '0' then
		EA <= S0;
		--Selection <= (others=>'0');
	elsif clock'event and clock = '1' then
		EA <= NS;
	end if;
end process;
process (EA, Enter)
begin
	case EA is
		when S0 =>
			if Enter = '0' then 
				NS <= S1; 
			else 
				NS <= S0; 
			end if;
			Enable_1 <= '0'; 
			Enable_2 <= '0'; 
			Selection <= "00";
		when S1 => 
			if Enter = '0' then 
				NS <= S1;
			else 
				NS <= S2; 
			end if;
			Enable_1 <= '1'; 
			Enable_2 <= '0'; 
			Selection <= operation;
		when S2 =>
			Enable_1 <= '0'; 
			Enable_2 <= '0'; 
			Selection <= Operation;
			if Operation = "00" then
				NS <= S3; --add
			elsif Operation = "01" then
				NS <= S4; --OR
			elsif Operation = "10" then
				NS <= S5; --XOR
			elsif Operation = "11" then
				NS <= S6; --NOT
			else 
				NS <= S2;
			end if;	
		when S3 => 		-- Add
			if Enter = '0' then 
				NS <= S7;
				Selection <= "00";
			else 
				NS <= S3; 
				Selection <= "00";
			end if;
			Enable_1 <= '0'; 
			Enable_2 <= '0';
		when S4 => 		-- OR
			if Enter = '0' then
				NS <= S7;
			else
				NS <= S4;
			end if;
			Enable_1 <= '0';
			Enable_2 <= '0';
			Selection <= "01";
		when S5 =>		-- Div
			NS <= S0;
			Enable_1 <= '0';
			Enable_2 <= '1';
			Selection <= "10";
		when S6 =>		-- Div
			NS <= S0;
			Enable_1 <= '0';
			Enable_2 <= '1';
			Selection <= "11";
		when S7 => 
			NS <= S0;
			Enable_1 <= '0';
			Enable_2 <= '1';
		end case;
end process;
end FSM_beh;
