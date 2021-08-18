library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_adder is
    port(
        a,b  : in  unsigned(3 downto 0); -- input numbers.
        carry_in : in std_logic;
        sum  : out  unsigned(3 downto 0); 
        carry : out std_logic  
    );
end bcd_adder;

architecture arch of bcd_adder is


begin

process(a,b)
variable sum_temp : unsigned(4 downto 0);
begin
    sum_temp := ('0' & a) + ('0' & b) + ("0000" & carry_in); 
    if(sum_temp > 9) then
        carry <= '1';
        sum <= resize((sum_temp + "00110"),4);
    else
        carry <= '0';
        sum <= sum_temp(3 downto 0);
    end if; 
end process;  
end architecture; 