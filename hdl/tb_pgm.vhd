use work.libv.all;
use work.pgm.all;

entity tb_pgm is
end entity tb_pgm;

architecture test of tb_pgm is
begin  -- architecture test
    test1 : process is
        variable i : pixel_array_ptr;
        -- Without the transpose function, we would have to present the initialisation data in a non-intuitive way.
        constant testdata : pixel_array(0 to 7, 0 to 3) := transpose(pixel_array'(
            (000, 027, 062, 095, 130, 163, 198, 232),
            (000, 000, 000, 000, 000, 000, 000, 000),
            (255, 255, 255, 255, 255, 255, 255, 255),
            (100, 100, 100, 100, 100, 255, 255, 255))
        );
        variable blacksquare : pixel_array(0 to 7, 0 to 7) := (others => (others => 0));
    begin  -- process test1
          -- test on a proper image
        i := pgm_read("testimage_ascii.pgm");
        assert i /= null report "pixels are null" severity error;
        assert_equal("ASCII PGM Width", i.all'length(1), 8);
        assert_equal("ASCII PGM Height", i.all'length(2), 4);
        assert_equal("ASCII PGM data", i.all, testdata);

          -- make sure we return a non-image for the binary-style PGM file
        i := pgm_read("testimage.pgm");
        assert i = null report "Binary pixels should be null" severity error;

        -- Now create an image from scratch - a letter M
        blacksquare(1, 1) := 255; blacksquare(5, 1) := 255;
        blacksquare(1, 2) := 255; blacksquare(2, 2) := 255; blacksquare(4, 2) := 255; blacksquare(5, 2) := 255;
        blacksquare(1, 3) := 255; blacksquare(3, 3) := 255; blacksquare(5, 3) := 255;
        blacksquare(1, 4) := 255; blacksquare(5, 4) := 255;
        blacksquare(1, 5) := 255; blacksquare(5, 5) := 255;
        blacksquare(1, 6) := 255; blacksquare(5, 6) := 255;
        pgm_write("test_write.pgm", blacksquare);
        report "End of tests" severity note;
        wait;
    end process test1;

end architecture test;
