# Lab 2: IVO DOVIČÁK

### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater than:

   ![K-maps](kmap_greater.png)

   Less than:

   ![K-maps](kmap_lower.png)

2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![greater_fun](greaterSOP.png)
   ![less_fun](lessPoS.png)

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx??**

```vhdl
   p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;
		
        -- ID 230 243
        -- BCD1: 0100 (4)
        -- BCD2: 0011 (3)
        -- 1. test case
        s_b <= "0100";
        s_a <= "0011"; 
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        report "Input combination b=0100, a=0011 FAILED" severity error;

	   
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Text console screenshot during your simulation, including reports.

   ![console](console.png)

3. Link to your public EDA Playground example:

   [https://www.edaplayground.com/x/9EZJ](https://www.edaplayground.com/x/9EZJ)
