library ieee;
use ieee.std_logic_1164.all;

entity carry_sum is 
	port(gi, pi, ci : in std_logic;
	     ci1, si1   : out std_logic);
end entity;

architecture dataflow of carry_sum is
	
	component a_or_bc is
		port(a, b, c : in std_logic;
			  y 		 : out std_logic);
	end component;

	component xor_gate is 
		port(a, b : in std_logic;
			  y 	 : out std_logic);
	end component; 
	
	begin
	
		sum   : a_or_bc port map (gi, pi, ci, ci1);
		carry : xor_gate port map (pi, ci, si1);
		
end architecture;
