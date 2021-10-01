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

-- CPOS implementation of BCD to 2421 Converter
-- Sets the outputs to 1 when the given conditions
-- are true, 0 otherwise.
architecture cpos of converter_bcd_2421 is
begin
	p <= (d or c or b or a)
	and (d or c or b or not a)
	and (d or c or not b or a)
	and (d or c or not b or not a)
	and (d or not c or b or a);
	
	q <= (d or c or b or a)
	and (d or c or b or not a)
	and (d or c or not b or a)
	and (d or c or not b or not a)
	and (d or not c or b or not a);
	
	r <= (d or c or b or a)
	and (d or c or b or not a)
	and (d or not c or b or a)
	and (d or not c or not b or a)
	and (d or not c or not b or not a);
	
	s <= (d or c or b or a)
	and (d or c or not b or a)
	and (d or not c or b or a)
	and (d or not c or not b or a)
	and (not d or c or b or a);
end cpos;