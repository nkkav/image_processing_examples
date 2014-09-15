library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.libv.all;
use work.ppm.all;

entity tb_ppm_tpat is
  generic (
    WIDTH  : integer := 320;
    HEIGHT : integer := 240
  );
end entity tb_ppm_tpat;

architecture test of tb_ppm_tpat is
  constant C_NOIR     : integer :=   0;
  constant C_BLUE     : integer :=   1;
  constant C_GREEN    : integer :=   2;
  constant C_CYAN     : integer :=   3;
  constant C_RED      : integer :=   4;
  constant C_MAGENTA  : integer :=   5;
  constant C_YELLOW   : integer :=   6;
  constant C_WHITE    : integer :=   7;
  --
  constant LOVAL      : integer :=   0;
  constant HIVAL      : integer := 255;
  --
  constant R          : integer :=   0;
  constant G          : integer :=   1;
  constant B          : integer :=   2;
begin

  patterns_proc : process is
    variable imgdata  : pixel_array(0 to WIDTH-1, 0 to HEIGHT-1, 0 to 2) := (others => (others => (others => 0)));
    variable DEPTH    : integer := 4;
    variable B_WIDTH  : integer := 4; -- 4 for 320x240, 5 for 640x480 and 800x600
    variable B_OFFSET : integer := 2**(B_WIDTH+2); -- 64 for B_WIDTH=4, 128 for B_WIDTH=5
    variable x_ofst   : integer;
    variable x, y     : integer;
  begin    
    --
    for y in 0 to HEIGHT-1 loop
      for x in 0 to WIDTH-1 loop
        x_ofst := x - B_OFFSET;
        --
        if (y < HEIGHT/2) then
          if ((x >= 0) and (x < WIDTH/8)) then
            -- WHITE
            imgdata(x, y, R) := HIVAL;
            imgdata(x, y, G) := HIVAL;
            imgdata(x, y, B) := HIVAL;
          elsif ((x >= WIDTH/8) and (x < 2*WIDTH/8)) then
            -- YELLOW 
            imgdata(x, y, R) := HIVAL;
            imgdata(x, y, G) := HIVAL;
            imgdata(x, y, B) := LOVAL;
          elsif ((x >= 2*WIDTH/8) and (x < 3*WIDTH/8)) then
            -- CYAN
            imgdata(x, y, R) := LOVAL;
            imgdata(x, y, G) := HIVAL;
            imgdata(x, y, B) := HIVAL;
          elsif ((x >= 3*WIDTH/8) and (x < 4*WIDTH/8)) then
            -- GREEN
            imgdata(x, y, R) := LOVAL;
            imgdata(x, y, G) := HIVAL;
            imgdata(x, y, B) := LOVAL;
          elsif ((x >= 4*WIDTH/8) and (x < 5*WIDTH/8)) then
            -- MAGENTA
            imgdata(x, y, R) := HIVAL;
            imgdata(x, y, G) := LOVAL;
            imgdata(x, y, B) := HIVAL;
          elsif ((x >= 5*WIDTH/8) and (x < 6*WIDTH/8)) then
            -- RED
            imgdata(x, y, R) := HIVAL;
            imgdata(x, y, G) := LOVAL;
            imgdata(x, y, B) := LOVAL;
          elsif ((x >= 6*WIDTH/8) and (x < 7*WIDTH/8)) then
            -- BLUE
            imgdata(x, y, R) := LOVAL;
            imgdata(x, y, G) := LOVAL;
            imgdata(x, y, B) := HIVAL;
          elsif ((x >= 7*WIDTH/8) and (x < 8*WIDTH/8)) then
            -- NOIR
            imgdata(x, y, R) := LOVAL;
            imgdata(x, y, G) := LOVAL;
            imgdata(x, y, B) := LOVAL;
          end if;        
        else                
          if ((y >= 4*HEIGHT/8) and (y < 5*HEIGHT/8)) then
            -- ALL GREYS
            if (x < B_OFFSET) then 
              imgdata(x, y, R) := LOVAL;
            else
              imgdata(x, y, R) := (x_ofst/(2**B_WIDTH)) * (2**B_WIDTH);
            end if;
            if (x < B_OFFSET) then 
              imgdata(x, y, G) := LOVAL;
            else
              imgdata(x, y, G) := (x_ofst/(2**B_WIDTH)) * (2**B_WIDTH);
            end if;
            if (x < B_OFFSET) then 
              imgdata(x, y, B) := LOVAL;
            else
              imgdata(x, y, B) := (x_ofst/(2**B_WIDTH)) * (2**B_WIDTH);
            end if;
          elsif ((y >= 5*HEIGHT/8) and (y < 6*HEIGHT/8)) then
            -- ALL REDS
            if (x < B_OFFSET) then 
              imgdata(x, y, R) := LOVAL;
            else
              imgdata(x, y, R) := (x_ofst/(2**B_WIDTH)) * (2**B_WIDTH);
            end if;
            imgdata(x, y, G) := LOVAL;
            imgdata(x, y, B) := LOVAL;
          elsif ((y >= 6*HEIGHT/8) and (y < 7*HEIGHT/8)) then
            -- ALL GREENS
            imgdata(x, y, R) := LOVAL;
            if (x < B_OFFSET) then 
              imgdata(x, y, G) := LOVAL;
            else
              imgdata(x, y, G) := (x_ofst/(2**B_WIDTH)) * (2**B_WIDTH);
            end if;
            imgdata(x, y, B) := LOVAL;
          elsif ((y >= 7*HEIGHT/8) and (y < 8*HEIGHT/8)) then
            -- ALL BLUES
            imgdata(x, y, R) := LOVAL;
            imgdata(x, y, G) := LOVAL;
            if (x < B_OFFSET) then 
              imgdata(x, y, B) := LOVAL;
            else
              imgdata(x, y, B) := (x_ofst/(2**B_WIDTH)) * (2**B_WIDTH);
            end if;
          end if;
        end if;
      end loop;  -- y
    end loop;  -- x
    ppm_write("tpat_write.ppm", imgdata);
    report "End of tests" severity note;
    wait;
  end process patterns_proc;

end architecture test;
