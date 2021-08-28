library ieee;
use ieee.std_logic_1164.all;

entity NOR_Gate is
port(a,b: in std_logic;
	 y : out std_logic);
	 end entity;

architecture arch of NOR_Gate is
begin

y<=	a nor b;
end arch; 