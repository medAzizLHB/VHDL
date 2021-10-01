library ieee;
use ieee.std_logic_1164.all;

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

-- architecture is based on a case statement within
-- a process
architecture therm2gray2 of therm2gray is
begin
	therm2gray_case: -- process label
	process (therm) is -- sensitive to therm array
	begin -- begin process
		case therm is
		-- 0000000 -> 000
		when "0000000" =>
			gray <= "000";
		-- 0000001 -> 001
		when "0000001" =>
			gray <= "001";
		-- 0000011 -> 011
		when "0000011" =>
			gray <= "011";
		-- 0000111 -> 010
		when "0000111" =>
			gray <= "010";
		-- 0001111 -> 110
		when "0001111" =>
			gray <= "110";
		-- 0011111 -> 111
		when "0011111" =>
			gray <= "111";
		-- 0111111 -> 101
		when "0111111" =>
			gray <= "101";
		-- 1111111 -> 100
		when "1111111" =>
			gray <= "100";
		-- else, don't care
		when others =>
			gray <= "---";
		end case;
	end process therm2gray_case; -- end process
end therm2gray2; -- end architecture