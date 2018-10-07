\version "2.19.0"

\header {
  title = "thu hát cho người"
  composer = "vũ đức sao biển"
  tagline = "Lilypond source prepared by Ky-Anh Huynh on 2018.10. License: CC BY-SA 3.0"
}

\markup { \vspace #1 }

verseI = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  dòng sông nào đưa người tình đi biền biệt
  mùa thu nào cho người về thăm chốn xưa
  hoàng hạc bay bay mãi bỏ trời mơ
  về đồi sim ta nhớ người vô bờ

  ta vẫn chờ em dưới gốc sim già đó
  để hái dâng người một đóa đẫm tương tư
  đêm nguyệt cầm ta gọi em trong gió
  sáng linh lan hồn ta khóc bao giờ

  ta vẫn chờ em trên bao la đồi nương
  trong mênh mông chiều sương
  giữa thu vàng bên đồi sim trái chín
  một mình ta ngồi hát tuổi thơ bay

  thời gian nào trôi bềnh bồng trên phận người
  biệt ly nào không muộn phiền trên dấu môi
  mùa vàng lên biêng biếc bóng chiều rơi
  nhạc hoài mong ta hát về xa người
  thu hát cho người
  thu hát cho người người yêu ơi
}

staffMelody = \relative c' {
  \time 4/4 \key d \minor
  \autoBeamOn
  r2.. d16 f16   | d4. f16 c16 c4. d16 a16 |
  a2. r8 d16 f16 | d4. f16 c16 c4. e16 f16 |
  d2. r8 d16 d16 | g4. g8 a4. a16 d,16 |
  f2. r8 e16 e16 | a4. g8 a4. d,16 f16 |
  d1~ | d2 r4\times 2/3 {e'8 f8 a,8} |
  d4. d8 d8 a4 f8 | a2. \times 2/3 {g8 bes8 a8} |
  d,4. f8 a8 a4 g8 | g2. r8 f16 d16 |
  d4. d8 a4. d16 e16 | f2. r8 f16 e16 |
  e4. a8 e4. g16 f16 | d1~ | d2 r4 \times 2/3 {e'8 f8 a,8} |
  d4. d8 d8 d4 g,8 | bes4. bes8 bes8 bes4 f8 |
  a2. r8 a16 f16 | d4. d8 a4.  d16 e16 |
  f2. r8 a,16 a16 | e'4. a,8 f'4. a,16 c16 | d1~ |
  d2. r8 d16 f16 |
  d4. f16 c16 c4. d16 a16 | a2. r8 d16 f16 |
  d4. f16 c16 c4. e16 f16 | d2. r8 d16 f16 |
  g4. g8 a4. a16 d,16 | f2. r8 e16 e16 |
  a4. g8 a4. d,16 f16 | d1
    \mark \markup { \musicglyph "scripts.coda" }
    \bar ":|."
  d'2 e4 \times 2/3 {e8( f8 e8)} | bes1 |
  e2 f4 \times 2/3 {e8( f8 e8)} | a,2 a4 cis4 | d1 |
}


theChords = \chordmode {
  \include "predefined-guitar-fretboards.ly"
  \set chordChanges = ##t
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
