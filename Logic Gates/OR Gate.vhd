library ieee;
use ieee.std_logic_1164.all;

entity OR_Gate is
port(a,b: in std_logic;
	 y : out std_logic);
	 end entity;

architecture arch of OR_Gate is
begin

y<=	a or b;
end arch; 