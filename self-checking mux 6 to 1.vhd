library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mux_6to1_tb is
end mux_6to1_tb;

architecture testbench of mux_6to1_tb is
	signal ch : std_logic_vector(5 downto 0); -- vector for channel inputs
	signal cs : std_logic_vector(2 downto 0); -- vector for chip select inputs
	signal mux_out : std_logic; -- mux output
	constant period : time := 20 ns; -- constant for delays and waveform
begin
	UUT : entity mux_6to1 port map (ch => ch, cs => cs, mux_out => mux_out);
	
	tb : process is
		variable exp_output : std_logic; -- variable for expected output
	begin		
		for i in 7 downto 0 loop
			ch <= "101010"; -- constant for ch
			cs <= std_logic_vector(to_unsigned(i, cs'length)); -- give cs input
			
			wait for period; -- wait to suspend program and set values
			
			case i is -- generate expected output using case statement
				when 5 | 4 | 3 | 2 | 1 | 0 => exp_output := ch(i);
				when others => exp_output := '0';
			end case;
			
			-- assert statement checks output values and verifies output 
			assert (exp_output = mux_out)
			-- report statement outputs the input, expected output 
			-- and actual output of when there is failure
			report "ERROR: ch = " & to_string(ch) & ", cs = " & to_string(cs) &
			", Output = " & std_logic'image(mux_out) & ", Expected Output = " &
			std_logic'image(exp_output)
			severity error; -- simulation is not stopped
			
		end loop;
		
		std.env.finish; -- finish process
	end process tb;
end testbench;