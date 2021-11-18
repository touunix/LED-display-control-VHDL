-- Mateusz Gabryel 181329 EiT 3
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE Behavioral OF tb IS

COMPONENT top_encoder IS
    PORT ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0)
          );
END COMPONENT top_encoder;

signal clk_i : STD_LOGIC := '0';
signal btn_i : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal sw_i : std_logic_vector (7 downto 0) := "00000000";
signal led7_an_o : STD_LOGIC_VECTOR (3 downto 0) :="1111";
signal led7_seg_o : STD_LOGIC_VECTOR (7 downto 0) :="11111111";
constant PERIOD : TIME := 10 ns; -- 100 MHz

BEGIN

uut: top_encoder 
    PORT MAP ( clk_i => clk_i,
               btn_i => btn_i,
               sw_i => sw_i,
               led7_an_o => led7_an_o,
               led7_seg_o => led7_seg_o
              );

clk_i <= NOT clk_i AFTER PERIOD/2; -- realizacja prostego zegara

tb:PROCESS
   BEGIN
		WAIT FOR 4 ms; -- AN3
		  btn_i(3) <= '1';
		  btn_i(2) <= '0';
		  btn_i(1) <= '0';
		  btn_i(0) <= '0';
		  sw_i(0) <= '1';
		  sw_i(1) <= '1';
		  sw_i(2) <= '1';
		  sw_i(3) <= '1';
		  -- kropki
		  sw_i(4) <= '1';
		  sw_i(5) <= '1';
		  sw_i(6) <= '0';
		  sw_i(7) <= '0';
		WAIT FOR 2 ms; -- AN2
		  btn_i(3) <= '0';
		  btn_i(2) <= '1';
		  btn_i(1) <= '0';
		  btn_i(0) <= '0';
		  sw_i(0) <= '0';
		  sw_i(1) <= '1';
		  sw_i(2) <= '0';
		  sw_i(3) <= '1';
		  -- kropki
		  sw_i(4) <= '1';
		  sw_i(5) <= '0';
		  sw_i(6) <= '0';
		  sw_i(7) <= '1';
		WAIT FOR 2 ms; -- AN1
		  btn_i(3) <= '0';
		  btn_i(2) <= '0';
		  btn_i(1) <= '1';
		  btn_i(0) <= '0';
		  sw_i(0) <= '0';
		  sw_i(1) <= '0';
    	  sw_i(2) <= '0';
          sw_i(3) <= '0';
          -- kropki
		  sw_i(4) <= '1';
		  sw_i(5) <= '0';
		  sw_i(6) <= '1';
		  sw_i(7) <= '0';
		WAIT FOR 2 ms; -- AN0
	      btn_i(3) <= '0';
		  btn_i(2) <= '0';
		  btn_i(1) <= '0';
		  btn_i(0) <= '1';
		  sw_i(0) <= '0';
		  sw_i(1) <= '1';
		  sw_i(2) <= '0';
		  sw_i(3) <= '0';
		  -- kropki
		  sw_i(4) <= '0';
		  sw_i(5) <= '1';
		  sw_i(6) <= '0';
		  sw_i(7) <= '1';
        WAIT;
END PROCESS;
END Behavioral;