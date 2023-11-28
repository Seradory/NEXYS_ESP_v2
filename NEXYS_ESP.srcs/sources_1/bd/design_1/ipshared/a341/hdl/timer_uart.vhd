----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2023 21:14:56
-- Design Name: 
-- Module Name: timer_uart - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: a
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer_uart is
 Port (
 clk:in std_logic;
 rst:in std_logic;
 count_value:in std_logic_vector(31 downto 0);
 count_value_load:in std_logic;
 count_enable:in std_logic;
 interrupt:out std_logic
 
  );
end timer_uart;

architecture Behavioral of timer_uart is

signal rst_1: std_logic:='0';
signal rst_2: std_logic:='0';
signal reset_en: std_logic:='0';

signal count_en: std_logic:='0';
signal count_2: std_logic:='0';
signal count_1: std_logic:='0';

signal cvl_1: std_logic:='0';
signal cvl_2: std_logic:='0';

signal count_value_s:std_logic_vector(31 downto 0):=x"00000000";

signal counter:std_logic_vector(31 downto 0):=x"00000000";

signal count_state: std_logic_vector(1 downto 0):=(others=>'0');

signal int_1:std_logic:='0';
signal int_2:std_logic:='0';
signal int_3:std_logic:='0';
begin

reset_count:process(clk) begin
    if(rising_edge(clk)) then
        rst_1<=rst;
        rst_2<=rst_1;        
        count_1<=count_enable;
        count_2<=count_1;
        cvl_1<=count_value_load;
        cvl_2<=cvl_1;
        
        if(rst_1='1' and rst_2='0') then
            reset_en<='1';
        else
            reset_en<='0';
        end if;
        
        if(count_1='1' and count_2='0') then
            count_en<='1';
        else
            count_en<='0';
        end if;
        
        if(cvl_1='1' and cvl_2='0') then
            count_value_s<=count_value;
        else
            count_value_s<=count_value_s;
        end if;
    end if;
end process reset_count;



process(clk) begin
    if(rising_edge(clk)) then

        case count_state is
            when "00"=> --idle
                interrupt<='0';
                count_state<="00";
                counter<=x"00000000";
                if(count_en='1') then
                    count_state<="01";
                end if;
            when "01"=> --enable

                if(counter>=count_value_s) then
                    interrupt<='1';
                    counter<=x"00000000";
                    count_state<="10";
                elsif(reset_en='1') then
                    count_state<="11";
                else
                    counter <= std_logic_vector(unsigned(counter) + 1);
                    count_state<="01";
                    interrupt<='0';
                end if;
            when "10"=> -- stop
                counter<=counter;
                count_state<="00";
            when "11"=> -- reset
                interrupt<='0';
                count_state<="00";
                counter<=x"00000000";
            when others =>
           
        end case;
    end if;
end process;


end Behavioral;
