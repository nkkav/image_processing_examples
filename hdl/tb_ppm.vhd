use work.libv.all;
use work.ppm.all;

entity tb_ppm is
end entity tb_ppm;

architecture test of tb_ppm is
begin  -- architecture test
    test1 : process is
        variable i : pixel_array_ptr;
        -- Without the transpose function, we would have to present the initialisation data in a non-intuitive way.
        constant testdata : pixel_array(0 to 7, 0 to 3, 0 to 2) := transpose(pixel_array'(
            ((000, 000, 000), (027, 027, 027), (062, 062, 062), (095, 095, 095), (130, 130, 130), (163, 163, 163), (198, 198, 198), (232, 232, 232)),
            ((000, 000, 000), (000, 000, 000), (000, 000, 000), (000, 000, 000), (000, 000, 000), (000, 000, 000), (000, 000, 000), (000, 000, 000)),
            ((255, 255, 255), (255, 255, 255), (255, 255, 255), (255, 255, 255), (255, 255, 255), (255, 255, 255), (255, 255, 255), (255, 255, 255)),
            ((100, 100, 100), (100, 100, 100), (100, 100, 100), (100, 100, 100), (100, 100, 100), (255, 255, 255), (255, 255, 255), (255, 255, 255)))
        );
        variable blacksquare : pixel_array(0 to 7, 0 to 7, 0 to 2) := (others => (others => (others => 0)));
    begin  -- process test1
          -- test on a proper image
        i := ppm_read("testimage_ascii.ppm");
        assert i /= null report "pixels are null" severity error;
        assert_equal("ASCII ppm Width", i.all'length(1), 8);
        assert_equal("ASCII ppm Height", i.all'length(2), 4);
        assert_equal("ASCII ppm data", i.all, testdata);

          -- make sure we return a non-image for the binary-style ppm file
        i := ppm_read("testimage.ppm");
        assert i = null report "Binary pixels should be null" severity error;
        
        --
        for i in 0 to 7 loop
          for j in 0 to 7 loop
            for k in 1 to 2 loop
              blacksquare(i, j, k) := 192;
            end loop; -- k
          end loop; -- j
        end loop; -- i

        -- Now create an image from scratch - a letter M
        blacksquare(1, 1, 0) := 255; blacksquare(5, 1, 0) := 255;
        blacksquare(1, 2, 0) := 255; blacksquare(2, 2, 0) := 255; blacksquare(4, 2, 0) := 255; blacksquare(5, 2, 0) := 255;
        blacksquare(1, 3, 0) := 255; blacksquare(3, 3, 0) := 255; blacksquare(5, 3, 0) := 255;
        blacksquare(1, 4, 0) := 255; blacksquare(5, 4, 0) := 255;
        blacksquare(1, 5, 0) := 255; blacksquare(5, 5, 0) := 255;
        blacksquare(1, 6, 0) := 255; blacksquare(5, 6, 0) := 255;
        ppm_write("test_write.ppm", blacksquare);
        report "End of tests" severity note;
        wait;
    end process test1;

end architecture test;
