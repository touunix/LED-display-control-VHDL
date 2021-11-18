-- Mateusz Gabryel 181329 EiT 3
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use STD.STANDARD.ALL;

ENTITY top_encoder IS
    PORT ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0)
          );
END top_encoder;

ARCHITECTURE Behavioral OF top_encoder IS

COMPONENT top_divider IS
    PORT ( clk_i: in STD_LOGIC;
           rst_i: in STD_LOGIC;
           clk_divider: out STD_LOGIC
          );
END COMPONENT;
 
COMPONENT top_display IS
	PORT ( led7_seg_o: out STD_LOGIC_VECTOR(7 downto 0);
		   led7_an_o: out STD_LOGIC_VECTOR(3 downto 0);
		   digit_i: in STD_LOGIC_VECTOR(31 downto 0);
	       display_clk: in STD_LOGIC;
		   rst_i: in STD_LOGIC
		  );
END COMPONENT;
 
signal a: STD_LOGIC_VECTOR (6 downto 0):= "1111111";
signal digit_i: STD_LOGIC_VECTOR (31 downto 0);
signal b: STD_LOGIC;
 
BEGIN

divider: top_divider
    PORT MAP ( clk_i => clk_i,
               rst_i => '0',
               clk_divider => b
              );

display: top_display
    PORT MAP ( led7_seg_o => led7_seg_o,
               led7_an_o => led7_an_o,
               digit_i => digit_i,
               display_clk => b,
               rst_i => '0'
              );

WITH sw_i(3 downto 0) SELECT -- realizacja przypisania selektywnego do zakodowania
      a <= "0000001" WHEN "0000",  -- 0
           "1001111" WHEN "0001",  -- 1
           "0010010" WHEN "0010",  -- 2
           "0000110" WHEN "0011",  -- 3
           "1001100" WHEN "0100",  -- 4
           "0100100" WHEN "0101",  -- 5
           "0100000" WHEN "0110",  -- 6
           "0001111" WHEN "0111",  -- 7
           "0000000" WHEN "1000",  -- 8
           "0000100" WHEN "1001",  -- 9
           "0001000" WHEN "1010",  -- A
           "1100000" WHEN "1011",  -- B
           "0110001" WHEN "1100",  -- C
           "1000010" WHEN "1101",  -- D
           "0110000" WHEN "1110",  -- E
           "0111000" WHEN "1111",  -- F 
           "1111111" WHEN others;  -- ? (nieokreslone)
         
PROCESS(clk_i, sw_i, btn_i,a)

BEGIN
    if(rising_edge(clk_i)) then

        if(sw_i(4) = '1') then digit_i(0) <= '0'; -- kropka dla AN0
            else
                digit_i(0) <= '1';
        END if;
        
        if(sw_i(5) = '1') then digit_i(8) <= '0'; -- kropka dla AN1
            else  
                digit_i(8) <= '1';
        END if;
        
        if(sw_i(6) = '1') then digit_i(16) <= '0'; -- kropka dla AN2
            else
                digit_i(16) <= '1';
        END if;
       
        if(sw_i(7) = '1') then digit_i(24) <= '0'; -- kropka dla AN3
            else
                digit_i(24) <= '1';
        END if;
    
        -- wpisanie ustawionej wartosci na odpowiedni segment
        if(btn_i(0) = '1') then digit_i(7 downto 1) <= a;   -- wpisanie na AN0
        END if;
        if(btn_i(1) = '1') then digit_i(15 downto 9) <= a;  -- wpisanie na AN1
        END if;
        if(btn_i(2) = '1') then digit_i(23 downto 17) <= a; -- wpisanie na AN2
        END if;
        if(btn_i(3) = '1') then digit_i(31 downto 25) <= a; -- wpisanie na AN3
        END if;
        
    END if;   
END PROCESS;
END Behavioral;