library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pa1 is
    Port ( a : in std_logic_vector(3 downto 0);
           b : in std_logic_vector(3 downto 0);
           s : out std_logic_vector(3 downto 0);
           c : out std_logic;
           cin : in std_logic);
end pa1;

architecture pa11 of pa1 is

begin
process(a,b,cin)
variable u:std_logic;
begin
u:=cin;
for i in 0 to 3 loop
s(i)<=a(i) xor b(i) xor u;
u:=(a(i) and b(i))or(b(i) and u) or(u and a(i));
end loop;
c<=u;
end process;

end pa11;