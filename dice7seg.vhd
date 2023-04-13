-- Ex1 Solution : dice7seg.vhd
-- -------------------------------------------
--  Seven Seg Encoder for Dice Game
-- -------------------------------------------
-- (c) ALSE - http://www.alse-fr.com
--
-- Notes :
--  * We don't ask for complete decoder, only 1..6
--  * Order is : Segout(0)=Seg_A, ... Segout(6)=Seg_G
--    Display Layout :
--
--           A=Seg(0)
--          -----
-- Seg(5)=F|     |B=Seg(1)
--         |  G  |
--          -----
--         |     |C=Seg(2)
-- Seg(4)=E|     |
--          -----
--            D=Seg(3)


Library IEEE;
    use IEEE.std_logic_1164.all;

-- ------------------------------
    Entity dice7seg is
-- ------------------------------
  port ( BCD    : in  std_logic_vector(2 downto 0); -- Expected within 1 .. 6
         SevSeg : out std_logic_vector(0 to 6)      -- Segments A, B, C, D, E, F, G
       );
end entity dice7seg;

-- -----------------------------------------------
    Architecture COMB of dice7seg is
-- ------------------------------------------------

begin

  process(BCD)
  begin
    case BCD is              --abcdefg
      when "000" => SevSeg <= "1111110";
      when "001" => SevSeg <= "0110000";
      when "010" => SevSeg <= "1101101";
      when "011" => SevSeg <= "1111001";
      when "100" => SevSeg <= "0110011";
      when "101" => SevSeg <= "1011011";
      when "110" => SevSeg <= "1011111";
      when "111" => SevSeg <= "1110000";
      when others => SevSeg <= (others => '-');
    end case;
  end process;

end architecture COMB;

