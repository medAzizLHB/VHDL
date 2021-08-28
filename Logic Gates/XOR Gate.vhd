library ieee;
use ieee.std_logic_1164.all;

entity XOR_Gate is
port(a,b: in std_logic;
	 y : out std_logic);
	 end entity;

architecture arch of XOR_Gate is
begin

y<=	a xor b;
end arch; 