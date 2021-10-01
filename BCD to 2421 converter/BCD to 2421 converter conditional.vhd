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

-- Conditional Signal Assigment implementation of BCD to 2421 Converter
-- Sets the outputs to 1 when the given conditions are true, 0
-- otherwise.
architecture conditional of converter_bcd_2421 is
begin
	p <= '1' when (d = '0' and c = '1' and b = '0' and a = '1') else
		'1' when (d = '0' and c = '1' and b = '1' and a = '0') else
		'1' when (d = '0' and c = '1' and b = '1' and a = '1') else
		'1' when (d = '1' and c = '0' and b = '0' and a = '0') else
		'1' when (d = '1' and c = '0' and b = '0' and a = '1') else
		'-' when ((d = '1' and b = '1') or (d = '1' and c = '1')) else
		'0';
		
	q <= '1' when (d = '0' and c = '1' and b = '0' and a = '0') else
		'1' when (d = '0' and c = '1' and b = '1' and a = '0') else
		'1' when (d = '0' and c = '1' and b = '1' and a = '1') else
		'1' when (d = '1' and c = '0' and b = '0' and a = '0') else
		'1' when (d = '1' and c = '0' and b = '0' and a = '1') else
		'-' when ((d = '1' and b = '1') or (d = '1' and c = '1')) else	
		'0';
		
	r <= '1' when (d = '0' and c = '0' and b = '1' and a = '0') else
		'1' when (d = '0' and c = '0' and b = '1' and a = '1') else
		'1' when (d = '0' and c = '1' and b = '0' and a = '1') else
		'1' when (d = '1' and c = '0' and b = '0' and a = '0') else
		'1' when (d = '1' and c = '0' and b = '0' and a = '1') else
		'-' when ((d = '1' and b = '1') or (d = '1' and c = '1')) else	
		'0';		

	s <= '1' when (d = '0' and c = '0' and b = '0' and a = '1') else
		'1' when (d = '0' and c = '0' and b = '1' and a = '1') else
		'1' when (d = '0' and c = '1' and b = '0' and a = '1') else
		'1' when (d = '0' and c = '1' and b = '1' and a = '1') else
		'1' when (d = '1' and c = '0' and b = '0' and a = '1') else
		'-' when ((d = '1' and b = '1') or (d = '1' and c = '1')) else	
		'0';
end conditional;