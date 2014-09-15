use work.libv.all;

entity tb_libv is  
end entity tb_libv;

architecture test of tb_libv is
begin  -- architecture test
    process is
    begin
        assert num_chars(1) = 1 report "Num chars wrong" severity error;
        assert num_chars(-1) = 2 report "Num chars wrong" severity error;
        assert num_chars(9) = 1 report "Num chars wrong" severity error;
        assert num_chars(-9) = 2 report "Num chars wrong" severity error;
        assert num_chars(19) = 2 report "Num chars wrong" severity error;
        assert num_chars(-99) = 3 report "Num chars wrong" severity error;
        assert num_chars(1999) = 4 report "Num chars wrong" severity error;
        assert num_chars(-9999) = 5 report "Num chars wrong" severity error;

        assert number_of_bits(1) = 1 report "num bits wrong" severity error;
        assert number_of_bits(2) = 2 report "num bits wrong" severity error;
        assert number_of_bits(3) = 2 report "num bits wrong" severity error;
        assert number_of_bits(7) = 3 report "num bits wrong" severity error;
        assert number_of_bits(8) = 4 report "num bits wrong" severity error;
        assert number_of_bits(200) = 8 report "num bits wrong" severity error;
        assert number_of_bits(1200) = 11 report "num bits wrong" severity error;

        assert str(  0) = "0" report "str(int) wrong" severity error;
        assert str( 10) = "10" report "str(int) wrong" severity error;
        assert str(-10) = "-10" report "str(int) wrong" severity error;
        assert str(  0,1) = "0" report "str(int) wrong" severity error;
        assert str(  0,2) = " 0" report "str(int) wrong" severity error;
        assert str( 10,1) = "10" report "str(int) wrong" severity error;
        assert str(-10,1) = "-10" report "str(int) wrong" severity error;
        assert str( 10,4) = "  10" report "str(int) wrong" severity error;
        assert str(-10,4) = " -10" report "str(int) wrong" severity error;

        assert str(false) = "false" report "str(boolean) wrong" severity error;
        assert str(true)  = "true" report "str(boolean) wrong" severity error;
        assert str(false, 1) = "F" report "str(boolean) wrong" severity error;
        assert str(true, 1)  = "T" report "str(boolean) wrong" severity error;
        report test'path_name & "Tests complete" severity note;
        wait;
    end process;
end architecture test;
