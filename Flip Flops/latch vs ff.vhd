library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
	port (
	d : in std_logic; -- data input
	le_bar : in std_logic; -- latch enable input (active low)
	ql : out std_logic -- output
	);
end d_latch;


architecture behavioral of d_latch is
begin
	latch_behavior: process (le_bar, d) -- process sensitivity list
	begin
		if le_bar = '0' then -- if le_bar is low, then set input to output
			ql <= d;
		end if;
	end process latch_behavior;		
end behavioral;

--------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity d_flip_flop is
	port (
	d : in std_logic; -- data input
	clk : in std_logic; -- clk input
	qff : out std_logic -- output
	);
end d_flip_flop;


architecture behavioral of d_flip_flop is
begin
	flip_flop_behavior: process (clk) -- process sensitivity list
	begin
		if rising_edge(clk) then 
			-- if there is a rising edge on clk,
			-- set input to output
			qff <= d;
		end if;
	end process flip_flop_behavior;		
end behavioral;

-------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity latch_vs_flip_flop is
	port (
	d : in std_logic;  -- data input
	clk : in std_logic; -- clk input
	ql : out std_logic; -- latch output
	qff : out std_logic -- flip flop output
	);
end latch_vs_flip_flop;

architecture structural of latch_vs_flip_flop is
begin
	u1: entity d_latch port map (d => d, le_bar => clk, ql => ql); -- d latch
	u2: entity d_flip_flop port map (d => d, clk => clk, qff => qff); -- d flip flop
end structural;