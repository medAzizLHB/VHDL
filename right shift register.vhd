library ieee;
use ieee.std_logic_1164.all;

entity right_shift_reg is
	port (
	d : in std_logic_vector(3 downto 0); -- parallel input data
	load : in std_logic; -- synchronous load parallel input
	en_shift : in std_logic; -- enable shift if load is unasserted
	clk : in std_logic; -- clk
	rst_bar : in std_logic; -- asynchronous reset
	serial_out : out std_logic -- serial output
	);
end right_shift_reg;


architecture behavioral of right_shift_reg is
begin
	rsr_behavior: process (clk, rst_bar) is
	variable d_memory : std_logic_vector(3 downto 0); -- variable to store loaded data
	begin
		-- when there's a rising edge and load = 1,
		-- load a new value to d_memory
		if rising_edge(clk) and load = '1' then
			d_memory := d;
		end if;
		
		-- if load = 0 and en_shift = 1, output the lsb and
		-- shift the rest to the right.
		if rising_edge(clk) and load = '0' and en_shift = '1' then
			serial_out <= d_memory(0);
			d_memory := "0" & d_memory(3 downto 1);
		end if;		
		
		-- if rst_bar = 0, reset the shift register by
		-- setting saved data to 0000
		if rst_bar = '0' then
			d_memory := "0000";
		end if;
	end process rsr_behavior;
end behavioral;