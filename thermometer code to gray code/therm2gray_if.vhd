library ieee;
use ieee.std_logic_1164.all;

-- declare entity
entity therm2gray is
	port ( -- signal declarations
	-- inputs
	therm : in std_logic_vector(6 downto 0); -- thermometer code
	-- outputs
	gray : out std_logic_vector(2 downto 0) -- gray code
	);
	attribute loc : string;
	attribute loc of therm: signal is "P3,P4,P5,P6,P7,P9,P10";
	attribute loc of gray: signal is "P27,P26,P25";
end therm2gray;


-- architecture is based on a series of if/else
-- statements in a process
architecture therm2gray1 of therm2gray is
begin
	therm2gray_if: -- process label
	process (therm) is -- sensitive to therm array
	begin -- begin process
		-- 0000000 -> 000
		if therm = "0000000" then
			gray <= "000";
		-- 0000001 -> 001
		elsif therm = "0000001" then
			gray <= "001";
		-- 0000011 -> 011
		elsif therm = "0000011" then
			gray <= "011";
		-- 0000111 -> 010
		elsif therm = "0000111" then
			gray <= "010";
		-- 0001111 -> 110
		elsif therm = "0001111" then
			gray <= "110";
		-- 0011111 -> 111
		elsif therm = "0011111" then
			gray <= "111";
		-- 0111111 -> 101
		elsif therm = "0111111" then
			gray <= "101";
		-- 1111111 -> 100
		elsif therm = "1111111" then
			gray <= "100";	
		else -- else, don't care
			gray <= "---";
		end if; -- end if
	end process therm2gray_if; -- end process
end therm2gray1; -- end architecture