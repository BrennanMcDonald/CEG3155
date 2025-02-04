-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "10/14/2018 13:40:34"
                                                            
-- Vhdl Test Bench template for design  :  top_calc
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY top_calc_tb IS
END top_calc_tb;

ARCHITECTURE top_calc_arch OF top_calc_tb IS
-- constants   
type test_vector is record
        SW : STD_LOGIC_VECTOR(17 downto 0);
		  KEY: STD_LOGIC_VECTOR(3 downto 0);
        HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
        HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
		  LEDR : STD_LOGIC_VECTOR(17 DOWNTO 0);
end record;
type test_vector_array is array (natural range <>) of test_vector;
    constant test_vectors : test_vector_array := ( 
          ("000000001000000001", "0001", "0110000", "1000000", "000000000000000011"),
          ("010000001000000001", "0001", "0110000", "1000000", "000000000000000011"),
          ("100000001000000001", "0001", "0110000", "1000000", "000000000000000011")
        );                                              
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL LEDR : STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(17 DOWNTO 0);

COMPONENT top_calc
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : top_calc
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	HEX0 => HEX0,
	HEX1 => HEX1,
	KEY => KEY,
	LEDR => LEDR,
	SW => SW
	);

init : PROCESS                                                  
BEGIN                                                        
        -- code that executes only once                
	WAIT;                                            
END PROCESS init;
                                           
clock : PROCESS                                                                       
BEGIN  
	for i in test_vectors'range loop   
		CLOCK_50 <= '0';
		wait for 50 ps;   
		CLOCK_50 <= '1';
		wait for 50 ps;                                                     
	end loop;
WAIT;                                                        
END PROCESS clock;

test : PROCESS
   variable i : natural range 0 to test_vectors'length := 0;                                                            
BEGIN     
	SW <= test_vectors(i).SW;  -- signal SW = i^th-row-value of test_vector's SW
	KEY <= test_vectors(i).KEY;  -- signal SW = i^th-row-value of test_vector's SW
	wait for 100 ps;
	loop
		wait until rising_edge(CLOCK_50);
		assert( 
                    (HEX0 = test_vectors(i).HEX0) and  
		    (HEX1 = test_vectors(i).HEX1) and 
		    (LEDR = test_vectors(i).LEDR)
                   )
            	report  "test_vector " & integer'image(i) & " failed "
                    severity error;
            	i := i + 1; 
		SW <= test_vectors(i).SW;  -- signal SW = i^th-row-value of test_vector's SW
	    	KEY <= test_vectors(i).KEY;  -- signal SW = i^th-row-value of test_vector's SW
	end loop;
END PROCESS test;   
                                       
END top_calc_arch;
