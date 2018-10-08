#(set-global-staff-size 13)

\version "2.18.2"

\header {
  title = "Làng tôi"
  composer = "Văn Cao"
  tagline = "Lilypond source prepared by Ky-Anh Huynh on 2018.08. License: CC BY-SA 3.0"
}

\markup { \vspace #1 }

verseI = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  làng tôi xanh  bóng tre
  từng tiếng chuông ban chiều
  tiếng chuông nhà thờ rung

  đời đang vui đồng quê yêu dấu
  bóng cây với con thuyền một dòng sông

  nhưng thôi rồi còn đâu quê nhà
  ngày giặc pháp đốt làng triệt thôn
  đường ngập bao xương máu âm thầm
  đồng không nhà trống tàn hoang
}

theChords = \chordmode {
  \include "predefined-guitar-fretboards.ly"
  \set chordChanges = ##t
  s4 c4 s4
  s4 c4 s4
  s4 c4 s4    |
  s2 s4 |
  s4 c4 s4    |
  s4 s2 |
  s4 c4 q |
  g4:7 g4:7 g4:7
  s4 c4 s4 |
  s4 c4 s4 |
  s4 c4 s4 |
  s4 c4 s4 |
  s2. |
  s2. |
  s4 c4 c4 |
  c4 c4 c4 |

  s4 d4:m s4 |
  s4 f4 s4 |
  s4 f4 s4 |
  s4 c4 q |

  s4 f4 s4 | s4 f4 s4 | s4 c4 s4 | s4 c4 q |
  s4 c4 s4 | s4 c4 s4 | s4 c4 s4 | s4 g4:7 s4 |
  s4 c4 s4 | s4 f4 f4 | s4 c4 c4 | c4 c4 s4 |
}

% melody harmony
staffMelodyI = \relative c' {
  \time 3/4
  \autoBeamOn
  \stemUp
  r4 <g' c e>4 r4 |
  r4 <c e>4 r4    |
  r4 <c e>4 r4    |
  r2 r4 |
  r4 <c e>4 r4    |
  \hideNotes r4 r2\unHideNotes |
  r4 <c e>4 q |
    \stemDown
    g,4
    \stemUp
    <g' b f'>4 q |
  r4 <g c e>4 r4 |
  r4 <c e>4 r4 |
  r4 <e, g>4 r4 |
  r4 <e g>4 r4 |
  r2. |
  r2. |
  r4 \stemDown g4 e4 |
  c4 \stemUp <g' c e>4 q |

  r4 f4 r4 |
  r4 f4 r4 |
  r4 f4 r4 |
  r4 <c' e>4 q |

  r4 a,4 r4 | r4 d4 r4 | r4 <g c e>4 r4 | r4 <c e>4 q |
  r4 <g c e>4 r4 | r4 <g c e>4 r4 | r4 <c e>4 r4 | r4 <g b f'>4 r4 |
  r4 <e g>4 r4 | r4 f4 f4 | r4 g4 e4 | \stemDown c4 r4 r4 |
  \stemUp
}

% main melody
staffMelodyII = \relative c' {
  \time 3/4
  \autoBeamOn
  \stemDown
  c2 e4           |
  g2 a4           |
  g4 \hideNotes r4 \unHideNotes g4    |
  c4 b4 a4 |
  g2 a4 |
  g4 f4 e4        |
  { g2.~ \stemUp g2 \stemDown } \hideNotes r4\unHideNotes |
  c,2 d4 |
  e2 g4 |
  c2 d4 |
  e2 d4 |
  c4 d4 c4 |
  g4 e4 g4 |
  \stemUp c2.~ c2 \stemDown \hideNotes r4\unHideNotes |

  <a c>2\pp q4 | a2 a4 | <g b>2 q4 | g2. |
  f2 f4 | a2 a4 | e2 d4 | g2. |
  c,2 d4 | e2 f4 | g2 e4 | d2 c4 |
  c'2 <g b>4 | d'2 g,4 | c2.~ | \stemUp c4 r4 r4 |
  \stemDown

  \bar "|."
}

\paper {
  left-margin = 2\cm
  right-margin = 2\cm
}

\score {
  <<
    \context ChordNames { \theChords }
    \context FretBoards { \theChords }
    \new Staff {
      <<
      \new Voice = "voiceOne" { \voiceOne \staffMelodyI }
      \new Voice = "voiceTwo" { \voiceTwo \staffMelodyII }
      >>
    }
    \new Lyrics = "lyricsI" {\lyricsto "voiceTwo" \verseI }
  >>
  \layout {
    indent = 0\cm
  }
}
