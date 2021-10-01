library ieee;
use ieee.std_logic_1164.all;

entity input_latch is
	
	port (
		a : in std_logic_vector(2 downto 0); -- data input
		le_bar : in std_logic; -- latch enable input (active low)
		a_lat : out std_logic_vector(2 downto 0) -- latch output
		);
	
end input_latch;


architecture behavioral of input_latch is
begin
	latch_behavior: process (a, le_bar) -- process sensitivity list
	begin
		if le_bar = '0' then -- if le_bar is low, then set input to output
			a_lat <= a;
		end if;
	end process latch_behavior;		
end behavioral;

-------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_3to8 is
	port (
		a : in std_logic_vector(2 downto 0); -- data input
		en : in std_logic; -- decoder enable input (active high)
		y : out std_logic_vector(7 downto 0) -- output
		);
end decoder_3to8;


architecture behavioral of decoder_3to8 is
begin
	decoder3to8_behavior: process (a, en) is -- process sensitivity list
	begin 
		if en = '1' then -- if enable is asserted, decode
			y <= "00000000";
			y(to_integer(unsigned(a))) <= '1';	
		end if;
		
		if en = '0' then -- if enable is not asserted, output 0s
			y <= "00000000";
		end if;
	end process decoder3to8_behavior;		
end behavioral;

-------------------------

library ieee;
use ieee.std_logic_1164.all;

entity latched_3to8_decoder is
	port (
		a : in std_logic_vector(2 downto 0); -- data input
		e1_bar : in std_logic; -- decoder enable input (active low)
		e2 : in std_logic; -- decoder enable input (active high)
		le_bar : in std_logic; -- latch enable input
		y : out std_logic_vector(7 downto 0) -- output
		);
	attribute loc : string; 
	attribute loc of a: signal is "P19,P20,P21"; 
	attribute loc of e1_bar: signal is "P9"; 
	attribute loc of e2: signal is "P15"; 
	attribute loc of le_bar: signal is "P18"; 
	attribute loc of y: signal is "P36,P37,P38,P39,P40,P41,P42,P43";
end latched_3to8_decoder;


architecture structural of latched_3to8_decoder is
	signal a_lat : std_logic_vector(2 downto 0);
	signal en : std_logic;
begin
	u0 : entity input_latch port map (a => a, le_bar => le_bar, a_lat => a_lat); -- input latches
	u1 : entity decoder_3to8 port map (a => a_lat, en => en, y => y); -- decoder
	u2 : en <= not e1_bar and e2; -- concurrent signal assignment statement for gate
end structural;