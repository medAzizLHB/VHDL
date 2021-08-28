library ieee;
use ieee.std_logic_1164.all;

entity AND_Gate is
port(a,b: in std_logic;
	 y : out std_logic);
	 end entity;

architecture arch of AND_Gate is
begin

y<=	a and b;
end arch; 