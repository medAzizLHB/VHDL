library IEEE;

use IEEE.std_logic_1164.all;

use IEEE.std_logic_arith.all;

use IEEE.std_logic_unsigned.all;

 

entity stepper is

port

(  Clk: in STD_LOGIC;-- clock I/P

   CW_CCW: in STD_LOGIC;-- direction control

   Rs : in STD_LOGIC;-- system reset

   Step_En:in STD_LOGIC;-- step enable

   FS_HS:in STD_LOGIC;-- Half step / Full step control

   W1, W2, W3, W4: out STD_LOGIC); -- Winding o/ps

end stepper;

 

architecture behave of stepper is

signal div: std_logic_vector(16 downto 0);-- clock divider

signal clk_s: std_logic;-- divided clock signal

type state is(reset,first, second, third, fourth, half1,half2,half3,half4);

signal  Ps_state, Nx_state : state;

signal  motor:std_logic_vector(3 downto 0);

begin

 

process (Clk,rst)

begin

if Rst = '0' then    -----starting process

div <=  (others=>'0');

elsif  Clk'event and Clk='1' then

div  <=  div + 1;

end if;

end process;

 

------------------------------------------------------------------------

-- divided clock signal

-- change this value to control the speed of motor.

clk_s <= div(16);

 

process (clk_s,rst)

begin

if Rst = '0' then

Ps_state <= reset;

elsif clk_s'event and clk_s='1' then

if Step_en = '1' then

Ps_state <= Nx_state;

end if;

end if;

end process;

 

process (ps_state,CW_CCW,Step_en,rst,FS_HS)

begin

case(ps_state) is

when reset  =>                                                        

Nx_state  <= first;

when first  =>                                                        

if FS_HS = '0' then ---FS_HS='1' then HALF STEPs

if CW_CCW = '1' then

Nx_state <= second;   ----assigning each step of motor rotation

else

Nx_state  <= fourth;

end if;

else

if CW_CCW = '1' then

Nx_state  <= half1;

else

Nx_state  <= half4;

end if;

end if;

when half1 =>                                                         

if CW_CCW = '1' then

Nx_state  <= second;

else

Nx_state  <= first;

end if;

when second  =>                                                       

if FS_HS = '0' then-- FS_HS='1' then HALF STEPs

if CW_CCW = '1' then

Nx_state  <= third;

else

Nx_state  <= first;

end if;

else

if CW_CCW = '1' then

Nx_state  <= half2;

else

Nx_state  <= half1;

end if;

end if;

when half2  =>                                                        

if CW_CCW = '1' then

Nx_state  <= third;

else

Nx_state  <= second;

end if;

when third =>                                                         

if FS_HS = '0' then -- FS_HS='1' then HALF STEPs

if CW_CCW = '1' then

Nx_state <= fourth;

else

Nx_state  <= second;

end if;

else

if CW_CCW = '1' then

Nx_state  <= half3;

else

Nx_state  <= half2;

end if;

end if;

when half3  =>                                                        

if CW_CCW = '1' then

Nx_state  <= fourth;

else

Nx_state  <= third;

end if;

when fourth =>                                                        

if FS_HS = '0' then  -- FS_HS='1' then HALF STEPs

if CW_CCW = '1' then

Nx_state  <= first;

else

Nx_state  <= third;

end if;

else

if CW_CCW = '1' then

Nx_state  <= half4;

else

Nx_state  <= half3;

end if;

end if;

when half4  =>                                                        

if CW_CCW = '1' then

Nx_state  <= first;

else

Nx_state  <= fourth;

end if;

when others  => Nx_state  <= reset;

end case;

end process;

------------------------------------------------------------------------

-- Assigning O/Ps

W4  <= motor(3);

W3  <= motor(2);

W2  <= motor(1);

W1  <= motor(0);

------------------------------------------------------------------------

process(ps_state)

begin

case  ps_state is

when reset  =>

Motor  <= "0000";    ----assigning motor control on/off

when first  =>                                                        

Motor <= "1000";

when half1 =>                                                         

Motor  <= "1100";

when second  =>                                                       

Motor  <= "0100";

when half2  =>                                                        

Motor  <= "0110";

when third  =>

Motor  <= "0010";

when half3  =>                                                        

Motor  <= "0011";

when fourth  =>                                                       

Motor <= "0001";

when half4 =>

Motor <= "1001";

when others =>

Motor <= "0000";

end case;

end process;

------------------------------------------------------------------------

end behave;