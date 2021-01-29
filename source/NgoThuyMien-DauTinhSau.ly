% Ref.: http://web.archive.org/web/20181020103627/https://hopamviet.vn/sheet/song/dau-tinh-sau/W8IU0FEW.html
#(set-global-staff-size 13)

\version "2.19.0"

\header {
  title = "Dấu tình sầu"
  composer = "Ngô Thụy Miên"
  tagline = "Lilypond source prepared by Ky-Anh Huynh in 2018.08. License: CC BY-SA 3.0"
}

\markup { \vspace #1 }

verseI = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  chiều còn vương nắng để gió đi tìm
  vết bước chân em qua bao nhiêu lần
  lời ru đan ngón tay buồn
  ngàn năm cho giá băng hồn
  tuổi gầy nồng lên màu mắt

  trời còn mây tím để lá mơ
}

verseII = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  % trời còn mây tím để lá mơ
  \repeat unfold 7 { \skip 1 } nhiều
  lá khóc trên mi cho môi ươm sầu
  chiều lên đỉnh núi ngang đầu
  nhạt thương cho gót dáng
  \repeat unfold 14 { \skip 1 }
  sầu
  giận hờn xin ngập lối đi

  đàn dâng tiếng phong kín tuổi buồn
  đường hoang vắng cho lá về nguồn
  người tìm đến xin gợi nỗi buồn
  từ khi gió mang dấu địa đàng
  đường lên đá che vết nồng nàn
  người còn nhớ mãi hay quên lời

  và người tìm đến giọng hát mơ hồ
  vết bước năm xưa nay vương âm thầm
  hàng cây mơ bóng bên đường
  gọi người khi nắng phai tàn
  gọi tình yêu vào lãng quên
}

staffMelody = \relative c' {
  \time 4/4
  \autoBeamOn

  r8 c'8 c8 d8 e8 c8 d8 b8 |
  \repeat volta 2 {
    a1~ |
    a8 a8 a8 g8 g8 f8 f8 e8 |
    d1~ | d4\segno r8 d8 f8 a8 d8 c8 |
    e,4. c8 e8 a8 c8 b8 |
  }
  \alternative {
    {
      d,4. d8 e8 a8 b8 a8 | c1~ |
      c8 c8 c8 d8 e8 c8 d8 b8 |
    }
    {
      d,4. d8 e8 a8 gis8 b8 | a1~ |
      a4 r8 c16 d16 e8 d8 e8 c8
    }
  }

  c4. b16 c16 d8 c8 d8 b8 |
  b4. a16 b16 c8 b8 a8 b8 |
  d,1~ | d4 r8 b'16 c16 d8 c8 d8 b8 |
  b4. a16 b16 c8 b8 c8 a8 |
  a4. gis16 a16 b8 d8 c8 b8 |

  a1~ | a8 c8 c8 d8 e8 c8 d8 b8 |
  a1~ | a8 a8 a8 g8 g8 f8 f8 e8 |
  d1~ | d4\segno r8 d8 f8 a8 d8 c8 |
  e,4. c8 e8 a8 c8 b8 |
  d,4. d8 e8 a8 gis8 b8 |
  a1~ | a1\segno |
  \bar "|."
}


theChords = \chordmode {
  \include "predefined-guitar-fretboards.ly"
  \set chordChanges = ##t
  a1:m | a1:m | a2:m a2:7 | d1:m | d1:m | a1:m |
  d1:m | a1:m | a2:m e2:7 | d2:m e2:7 | a1:m |
  a1:m | f2 g2 | e2:m a2:m | d1:m | d2:m g2 |
  e2:m f2 | d2:m e2:7 | a1:m |
  a2:m e2:7 | a1:m | a2:m a2:7 |
  d1:m | d1:m | a1:m | d2:m e2:7 | a1:m | a1:m
}

\paper {
  left-margin = 2\cm
  right-margin = 2\cm
}

\score {
  <<
    \context ChordNames { \theChords }
    \context FretBoards { \theChords }
    \new Staff { \context Voice = "voiceMelody" { \staffMelody } }
    \new Lyrics = "lyricsI"  {\lyricsto "voiceMelody" \verseI}
    \new Lyrics = "lyricsII"  {\lyricsto "voiceMelody" \verseII}
  >>
  \layout {
    indent = 0\cm
  }
}
