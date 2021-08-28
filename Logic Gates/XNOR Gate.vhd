library ieee;
use ieee.std_logic_1164.all;

entity XNOR_Gate is
port(a,b: in std_logic;
	 y : out std_logic);
	 end entity;

architecture arch of XNOR_Gate is
begin

y<=	a xnor b;
end arch; 