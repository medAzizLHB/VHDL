library ieee;
use ieee.std_logic_1164.all;

entity NAND_Gate is
port(a,b: in std_logic;
	 y : out std_logic);
	 end entity;

architecture arch of NAND_Gate is
begin

y<=	a nand b;
end arch; 