library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_6to1 is
	port (
		ch : in std_logic_vector(5 downto 0); -- data input channels
		cs : in std_logic_vector(2 downto 0); -- output of mux
		mux_out : out std_logic -- output of mux
		);
end mux_6to1;

architecture behavior of mux_6to1 is
begin
	mux : process (ch, cs) is
		variable sel : integer;	-- variable to store cs as integer
	begin
		sel := to_integer(unsigned(cs)); -- turn cs into integer
		-- output selected channel if sel < 6, otherwise, 0
		if sel < 6 then
			mux_out <= ch(sel);
		else
			mux_out <= '0';
		end if;
	end process mux;
end behavior;