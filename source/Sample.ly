#(set-global-staff-size 13)

\version "2.19.0"

\header {
  title = "Không đề"
  composer = "Không tên"
  tagline = "Lilypond source prepared by Ky-Anh Huynh in 2018.08. License: CC BY-SA 3.0"
}

\markup { \vspace #1 }

verseI = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  một hai ba... một
}

staffMelody = \relative c' {
  \time 2/4
  \autoBeamOn
  c2 d2 | e2 f2 |
  \bar "|."
}


theChords = \chordmode {
  \include "predefined-guitar-fretboards.ly"
  \set chordChanges = ##t
  c2 d2 | e2 f2 |
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
