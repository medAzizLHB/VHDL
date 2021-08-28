library ieee;
use ieee.std_logic_1164.all;

entity NOT_Gate is
port(a: in std_logic;
	 y : out std_logic);
	 end entity;

architecture arch of NOT_Gate is
begin

y<=	not a;
end arch; 