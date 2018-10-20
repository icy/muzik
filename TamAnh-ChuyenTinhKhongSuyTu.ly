#(set-global-staff-size 13)

\version "2.19.0"

\header {
  title = "chuyện tình không suy tư"
  composer = "Tâm Anh"
  tagline = "Lilypond source prepared by Ky-Anh Huynh on 2018.10. License: CC BY-SA 3.0"
}

\markup { \vspace #1 }

verseI = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  tình yêu mới vừa hôm qua mà nay mắt trông mắt cay
  lệ nhòa tan nguồn tin yêu lệ nhòa trôi cơn mê đầy
  người yêu giờ xa xôi lắm cướp mất hương yêu
  em khóc cho ai đêm này ai khóc cho em ngày mai
  người
}

verseII = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  (người) yêu khóc tình ngu si lệ khô đắng môi tím mi
  lệ tràn trôi tình yêu anh lệ tràn suy tư mang về
  người yêu gầy xanh xao quá đánh mất thương đau em khóc
  cho ai đêm

  \repeat unfold 8 {\skip 1}
  này
  ai khóc cho em ngày mai
  thôi em về thôi em về
  dù anh hay vô tình
  vì em em còn suy tư
  xa em rồi xa em rồi
  còn đâu còn đâu nữa
  tìm đâu mắt môi người yêu
  tình yêu sao còn suy tư
  người đi đã vui chốn xa
  người tình xa tầm tay em
  người tình xa em đi rồi
  người ơi còn thương chi nữa
  giết chết thơ ngây
  em khóc cho em đêm này
  ai khóc cho em ngày mai
}

staffMelody = \relative c' {
  \time 4/4
  \key e\minor
  \autoBeamOn

  \repeat volta 2 {
    s2 s4. e8 \bar ".|:" g4 \times 2/3 {b8 a8 b8} b4. g8 |
    a4 \times 2/3{c8 b8 c8} a4. e8 | e4 \times 2/3{g8 fis8 g8} g4. d8 |
    d4 \times 2/3{e8 e8 e8} b4. b8 | d4 \times 2/3{b8 d8 fis8} a4 \times 2/3{b8 b8 g8} |
    g4. fis8 a8 fis8 e8 d8 |
  }

  \alternative {
    {
      b4. fis'8 a8 g8 fis8 e8 | fis2. r8 e8 |
      \bar ":|."
    }
    {
      b4. fis'8 a8 fis8 e8 d8 | e2 r8 b'4 b8 |
    }
  }

  e,2 r8 a4 a8 | d,4. d8 g8 g4 fis8 | b,4. d8 g8 g8 e8 g8 |
  a2 r8 c4 b8 | a2 r8 d4 \acciaccatura b8 a8 | g4. fis8 a8 g4 a8 |
  b4. fis8 a8 fis8 e8 d8 | e2. r8 e8 |
  g4 \times 2/3{b8 a8 b8} b4. g8 |
  a4 \times 2/3{c8 b8 c8} a4. e8 |
  e4 \times 2/3{g8 fis8 g8} g4. d8 |
  d4 \times 2/3{e8 e8 e8} b4. b8 |
  d4 \times 2/3{b8 d8 fis8} a4 \times 2/3{b8 b8 g8} |
  g4. fis8 a8 fis8 e8 d8 |
  b4. fis'8 a8 fis8 e8 d8 |
  e2 r2 |

  \bar "|."
}


theChords = \chordmode {
  \include "predefined-guitar-fretboards.ly"
  \set chordChanges = ##t
  \repeat volta 2 {
    s1 | e1:m | a1:m | c2 g2 | g2 e2:m |
    b1:m | g2: fis2:7 |
  }
  \alternative {
    {b2:m7 fis2:7 | b1:7 |}
    {b1:m7 | e1:m }
  }

  e2:m a2:m | d2 g2 | b2:m e2:m |
  a1:m | a2:m d2 | g1 | b1:m7 | e1:m | e1:m |
  a1:m | c2 g2 | g2 e2:m | b2:m d2 | g2 fis2:7 | b1:m7 | e1:m |
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
