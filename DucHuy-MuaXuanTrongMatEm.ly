#(set-global-staff-size 13)

% Original sheet found on vnguitar.net
% Boléro - Chậm

#(set-global-staff-size 12)

\version "2.19.0"

\header {
  title = "Mùa xuân trong đôi mắt em"
  composer = "Đức Huy"
  tagline = "Lilypond source prepared by Ky-Anh Huynh on 2018.08. License: CC BY-SA 3.0"
}

\markup { \vspace #1 }

verseI = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  \repeat unfold 12 { \skip 1 }

  thành phố này thành phố mưa bay
  như mãi mãi mùa thu trong sương mù
  từng đêm về đường ướt mưa rơi
  như nước mắt người đi qua cuộc đời

  còn hy vọng sau áng mây đen
  còn hy vọng hãy cố vươn lên
  rồi một ngày dịp may sẽ đến
  em ơi đừng quên

  thành phố này trời thấp giăng mây
  như mãi mãi mùa đông ngày qua ngày
  nhiều đêm dài chờ sáng đơn côi
  em đếm những ngày vui qua cuộc đời

  còn hy vọng sau những thương đau
  mùa đông dài đã qua còn đâu

  rồi một ngày tình yêu trở lại
  trong con tim giá băng

  và mùa xuân trong đôi mắt em
  là mùa xuân anh mãi đi tìm
  và mùa xuân trong đôi mắt em
  anh đợi mong

  và mùa xuân trong đôi mắt em
  là mùa xuân chan chứa hy vọng
  và mua xuân trong đôi mắt em
  anh mãi chờ trông
}

staffMelody = \relative c' {
  \time 4/4
  \autoBeamOn
  % intro
  a'2. r8 e16 d16 |
  e2.  r8 g16 a16 |
  b4.  c8 b8. a16~ a8 g8 |
  a2 r8
  % lyric
        a,8~ a8 c8 |
  a2 c8. f16~ f8 e8 |
  e2 r8 d8 e16 e16 c8 |
  d2~ d8 c8~ c8 b8 |
  a2 r8 a8~ a8 c8 |
  a2 c8. f16~ f8 e8 |
  e2 r8 d8 e16 e16 c8 |
  d2~ d8 c8~ c8 b8 |
  a2 r8 e'8~ e8 g8 |
  e2 g8. b16~ b8 a8 |
  a2 r8 e8~ e8 g8 |
  e2 e8. e16~ e8 d8 |
  d8.( c16 a4) r8 d8~ d8 d8 |
  d2 d8 f8~ f8 a8 |
  a4. r8 f8. f16~ f8 d8 |
  e1~ | e4 r4 r8 a,8~ a8 c8 |
  a2 c8. f16~ f8 e8 |
  e2 r8 d8 e16 e16 c8 |
  d2~ d8 c8~ c8 b8 |
  a2 r8 a8~ a8 c8 |
  a2 c8. f16~ f8 e8 |
  e2 r8 d8 e16 e16 c8 |
  d2~ d8 c8~ c8 b8 |
  a2 r8 e'8~ e8 g8 |
  e2 g8. b16~ b8 a8 |
  a2 r8 e8~ e8 g8 |
  e2 e8. d16~ d8 c8 |
  d8.( c16 a4) r8 d8~ d8 d8 |
  d2 d8 f8~ f8 a8 |
  e2~ e8 a16 a16 a8 c8 |
  b1~ | b2. r8 a16 b16 |
  c2 c8. c16~ c8 d8 |
  c2. r8 g16 a16 |
  b2 b8. c16~ c8 b8 |
  a2. r8 a16 b16 |
  c2 c8. c16~ c8 d8 |
  c2 r8 b8~ b8 a8 |
  b1~ | b2 r4 r8 a16 b16 |
  c2 c8. c16~ c8 d8 |
  c2. r8 g16 a16 |
  b2 b8. c16~ c8 b8 |
  a2. r8 a16 b16 |
  c2 c8. c16~ c8 d8 |
  c2 b8. a16~ a8 g8 |
  a1~ | a4 r4 r2 |

  \bar "|."
}


theChords = \chordmode {
  \include "predefined-guitar-fretboards.ly"
  \set chordChanges = ##t

  s1 | s1 | s1 |
  s2 s8 a4.:m |
  a1:m | c1 | d1:m |
  a1:m | a1:m | c1 | d1:m | a1:m |
  e1:m | a1:m | e1:m | d1:m |
  d1:m | f1: | e1:7 | q |

  a1:m | c1 | d1:m | a1:m | a1:m |
  c1 | d1:m | a1:m |
  e1:m | a1:m | e1:m | d1:m | q |
  a1:m | e1:7 | q | c1 | q |
  g1 | a1:m | c1 | q | e1:7 | q | c1 | q |
  g1 | a1 | c1 | g1 | a1:m
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
