use work.libv.all;
use work.pbm.all;

entity tb_pbm is
end entity tb_pbm;

architecture test of tb_pbm is
begin  -- architecture test
    test1 : process is
        variable i : pixel_array_ptr;
        -- Without the transpose function, we would have to present the initialisation data in a non-intuitive way.
        constant testdata : pixel_array(0 to 7, 0 to 3) := transpose(pixel_array'(
            (0, 0, 0, 0, 0, 0, 0, 0),
            (0, 1, 1, 1, 1, 1, 1, 0),
            (0, 1, 1, 1, 1, 1, 1, 0),
            (0, 0, 0, 0, 0, 0, 0, 0))
        );
        variable blacksquare : pixel_array(0 to 7, 0 to 7) := (others => (others => 1));
    begin  -- process test1
          -- test on a proper image
        i := pbm_read("testimage.pbm");
        assert i /= null report "pixels are null" severity error;
        assert_equal("ASCII pbm Width", i.all'length(1), 8);
        assert_equal("ASCII pbm Height", i.all'length(2), 4);
        assert_equal("ASCII pbm data", i.all, testdata);

          -- make sure we return a non-image for the binary-style pbm file
--        i := pbm_read("testimage.pbm");
--        assert i = null report "Binary pixels should be null" severity error;

        -- Now create an image from scratch - a letter M
        blacksquare(1, 1) := 0; blacksquare(5, 1) := 0;
        blacksquare(1, 2) := 0; blacksquare(2, 2) := 0; blacksquare(4, 2) := 0; blacksquare(5, 2) := 0;
        blacksquare(1, 3) := 0; blacksquare(3, 3) := 0; blacksquare(5, 3) := 0;
        blacksquare(1, 4) := 0; blacksquare(5, 4) := 0;
        blacksquare(1, 5) := 0; blacksquare(5, 5) := 0;
        blacksquare(1, 6) := 0; blacksquare(5, 6) := 0;
        pbm_write("test_write.pbm", blacksquare);
        report "End of tests" severity note;
        wait;
    end process test1;

end architecture test;
