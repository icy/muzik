% Original sheet found from vnguitar.net
% Chậm

\version "2.18.2"

\header {
  title = "Mưa hồng"
  composer = "Trịnh Công Sơn"
  tagline = "Lilypond source prepared by Ky-Anh Huynh on 2018.08.24. License: CC BY-SA 3.0"
}

\markup { \vspace #1 }

verseI = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  trời ươm nắng cho mây hồng mây qua mau em nghiêng sầu
  còn mưa xuống như hôm nào em đến thăm mây âm thầm mang gió lên
  người ngồi đó trong mưa nguồn ôi yêu thương nghe đã buồn
  ngoài kia lá như vẫn xanh ngoài sông vắng nước dâng lên hồn muôn trùng

  này em đã khóc chiều mưa đỉnh cao còn gì nữa đâu sương mù đã lâu
  em đi về cầu mưa ướt áo đường phượng bay mù không lối vào
  hàng cây lá xanh gần với nhau
  người ngồi...
}

verseII = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  _ _ xuống mây ngang đầu mong em qua bao nhiêu chiều
  vòng tay đã xanh xao nhiều ôi tháng năm gót chân mòn trên phiếm du
  người nguồi xuống xin mưa đầy trên hai tay cơn đau này
  người nằm xuống nghe tiếng ru cuộc đời đó có bao lâu mà hững...
  \repeat unfold 40 {\skip 1}
  hờ
}

staffMelody = \relative c' {
  \time 2/4
  \autoBeamOn
  r4 r8  c'16 d16 | e4. d16 c16 | a4. c16 c16 | d4. b16 a16 | g4. g16 a16 |
     b4.  a16 g16 | f4. g16 a16 | g4. e16 d16 | c4. d16 e16 | d2~ |
   4 r8  c'16 d16 | e4. d16 c16 | a4. c16 c16 | c4. b16 a16 | g4. c,16 d16 |
     e4.  g16 a16 | g4. c,16 d16| e4. g16 e16 | d4. c16^\markup { D.S. al Coda } d16 | c2~ |

     % Nay em da khoc...
      4 \times 2/3{c'8 d8 e8} | e4 \times 2/3{g,8 c8 d8} |
     c2~ | c8 g8 a8 c8 | b8 a8 e8 a8 | g4. e16 d16 | c8 d8 e8 a8 |
     a4.
        % duong phuong bay
        g16 a16 | d8 c8 d8 e8 | a,4. b16 c16 | d8 c8 b8 d8 | c2~ | 4 r8  c16 d16 |
        \mark \markup { \musicglyph "scripts.coda" }
      c,2~ 4.
    \bar "|."
}


theChords = \chordmode {
  \include "predefined-guitar-fretboards.ly"
  \set chordChanges = ##t
  s2 c2 a2:m d2:7 g2 a2:9 d2:m g2 c2 d2:m g2:7
  c2 a2:m d2:7 g2 e2:m g2 a2:m g2
  c2 c2 e2:7 a2:m f2 e2:m g2 c2:7 f2 d2:m a2:m g2:7c2 g2:7 c2
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
    \new Lyrics = "lyricsII" {\lyricsto "voiceMelody" \verseII}
  >>
  \layout {
    indent = 0\cm
  }
}
