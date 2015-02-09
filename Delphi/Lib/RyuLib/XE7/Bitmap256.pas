unit Bitmap256;

interface

uses
  Windows, Classes, SysUtils, Graphics;

const
  /// R, G, B, 휘도=GetLuminance(r,g,b)
  PALETTE_256 : array [0..255, 0..3] of byte = (
    (0, 0, 0, 0), (0, 0, 102, 12), (0, 0, 204, 25), (0, 23, 51, 17), (0, 23, 153, 30), (0, 23, 255, 43), (0, 46, 0, 23), (0, 46, 102, 35),
    (0, 46, 204, 48), (0, 69, 51, 40), (0, 69, 153, 53), (0, 69, 255, 66), (0, 92, 0, 46), (0, 92, 102, 58), (0, 92, 204, 71), (0, 115, 51, 63),
    (0, 115, 153, 76), (0, 115, 255, 89), (0, 139, 0, 69), (0, 139, 102, 82), (0, 139, 204, 95), (0, 162, 51, 87), (0, 162, 153, 100), (0, 162, 255, 112),
    (0, 185, 0, 92), (0, 185, 102, 105), (0, 185, 204, 118), (0, 208, 51, 110), (0, 208, 153, 123), (0, 208, 255, 135), (0, 231, 0, 115), (0, 231, 102, 128),
    (0, 231, 204, 141), (0, 255, 51, 133), (0, 255, 153, 146), (0, 255, 255, 159), (42, 0, 51, 16), (42, 0, 153, 29), (42, 0, 255, 42), (42, 23, 0, 22),
    (42, 23, 102, 34), (42, 23, 204, 47), (42, 46, 51, 39), (42, 46, 153, 52), (42, 46, 255, 65), (42, 69, 0, 45), (42, 69, 102, 57), (42, 69, 204, 70),
    (42, 92, 51, 62), (42, 92, 153, 75), (42, 92, 255, 88), (42, 115, 0, 68), (42, 115, 102, 80), (42, 115, 204, 93), (42, 139, 51, 86), (42, 139, 153, 99),
    (42, 139, 255, 111), (42, 162, 0, 91), (42, 162, 102, 104), (42, 162, 204, 117), (42, 185, 51, 109), (42, 185, 153, 122), (42, 185, 255, 134), (42, 208, 0, 114),
    (42, 208, 102, 127), (42, 208, 204, 140), (42, 231, 51, 132), (42, 231, 153, 145), (42, 231, 255, 157), (42, 255, 0, 138), (42, 255, 102, 150), (42, 255, 204, 163),
    (85, 0, 0, 21), (85, 0, 102, 34), (85, 0, 204, 46), (85, 23, 51, 39), (85, 23, 153, 51), (85, 23, 255, 64), (85, 46, 0, 44), (85, 46, 102, 57),
    (85, 46, 204, 69), (85, 69, 51, 62), (85, 69, 153, 74), (85, 69, 255, 87), (85, 92, 0, 67), (85, 92, 102, 80), (85, 92, 204, 92), (85, 115, 51, 85),
    (85, 115, 153, 97), (85, 115, 255, 110), (85, 139, 0, 90), (85, 139, 102, 103), (85, 139, 204, 116), (85, 162, 51, 108), (85, 162, 153, 121), (85, 162, 255, 134),
    (85, 185, 0, 113), (85, 185, 102, 126), (85, 185, 204, 139), (85, 208, 51, 131), (85, 208, 153, 144), (85, 208, 255, 157), (85, 231, 0, 136), (85, 231, 102, 149),
    (85, 231, 204, 162), (85, 255, 51, 155), (85, 255, 153, 167), (85, 255, 255, 180), (127, 0, 51, 38), (127, 0, 153, 50), (127, 0, 255, 63), (127, 23, 0, 43),
    (127, 23, 102, 56), (127, 23, 204, 68), (127, 46, 51, 61), (127, 46, 153, 73), (127, 46, 255, 86), (127, 69, 0, 66), (127, 69, 102, 79), (127, 69, 204, 91),
    (127, 92, 51, 84), (127, 92, 153, 96), (127, 92, 255, 109), (127, 115, 0, 89), (127, 115, 102, 102), (127, 115, 204, 114), (127, 139, 51, 107), (127, 139, 153, 120),
    (127, 139, 255, 133), (127, 162, 0, 112), (127, 162, 102, 125), (127, 162, 204, 138), (127, 185, 51, 130), (127, 185, 153, 143), (127, 185, 255, 156), (127, 208, 0, 135),
    (127, 208, 102, 148), (127, 208, 204, 161), (127, 231, 51, 153), (127, 231, 153, 166), (127, 231, 255, 179), (127, 255, 0, 159), (127, 255, 102, 172), (127, 255, 204, 184),
    (170, 0, 0, 42), (170, 0, 102, 55), (170, 0, 204, 68), (170, 23, 51, 60), (170, 23, 153, 73), (170, 23, 255, 85), (170, 46, 0, 65), (170, 46, 102, 78),
    (170, 46, 204, 91), (170, 69, 51, 83), (170, 69, 153, 96), (170, 69, 255, 108), (170, 92, 0, 88), (170, 92, 102, 101), (170, 92, 204, 114), (170, 115, 51, 106),
    (170, 115, 153, 119), (170, 115, 255, 131), (170, 139, 0, 112), (170, 139, 102, 124), (170, 139, 204, 137), (170, 162, 51, 129), (170, 162, 153, 142), (170, 162, 255, 155),
    (170, 185, 0, 135), (170, 185, 102, 147), (170, 185, 204, 160), (170, 208, 51, 152), (170, 208, 153, 165), (170, 208, 255, 178), (170, 231, 0, 158), (170, 231, 102, 170),
    (170, 231, 204, 183), (170, 255, 51, 176), (170, 255, 153, 189), (170, 255, 255, 201), (212, 0, 51, 59), (212, 0, 153, 72), (212, 0, 255, 84), (212, 23, 0, 64),
    (212, 23, 102, 77), (212, 23, 204, 90), (212, 46, 51, 82), (212, 46, 153, 95), (212, 46, 255, 107), (212, 69, 0, 87), (212, 69, 102, 100), (212, 69, 204, 113),
    (212, 92, 51, 105), (212, 92, 153, 118), (212, 92, 255, 130), (212, 115, 0, 110), (212, 115, 102, 123), (212, 115, 204, 136), (212, 139, 51, 128), (212, 139, 153, 141),
    (212, 139, 255, 154), (212, 162, 0, 134), (212, 162, 102, 146), (212, 162, 204, 159), (212, 185, 51, 151), (212, 185, 153, 164), (212, 185, 255, 177), (212, 208, 0, 157),
    (212, 208, 102, 169), (212, 208, 204, 182), (212, 231, 51, 174), (212, 231, 153, 187), (212, 231, 255, 200), (212, 255, 0, 180), (212, 255, 102, 193), (212, 255, 204, 206),
    (255, 0, 0, 63), (255, 0, 102, 76), (255, 0, 204, 89), (255, 23, 51, 81), (255, 23, 153, 94), (255, 23, 255, 107), (255, 46, 0, 86), (255, 46, 102, 99),
    (255, 46, 204, 112), (255, 69, 51, 104), (255, 69, 153, 117), (255, 69, 255, 130), (255, 92, 0, 109), (255, 92, 102, 122), (255, 92, 204, 135), (255, 115, 51, 127),
    (255, 115, 153, 140), (255, 115, 255, 153), (255, 139, 0, 133), (255, 139, 102, 146), (255, 139, 204, 158), (255, 162, 51, 151), (255, 162, 153, 163), (255, 162, 255, 176),
    (255, 185, 0, 156), (255, 185, 102, 169), (255, 185, 204, 181), (255, 208, 51, 174), (255, 208, 153, 186), (255, 208, 255, 199), (255, 231, 0, 179), (255, 231, 102, 192),
    (255, 231, 204, 204), (255, 255, 51, 197), (255, 255, 153, 210), (255, 255, 255, 223), (204, 204, 204, 178), (153, 153, 153, 133), (102, 102, 102, 89), (51, 51, 51, 44)
  );

  /// 휘도로 정렬 된 팔레트
  PALETTE_256_SORTED : array [0..255, 0..3] of byte = (
    (0, 0, 0, 0), (0, 0, 102, 12), (42, 0, 51, 16), (0, 23, 51, 17), (85, 0, 0, 21), (42, 23, 0, 22), (0, 46, 0, 23), (0, 0, 204, 25),
    (42, 0, 153, 29), (0, 23, 153, 30), (42, 23, 102, 34), (85, 0, 102, 34), (0, 46, 102, 35), (127, 0, 51, 38), (85, 23, 51, 39), (42, 46, 51, 39),
    (0, 69, 51, 40), (42, 0, 255, 42), (170, 0, 0, 42), (127, 23, 0, 43), (0, 23, 255, 43), (85, 46, 0, 44), (51, 51, 51, 44), (42, 69, 0, 45),
    (0, 92, 0, 46), (85, 0, 204, 46), (42, 23, 204, 47), (0, 46, 204, 48), (127, 0, 153, 50), (85, 23, 153, 51), (42, 46, 153, 52), (0, 69, 153, 53),
    (170, 0, 102, 55), (127, 23, 102, 56), (85, 46, 102, 57), (42, 69, 102, 57), (0, 92, 102, 58), (212, 0, 51, 59), (170, 23, 51, 60), (127, 46, 51, 61),
    (42, 92, 51, 62), (85, 69, 51, 62), (0, 115, 51, 63), (255, 0, 0, 63), (127, 0, 255, 63), (85, 23, 255, 64), (212, 23, 0, 64), (42, 46, 255, 65),
    (170, 46, 0, 65), (0, 69, 255, 66), (127, 69, 0, 66), (85, 92, 0, 67), (42, 115, 0, 68), (127, 23, 204, 68), (170, 0, 204, 68), (85, 46, 204, 69),
    (0, 139, 0, 69), (42, 69, 204, 70), (0, 92, 204, 71), (212, 0, 153, 72), (127, 46, 153, 73), (170, 23, 153, 73), (85, 69, 153, 74), (42, 92, 153, 75),
    (255, 0, 102, 76), (0, 115, 153, 76), (212, 23, 102, 77), (170, 46, 102, 78), (127, 69, 102, 79), (42, 115, 102, 80), (85, 92, 102, 80), (255, 23, 51, 81),
    (0, 139, 102, 82), (212, 46, 51, 82), (170, 69, 51, 83), (212, 0, 255, 84), (127, 92, 51, 84), (170, 23, 255, 85), (85, 115, 51, 85), (42, 139, 51, 86),
    (255, 46, 0, 86), (127, 46, 255, 86), (212, 69, 0, 87), (0, 162, 51, 87), (85, 69, 255, 87), (42, 92, 255, 88), (170, 92, 0, 88), (127, 115, 0, 89),
    (0, 115, 255, 89), (102, 102, 102, 89), (255, 0, 204, 89), (212, 23, 204, 90), (85, 139, 0, 90), (170, 46, 204, 91), (42, 162, 0, 91), (127, 69, 204, 91),
    (0, 185, 0, 92), (85, 92, 204, 92), (42, 115, 204, 93), (255, 23, 153, 94), (212, 46, 153, 95), (0, 139, 204, 95), (127, 92, 153, 96), (170, 69, 153, 96),
    (85, 115, 153, 97), (42, 139, 153, 99), (255, 46, 102, 99), (212, 69, 102, 100), (0, 162, 153, 100), (170, 92, 102, 101), (127, 115, 102, 102), (85, 139, 102, 103),
    (42, 162, 102, 104), (255, 69, 51, 104), (0, 185, 102, 105), (212, 92, 51, 105), (170, 115, 51, 106), (255, 23, 255, 107), (127, 139, 51, 107), (212, 46, 255, 107),
    (85, 162, 51, 108), (170, 69, 255, 108), (255, 92, 0, 109), (127, 92, 255, 109), (42, 185, 51, 109), (0, 208, 51, 110), (85, 115, 255, 110), (212, 115, 0, 110),
    (42, 139, 255, 111), (127, 162, 0, 112), (0, 162, 255, 112), (170, 139, 0, 112), (255, 46, 204, 112), (212, 69, 204, 113), (85, 185, 0, 113), (170, 92, 204, 114),
    (42, 208, 0, 114), (127, 115, 204, 114), (0, 231, 0, 115), (85, 139, 204, 116), (255, 69, 153, 117), (42, 162, 204, 117), (212, 92, 153, 118), (0, 185, 204, 118),
    (170, 115, 153, 119), (127, 139, 153, 120), (85, 162, 153, 121), (42, 185, 153, 122), (255, 92, 102, 122), (212, 115, 102, 123), (0, 208, 153, 123), (170, 139, 102, 124),
    (127, 162, 102, 125), (85, 185, 102, 126), (42, 208, 102, 127), (255, 115, 51, 127), (0, 231, 102, 128), (212, 139, 51, 128), (170, 162, 51, 129), (255, 69, 255, 130),
    (127, 185, 51, 130), (212, 92, 255, 130), (85, 208, 51, 131), (170, 115, 255, 131), (42, 231, 51, 132), (255, 139, 0, 133), (153, 153, 153, 133), (127, 139, 255, 133),
    (0, 255, 51, 133), (85, 162, 255, 134), (212, 162, 0, 134), (42, 185, 255, 134), (0, 208, 255, 135), (170, 185, 0, 135), (255, 92, 204, 135), (127, 208, 0, 135),
    (85, 231, 0, 136), (212, 115, 204, 136), (170, 139, 204, 137), (127, 162, 204, 138), (42, 255, 0, 138), (85, 185, 204, 139), (42, 208, 204, 140), (255, 115, 153, 140),
    (0, 231, 204, 141), (212, 139, 153, 141), (170, 162, 153, 142), (127, 185, 153, 143), (85, 208, 153, 144), (42, 231, 153, 145), (0, 255, 153, 146), (212, 162, 102, 146),
    (255, 139, 102, 146), (170, 185, 102, 147), (127, 208, 102, 148), (85, 231, 102, 149), (42, 255, 102, 150), (255, 162, 51, 151), (212, 185, 51, 151), (170, 208, 51, 152),
    (127, 231, 51, 153), (255, 115, 255, 153), (212, 139, 255, 154), (170, 162, 255, 155), (85, 255, 51, 155), (255, 185, 0, 156), (127, 185, 255, 156), (85, 208, 255, 157),
    (212, 208, 0, 157), (42, 231, 255, 157), (255, 139, 204, 158), (170, 231, 0, 158), (0, 255, 255, 159), (212, 162, 204, 159), (127, 255, 0, 159), (170, 185, 204, 160),
    (127, 208, 204, 161), (85, 231, 204, 162), (42, 255, 204, 163), (255, 162, 153, 163), (212, 185, 153, 164), (170, 208, 153, 165), (127, 231, 153, 166), (85, 255, 153, 167),
    (255, 185, 102, 169), (212, 208, 102, 169), (170, 231, 102, 170), (127, 255, 102, 172), (255, 208, 51, 174), (212, 231, 51, 174), (170, 255, 51, 176), (255, 162, 255, 176),
    (212, 185, 255, 177), (204, 204, 204, 178), (170, 208, 255, 178), (127, 231, 255, 179), (255, 231, 0, 179), (85, 255, 255, 180), (212, 255, 0, 180), (255, 185, 204, 181),
    (212, 208, 204, 182), (170, 231, 204, 183), (127, 255, 204, 184), (255, 208, 153, 186), (212, 231, 153, 187), (170, 255, 153, 189), (255, 231, 102, 192), (212, 255, 102, 193),
    (255, 255, 51, 197), (255, 208, 255, 199), (212, 231, 255, 200), (170, 255, 255, 201), (255, 231, 204, 204), (212, 255, 204, 206), (255, 255, 153, 210), (255, 255, 255, 223)
  );

  {*
    휘도에 해당하는 PALETTE_256_SORTED 배열의 위치
    휘도 17에 해당하는 팔레트 정보는 PALETTE_256_SORTED[ INDEX_256[17] ] 에 있거나 뒤에 비슷한 것이 나온다.
  }
  INDEX_256 : array [0..255] of integer = (
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 1, 1, 1,
    2, 3, 3, 3, 3, 4, 5, 6,
    6, 7, 7, 7, 7, 8, 9, 9,
    9, 9, 11, 12, 12, 12, 13, 15,
    16, 16, 18, 20, 22, 23, 25, 26,
    27, 27, 28, 29, 30, 31, 31, 32,
    33, 35, 36, 37, 38, 39, 41, 44,
    46, 48, 50, 51, 54, 56, 57, 58,
    59, 61, 62, 63, 65, 66, 67, 68,
    70, 71, 73, 74, 76, 78, 81, 84,
    86, 90, 92, 95, 97, 98, 99, 101,
    103, 104, 104, 106, 108, 109, 110, 111,
    113, 115, 116, 119, 121, 124, 127, 128,
    132, 134, 137, 138, 139, 141, 143, 144,
    145, 146, 148, 150, 151, 152, 153, 155,
    157, 158, 161, 163, 164, 168, 171, 175,
    177, 178, 180, 181, 183, 185, 186, 187,
    188, 189, 192, 193, 194, 195, 196, 198,
    199, 201, 202, 204, 206, 209, 211, 214,
    215, 216, 217, 219, 220, 221, 222, 223,
    223, 225, 226, 226, 227, 227, 229, 229,
    231, 232, 234, 236, 238, 239, 240, 241,
    242, 242, 243, 244, 244, 245, 245, 245,
    246, 247, 247, 247, 247, 248, 248, 249,
    250, 251, 251, 251, 252, 252, 253, 253,
    253, 253, 254, 254, 254, 254, 254, 254,
    254, 254, 254, 254, 254, 254, 254, 255,
    255, 255, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255, 255, 255, 255, 255
  );

{*
  r,g,b 색상에 대한 휘도를 고속으로 계산한다.  근사치로써 속도에 중점으로 작성되었다.
}
function GetLuminance(r,g,b:byte):integer;

function GetIndex256(r,g,b:byte):integer;
procedure Convert32to8(ASrc,ADst:pointer; AWidth,AHeight:integer);
procedure Convert8to32(ASrc,ADst:pointer; AWidth,AHeight:integer);

implementation

function GetLuminance(r,g,b:byte):integer;
begin
  Result := ((r shl 6) + (g shl 7) + (b shl 5)) shr 8;
end;

function GetIndex256(r,g,b:byte):integer;
const
  Search_Count = 16;
var
  iR, iG, iB : byte;
  min, current : DWord;
  Loop, l, iIndex, iIndexMin : integer;
begin
  l := GetLuminance( r, g, b);

  Result := INDEX_256[l];

  iR := PALETTE_256_SORTED[Result, 0];
  iG := PALETTE_256_SORTED[Result, 1];
  iB := PALETTE_256_SORTED[Result, 2];

  if (r = iR) and (g = iG) and (b = iB) then Exit;

  Result := Result - Search_Count;
  if Result < 0 then Result := 0;

  // 가장 색상 차이가 적은 Index를 저장한다.
  iIndexMin := Result;

  // 가장 색상 차이가 작은 수치를 저장한다.  ($FFFFFF는 충분히 큰 값)
  min := $FFFFFFFF;

  for Loop := 1 to (Search_Count * 2) do begin
    iIndex := Result + Loop;
    if iIndex > 255 then Break;

    iR := PALETTE_256_SORTED[iIndex, 0];
    iG := PALETTE_256_SORTED[iIndex, 1];
    iB := PALETTE_256_SORTED[iIndex, 2];

    current := Abs(r-iR) + Abs(g-iG) + Abs(b-iB);

    if current = 0 then Break;

    if current < min then begin
      min := current;
      iIndexMin := iIndex;
    end;
  end;

  Result := iIndexMin;
end;

procedure Convert32to8(ASrc,ADst:pointer; AWidth,AHeight:integer);
var
  Loop : integer;
  pSrc : ^TRGBQuad absolute ASrc;
  pDst : PByte absolute ADst;
begin
  for Loop := 1 to AWidth*AHeight do begin
    pDst^ := GetIndex256(pSrc^.rgbRed, pSrc^.rgbGreen, pSrc^.rgbBlue);

    Inc(pSrc);
    Inc(pDst);
  end;
end;

procedure Convert8to32(ASrc,ADst:pointer; AWidth,AHeight:integer);
var
  Loop : integer;
  pSrc : PByte absolute ASrc;
  pDst : ^TRGBQuad absolute ADst;
begin
  for Loop := 1 to AWidth*AHeight do begin
    pDst^.rgbRed   := PALETTE_256_SORTED[pSrc^, 0];
    pDst^.rgbGreen := PALETTE_256_SORTED[pSrc^, 1];
    pDst^.rgbBlue  := PALETTE_256_SORTED[pSrc^, 2];

    Inc(pSrc);
    Inc(pDst);
  end;
end;

end.
