library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- for to_unsigned

-- declare entity
entity therm2gray is
	port (
	therm : in std_logic_vector(6 downto 0); -- thermometer code
	gray : out std_logic_vector(2 downto 0) -- gray code
	);
	attribute loc : string;
	attribute loc of therm: signal is "P3,P4,P5,P6,P7,P9,P10";
	attribute loc of gray: signal is "P27,P26,P25";
end therm2gray;


-- architecture is based on a loop statement within
-- a process
architecture therm2gray3 of therm2gray is
begin
	therm2gray_loop: -- process label
	process (therm) is -- sensitive to therm array
	-- variables 
	-- int variable to hold index upto which
	-- there are 1s in the therm vector
	variable numberOf1s : integer range 0 to 7;
	-- reference variable of all 1s to compare to
	-- therm vector
	variable ref : std_logic_vector(6 downto 0);
	begin -- begin process
		numberOf1s := 0; -- set index of 1s to 0
		ref := "1111111"; -- set reference variable to all 1s
		-- logic: 00 -> 0, 01 -> 1, 03 -> 3, 07 -> 2,
		-- 0F -> 6, 1F -> 7, 3F -> 5, 7F -> 4
		-- loop statement
		for i in 6 downto 0 loop
			-- if statement checks down to which index
			-- is there all 1s in the therm vector
			if (therm(i downto 0) = ref(i downto 0)) then
				numberOf1s := i + 1; -- sets the numberOf1s to index + 1
				exit;
			else
				null; -- don't do anything otherwise
			end if; -- end if
		end loop; -- end loop
		-- if/else block sets the value of gray vector
		-- based on numberOf1s variable
		if (numberOf1s = 0) then
			gray <= "000";
		elsif (numberOf1s = 1) then
			gray <= "001";
		elsif (numberOf1s = 2) then
			gray <= "011";
		elsif (numberOf1s = 3) then
			gray <= "010";
		elsif (numberOf1s = 4) then
			gray <= "110";
		elsif (numberOf1s = 5) then
			gray <= "111";
		elsif (numberOf1s = 6) then
			gray <= "101";
		elsif (numberOf1s = 7) then
			gray <= "100";
		else -- don't care otherwise
			gray <= "---";
		end if; -- end if
	end process therm2gray_loop; -- end process
end therm2gray3; -- end architecture