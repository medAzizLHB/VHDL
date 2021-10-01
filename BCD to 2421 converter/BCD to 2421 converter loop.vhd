library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;	-- required to use to_unsigned function


entity converter_bcd_2421 is
	port( -- signal declarations
		-- inputs
		d : in STD_LOGIC;
		c : in STD_LOGIC;
		b : in STD_LOGIC;
		a : in STD_LOGIC;
		
		-- outputs 
		p : out STD_LOGIC;
		q : out STD_LOGIC;
		r : out STD_LOGIC;
		s : out STD_LOGIC
		);
   attribute loc : string;
   attribute loc of d : signal is "P3";
   attribute loc of c : signal is "P4";
   attribute loc of b : signal is "P5";
   attribute loc of a : signal is "P6";		
   attribute loc of p : signal is "P27";		
   attribute loc of q : signal is "P26";		
   attribute loc of r : signal is "P25";		
   attribute loc of s : signal is "P24";

end converter_bcd_2421;

--}} End of automatically maintained section

-- BCD to 2421 converter using if statements 
architecture converter_loop of converter_bcd_2421 is
begin
	converter_loop: -- label for process
		process (d, c, b, a) is -- sensitive to d, c, b, a
		-- variables to store inputs and outputs as std_logic_vectors
		variable inputVector : std_logic_vector(3 downto 0);
		variable outputVector : std_logic_vector(3 downto 0);
	begin -- begin process
		-- logic: 0 -> 0, 1 -> 1, 2 -> 2, 3 -> 3, 4 -> 4, 5 -> B,
		-- 6 -> C, 7 -> D, 8 -> E, 9 -> F
		-- loop statement
		inputVector := (d, c, b, a);
		for i in 0 to 15 loop
			-- if i <= 4 and inputVector = i, output i
			if (i <= 4 and inputVector = std_logic_vector(to_unsigned(i, 4))) then
				-- assign i to outputVector
				outputVector := std_logic_vector(to_unsigned(i, 4));
				exit; -- end loop when value found
				-- if i <= 9 and inputVector = i, output i + 6
			elsif (i <= 9 and inputVector = std_logic_vector(to_unsigned(i, 4))) then
				
				-- assign i + 6 to outputVector
				outputVector := std_logic_vector(to_unsigned(i + 6, 4));
				exit; -- end loop when value found
				
			else -- else, output don't cares
				outputVector := "----";
			end if;
		end loop;
		(p, q, r, s) <= outputVector; -- set p, q, r, s
	end process converter_loop;
end converter_loop;