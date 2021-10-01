library IEEE;
use IEEE.std_logic_1164.all;


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
end converter_bcd_2421;

--}} End of automatically maintained section

-- BCD to 2421 converter using a case statement 
architecture converter_case of converter_bcd_2421 is
begin
	converter_case: -- label for process
	process (d, c, b, a) is -- sensitive to d, c, b, a		 
	begin -- begin process
		-- case statement
		-- logic: 0 -> 0, 1 -> 1, 2 -> 2, 3 -> 3, 4 -> 4, 5 -> B,
		-- 6 -> C, 7 -> D, 8 -> E, 9 -> F
		case std_logic_vector'(d, c, b, a) is
			-- 0 -> 0
			when "0000" =>
				p <= '0';
				q <= '0';
				r <= '0';
				s <= '0';
			-- 1 -> 1	
			when "0001" =>
				p <= '0';
				q <= '0';
				r <= '0';
				s <= '1';
			-- 2 -> 2	
			when "0010" =>
				p <= '0';
				q <= '0';
				r <= '1';
				s <= '0';
			-- 3 -> 3	
			when "0011" =>
				p <= '0';
				q <= '0';
				r <= '1';
				s <= '1';
			-- 4 -> 4	
			when "0100" =>
				p <= '0';
				q <= '1';
				r <= '0';
				s <= '0';
			-- 5 -> B	
			when "0101" =>
				p <= '1';
				q <= '0';
				r <= '1';
				s <= '1';
			-- 6 -> C	
			when "0110" =>
				p <= '1';
				q <= '1';
				r <= '0';
				s <= '0';
			-- 7 -> D	
			when "0111" =>
				p <= '1';
				q <= '1';
				r <= '0';
				s <= '1';
			-- 8 -> E	
			when "1000" =>
				p <= '1';
				q <= '1';
				r <= '1';
				s <= '0';
			-- 9 -> F	
			when "1001" =>
				p <= '1';
				q <= '1';
				r <= '1';
				s <= '1';
			-- all others are don't cares ('-')
			when others =>
				p <= '-';
				q <= '-';
				r <= '-';
				s <= '-';
		end case;
	end process converter_case;
end converter_case;