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