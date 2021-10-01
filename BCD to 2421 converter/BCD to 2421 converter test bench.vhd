library IEEE;
use IEEE.std_logic_1164.all;

entity converter_bcd_2421_tb is
end converter_bcd_2421_tb;

--}} End of automatically maintained section

architecture testbench of converter_bcd_2421_tb is
	-- Declare local signals to assign values to and to observe
	signal d_tb, c_tb, b_tb, a_tb, p_tb, q_tb, r_tb, s_tb : STD_LOGIC;
begin
	-- Create an instance of the BCD to 2421 converter
	uut: entity converter_bcd_2421 port map (d => d_tb, c => c_tb, b => b_tb,
		a => a_tb, p => p_tb, q => q_tb, r => r_tb, s => s_tb);
		
	-- Process to apply input stimulus and test outputs
	tb : process
		constant period: time := 20 ns;	-- time before changing input
		begin	-- Apply the different input stimulus
		
		-- Apply input 0000
		d_tb <= '0';
		c_tb <= '0';
		b_tb <= '0';
		a_tb <= '0';
		wait for period;
		
		-- Apply input 0001
		d_tb <= '0';
		c_tb <= '0';
		b_tb <= '0';
		a_tb <= '1';
		wait for period;
		
		-- Apply input 0010
		d_tb <= '0';
		c_tb <= '0';
		b_tb <= '1';
		a_tb <= '0';
		wait for period;
		
		-- Apply input 0011
		d_tb <= '0';
		c_tb <= '0';
		b_tb <= '1';
		a_tb <= '1';
		wait for period;
		
		-- Apply input 0100
		d_tb <= '0';
		c_tb <= '1';
		b_tb <= '0';
		a_tb <= '0';
		wait for period;
		
		-- Apply input 0101
		d_tb <= '0';
		c_tb <= '1';
		b_tb <= '0';
		a_tb <= '1';
		wait for period;
		
		-- Apply input 0110
		d_tb <= '0';
		c_tb <= '1';
		b_tb <= '1';
		a_tb <= '0';
		wait for period;
		
		-- Apply input 0111
		d_tb <= '0';
		c_tb <= '1';
		b_tb <= '1';
		a_tb <= '1';
		wait for period;
		
		-- Apply input 1000
		d_tb <= '1';
		c_tb <= '0';
		b_tb <= '0';
		a_tb <= '0';
		wait for period;
		
		-- Apply input 1001
		d_tb <= '1';
		c_tb <= '0';
		b_tb <= '0';
		a_tb <= '1';
		wait for period;
		
		wait;	-- indefinitely suspend process
	end process;	
		
end testbench;