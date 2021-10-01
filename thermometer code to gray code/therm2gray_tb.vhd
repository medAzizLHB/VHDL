library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity therm2gray_tb is
end therm2gray_tb;

architecture tb_architecture2 of therm2gray_tb is
    
    signal therm : std_logic_vector(6 downto 0);
    signal gray : std_logic_vector(2 downto 0);
    
    constant n : integer := 7;
    constant period : time := 20 ns;
    
begin
    
    UUT : entity therm2gray(structure1)
    port map (therm => therm, gray => gray);
    
    tb: process
    variable therm_var : std_logic_vector (6 downto 0);
    begin
        
        for i in 0 to 7 loop
            therm_var := "1111111" sll i;	-- VHDL 2008
            therm <= (not(therm_var));
			
            -- alternative to previous two statements
            -- set therm_var to "0000000" prior to loop
            -- then replace previous two instructions with
            -- therm <= therm_var(5 downto 0) & '1';
            
            wait for period;
        end loop;
        wait;
    end process;
    
end tb_architecture2;