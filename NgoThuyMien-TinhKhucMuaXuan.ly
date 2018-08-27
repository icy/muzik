% Original sheet found on vnguitar.net
% Dìu dặt

\version "2.19.0"

\header {
  title = "Tình khúc mùa xuân"
  composer = "Ngô Thụy Miên"
  tagline = "Lilypond source prepared by Ky-Anh Huynh on 2018.08. License: CC BY-SA 3.0"
}

\markup { \vspace #1 }

verseI = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  tình yêu đó cho em tháng năm trên từng phím xuân lay
  đóa môi xinh dòng thác mây bay
  mùa thu lá heo mây gọi về
  mùa đông nắng hanh trên tuổi thề
  mình đan nắng ru mây ước mơ xa vời
  một hôm gió xuân sang
  mây lang thang cài tóc em mang
  đến thăm êm chiều nắng miên man
  rồi thu đến sao em giận hờn
  rồi đông đến sao em lạnh lùng
  đường phố vắng thênh thang
  ru buồn gót chân
  chiều còn mưa bay
    ướt bước chân mòn lãng du
    ướt áo cho tình thắm sâu
    ướt đóa môi hồng hững hờ
  rũ ướt cung đàn buồn dâng mây tím giăng ngang
  buồn vương ân ái phai tàn
  mùa xuân đến chưa em
  bước chân ai dìu tiếng mưa đêm
  vắng xa đưa dòng tóc mây bay
  mùa thu vẫn chưa nguôi giận hờn
  mùa đông vẫn chưa thôi lạnh lùng
  giòng lá cuốn em mang
  trôi dài mãi trôi
}

staffMelody = \relative c' {
  \time 2/4
  \key g \major
  \autoBeamOn
  d8 b'4 c16 b16 | b4. a16 g16 | g8 fis4 a16 aes16 |
  g4. fis16 e16 | e8 d4 fis16 f!16 | e2~ | 2 | r4 r4 | e8 c'4 d16 c16 |
  c8 e,8 e8( ees8) | d8 b'4 c16 b16 | b8 d,8 d8( des8) | c8 a'4 b16 a16 |
  a4 \times 2/3 {g8 fis8 e8} | d2~ | 2 | d8 b'4 c16 b16 | b4. a16 g16 |
  g8 fis4 a16 aes16 | g4. fis16 e16 | e8 d4 fis16 f!16 | e2~ | 2 |
  r4 r4 | e8 c'4 d16 c16 | c8 e,8 e8( ees8) | d8 b'4 c16 b16 |
  b8 d,8 d8( des8) | c8 a'4 b16 a16 |a4 \times 2/3 {g8 fis8 a8} | g2 |
  r8 b4 b16 d16
    \bar "||"
    \time 4/4
    d4. b8 b8 g4 d16 c'16 | a4. c8 c8 a4 fis16 d'16 |
  b4. b8 b8 g4 e16 c'16 | c2~ 8 d4 d16 c16 | b4. d,8 b'8 b4 c16 b16 |
  a4. d,8 a'8 a4 b16 a16 | g1
    \bar "||"
    \time 2/4
    r4 r4 | d8 b'4 c16 b16 |
  b4. a16 g16 | g8 fis4 a16 aes16 | g4. fis16 e16 | e8 d4 fis16 f!16 | e2~ | 2 |
  r4 r4 | e8 c'4 d16 c16 | c8 e,8 e8( ees8) | d8 b'4 c16 b16 |
  b8 d,8 d8( des8) | c8 a'4 b16 a16 | a4 \times 2/3 {g8 fis8 a8} | g2~ | 2 |

  \bar "|."
}


theChords = \chordmode {
  \include "predefined-guitar-fretboards.ly"
  \set chordChanges = ##t
  g2 | q2 | e2:m |
  q | c2 | q  | q | a2:m | q |
  q | g2 | q | a2:m |
  q | d2:7 | q | g2 | q |
  e2:m | q | c2 | q | q |
  a2:m q | q | g2 |
  q | a2:m | d2:7 | g2 |
  q2 |
  % 4/4
  g1 | a2:m d2:7 |
  g2 e2:m | c1 | g1| d1:7 | g1 |
  % 2/4
  s4 s4 | g2 | q2 |
  e2:m | q | c2 | q |
  q | a2:m | s8 a4:m s8 | q2 | g2 | q | a2:m | d2:7 | g2 | q |
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
  >>
  \layout {
    indent = 0\cm
  }
}
