#(set-global-staff-size 13)

\version "2.19.0"

\header {
  title = "nếu xa nhau"
  composer = "Đức Huy"
  tagline = "Lilypond source prepared by Ky-Anh Huynh on 2018.10. License: CC BY-SA 3.0"
}

\markup { \vspace #1 }

verseI = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  nếu xa nhau anh xin làm mây thu
  khóc em dài những tháng mưa ngâu
  mưa thu buồn buồn đời em bấy lâu
  gió thu sầu hát bài ca nhớ nhau
  nếu xa nhau anh xin làm dòng sông
  nhớ anh nhiều những thoáng mênh mông
  khúc sông buồn buồn trôi bao lá rong
  tím mây chiều lạc loài vương nhớ nhung
  cùng tháng năm mây thu trôi lững thững
  cuối trời biết bao giờ thôi phiêu lãng
  giữa thoáng mưa ngâu em có nghe chăng bài
  tình ca hôm nào anh đã hát cho em
  trời đã sang đông thôi anh làm im vắng
  những đêm dài mơ ước gió trăng biết bao giờ
  tình yêu thôi lỡ làng
  biết bao giờ đời anh thôi dở dang
  biết bao giờ tình yêu thôi lỡ làng
  biết bao giờ
  đời anh thôi dở dang

}

staffMelody = \relative c' {
  \time 4/4
  \key g \major
  \autoBeamOn
  r2 r8 d'8~ d8  b8 | b4 r8 b8 b4 a8 b8 | c2. r8 c8 |
  a2 d,8 c'8 c8 b8 | b2~ b8 r8 b8 a8 | g2 e8 fis8 g8 b8 |
  a2 r4 a8 g8 | fis4. a8 \times 2/3{d,4 a'8~} a8 c8 |
  b2 r4 d8 b8 | b4 r8 b8 b4 a8 b8 | c2. r8 c8 | a2 d,8 c'8 c8 b8 |
  b2~ b8 r8 b8 a8 | g2 e8 fis8 g8 b8 | a2 r4 a8 g8 |
  fis4. r8 d8 fis8 g8 a8 | g2. g8 b8 |
  a4. a8 a4 b8 c8 | d4. b8 g4 r4 |
  e'4. c8 a4 b8 c8 | d2 r8 d8 d8 c8 |
  b2 b8 c8 b8 a8 | g4 a8 b8~ b4 r8 b8 | a2 g8 a8 a8 g8 |
  fis2 r8 d8 d'8 c8 | b4 r8 b8 b4 a8 b8 | c2. r8 c8 |
  a2 d,8 a'8 c8 c8 | b2~ b8 r8 b8 a8 | g2 e8 fis8 g8 b8 |
  a2 r4 a8 g8 | fis4. d8 \times 2/3{fis4 g8~} g8 a8 |
  \bar ".|:"
  g2. b8 a8 | g2 e8 fis8 g8 b8 | a2 r4 a8 g8
  | fis4. d8 \times 2/3{fis4 g8~} g8 a8 |
  \bar ":|."
}


theChords = \chordmode {
  \include "predefined-guitar-fretboards.ly"
  \set chordChanges = ##t
  s1 |
  g2 aes2:dim | a1:m7 | d1 | g1 | e1:m | a1:m | d1 | g2 c2 |
  g2 aes2:dim | a1:m7 | d1 | g1 | e1:m | a1:m | d1 | g1 | a2:m d2 |
  b2:m e2:m | a2:m d2 | g1 | b1:7 | e1:m | a1 | d1 |
  g2 aes2:dim | a1:m7 | d1 | g1 | e1:m | a1:m | d1 | g1 |
  e1:m | a1:m | d:1 |
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
