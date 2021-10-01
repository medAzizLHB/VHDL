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

-- BCD to 2421 converter using if statements 
architecture converter_if of converter_bcd_2421 is
begin
	converter_if: -- label for process
	process (d, c, b, a) is -- sensitive to d, c, b, a		 
	begin -- begin process
		-- logic: 0 -> 0, 1 -> 1, 2 -> 2, 3 -> 3, 4 -> 4, 5 -> B,
		-- 6 -> C, 7 -> D, 8 -> E, 9 -> F
		-- if statement
		-- 0000 -> 0000
		if d = '0' and c = '0' and b = '0' and a ='0' then
			p <= '0';
			q <= '0';
			r <= '0';
			s <= '0';
			-- 0001 -> 0001	
		elsif d = '0' and c = '0' and b = '0' and a ='1' then
			p <= '0';
			q <= '0';
			r <= '0';
			s <= '1';
			-- 0010 -> 0010	
		elsif d = '0' and c = '0' and b = '1' and a ='0' then
			p <= '0';
			q <= '0';
			r <= '1';
			s <= '0';
			-- 0011 -> 0011	
		elsif d = '0' and c = '0' and b = '1' and a ='1' then
			p <= '0';
			q <= '0';
			r <= '1';
			s <= '1';
			-- 0100 -> 0100	
		elsif d = '0' and c = '1' and b = '0' and a ='0' then
			p <= '0';
			q <= '1';
			r <= '0';
			s <= '0';
			-- 0101 -> 1011	
		elsif d = '0' and c = '1' and b = '0' and a ='1' then
			p <= '1';
			q <= '0';
			r <= '1';
			s <= '1';
			-- 0110 -> 1100	
		elsif d = '0' and c = '1' and b = '1' and a ='0' then
			p <= '1';
			q <= '1';
			r <= '0';
			s <= '0';
			-- 0111 -> 1101
		elsif d = '0' and c = '1' and b = '1' and a ='1' then
			p <= '1';
			q <= '1';
			r <= '0';
			s <= '1';
			-- 1000 -> 1110	
		elsif d = '1' and c = '0' and b = '0' and a ='0' then
			p <= '1';
			q <= '1';
			r <= '1';
			s <= '0';
			-- 1001 -> 1111
		elsif d = '1' and c = '0' and b = '0' and a ='1' then
			p <= '1';
			q <= '1';
			r <= '1';
			s <= '1';
			-- others -> ----	
		else
			p <= '-';
			q <= '-';
			r <= '-';
			s <= '-';
		end if;	
	end process converter_if;
end converter_if;