library IEEE;
use IEEE.std_logic_1164.all;

entity converter_bcd_2421 is
	 port(
		 d : in STD_LOGIC;
		 c : in STD_LOGIC;
		 b : in STD_LOGIC;
		 a : in STD_LOGIC;
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

-- Selected Signal Assignment implementation of BCD to 2421 Converter
-- Sets the outputs to 1 when the given conditions are true, 
-- 0 otherwise.
architecture selected of converter_bcd_2421 is
begin
	with std_logic_vector'(d, c, b, a) select
	p <= '1' when "0101" | "0110" | "0111" | "1000" | "1001",
	'-' when "1010" | "1011" | "1100" | "1101" | "1110" | "1111",
	'0' when others;
	
	with std_logic_vector'(d, c, b, a) select
	q <= '1' when "0100" | "0110" | "0111" | "1000" | "1001",
	'-' when "1010" | "1011" | "1100" | "1101" | "1110" | "1111",
	'0' when others;
	
	with std_logic_vector'(d, c, b, a) select
	r <= '1' when "0010" | "0011" | "0101" | "1000" | "1001",
	'-' when "1010" | "1011" | "1100" | "1101" | "1110" | "1111",
	'0' when others;
	
	with std_logic_vector'(d, c, b, a) select
	s <= '1' when "0001" | "0011" | "0101" | "0111" | "1001",
	'-' when "1010" | "1011" | "1100" | "1101" | "1110" | "1111",
	'0' when others;
end selected;