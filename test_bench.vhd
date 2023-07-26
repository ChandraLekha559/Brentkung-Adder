library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
entity test_bench is 

end entity;
architecture stimulus of test_bench is 
signal a, b :  STD_LOGIC_VECTOR(15 downto 0);
signal Cin:  STD_LOGIC;

signal  sum , expect_sum:  STD_LOGIC_VECTOR(15 downto 0);
 signal  Cout ,expect_carry :  STD_LOGIC;
 --file f1_inp : text is in "input_file.txt";
 
begin
order1_inst : entity work.brent_kung(structural)
                port map( a,b,Cin,cout,sum);
					 

		 

tb : process
 variable v_inp1 , v_inp2 : std_logic_vector(15 downto 0);
 variable v_sum , v_expect_sum: std_logic_vector(15 downto 0);
 variable v_carry , v_expect_carry : std_logic ;
 file f1_inp : text is in "C:\Users\chand\OneDrive\Desktop\quart\vlsi_assignment\test_data.txt";
  variable v_line_in1 : line;
  begin

  while ( not endfile (f1_inp)) loop
  
readline (f1_inp,v_line_in1);
read (v_line_in1 , v_inp1);
read (v_line_in1 , v_inp2);
read (v_line_in1 , v_carry);
read (v_line_in1 , v_expect_sum);
read (v_line_in1 , v_expect_carry);
	
	
	a<= v_inp1; b <= v_inp2 ; Cin <= v_carry ; expect_sum <= v_expect_sum ; expect_carry <= v_expect_carry;
	wait for 10 ns;

	assert (expect_carry= Cout ) report "mismatch of carry" severity failure ;
	assert (expect_sum = sum ) report "mismatch of sum" severity failure ;
	end loop;
	report "success" severity note ;
	file_close (f1_inp);
		wait  ;
  end process tb;
end architecture;