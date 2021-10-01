-- Description : programmable_prescalar is the design description for
-- a programmable prescalar with a structural architecture comprised
-- of a 6 to 1 multiplexer and a binary counter.
--
-- Inputs: ch[5:0], cs[2:0], clk
-- Outputs: mux_out				 
-----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity programmable_prescalar is
	generic (n : integer := 4); -- generic for counter width
	port(
		clear : in std_logic; -- active low clear
		clk : in std_logic; -- clock
		cs : in std_logic_vector(2 downto 0); -- select
		clk_prescaled : out std_logic -- prescaled clock
		);
	attribute loc : string;	   
	attribute loc of clear: signal is "P18";
	attribute loc of clk : signal is "P17";
	attribute loc of cs: signal is "P19,P20,P21";
	attribute loc of clk_prescaled: signal is "P36";
end programmable_prescalar;

architecture structural of programmable_prescalar is
	signal q : std_logic_vector(n-1 downto 0); -- signal to store bin counter output
	signal cnten : std_logic; -- signal for bin counter enable
	signal ch : std_logic_vector(5 downto 0);  -- signal for channels
begin
	cnten <= '1';
	UUT1 : entity binary_counter(integer_signal) port map (clk => clk,
		cnten => cnten, rst_bar => clear, q => q);	  -- binary counter entity
	ch <= q & clk & "0"; -- create channels
	UUT2 : entity mux_6to1 port map (ch => ch, cs => cs, 
		mux_out => clk_prescaled); 	-- mux entity
end structural;