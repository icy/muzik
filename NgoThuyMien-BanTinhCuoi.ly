% Original sheet found from vnguitar.net
% Chậm buồn

\version "2.18.2"

\header {
  title = "Bản tình cuối"
  composer = "Ngô Thụy Miên"
  tagline = "Lilypond source prepared by Ky-Anh Huynh on 2014.08.02. License: CC BY-SA 3.0"
}

\markup { \vspace #1 }

verseI = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  mưa có rơi và nắng có phai
  trên cuộc tình yêu em ngày nào
  ta đã yêu và ta đã mơ
  mơ trăng sao đưa đến bên người
  một lần gặp gỡ đã như quen thuở nào
  một lần gặp gỡ nhưng tình đã xa xưa

  \repeat unfold 11 { \skip 1 }
}

verseII = \lyricmode {
  \override LyricText #'font-name = #"Choco Cooky"

  mây có bay và em có hay
  ta ngại ngùng yêu em lần đầu
  ta đã say hồn ta ngất ngây
  men yêu thương đã thấm cuộc đời
  một lần nào đó bước bên em âm

  \repeat unfold 12 { \skip 1 }
  thầm

  một lần nào đó ta vẫn không nói yêu người

  yêu em ta yêu em như yêu tuổi ngây thơ
  bên em bên em ta hát khúc mong chờ
  ngày nào người cho ta biết tình yêu đắm say
  ngày nào đời cho ta biết tình là đắng cay

  mưa đã rơi và nắng đã phai
  trên cuộc tình yêu em ngày nào
  ta vẫn yêu hồn ta vẫn say
  qua bao nhiêu năm tháng ơ thờ
  một ngày nào đó tóc xanh xưa bạc màu
  một ngày nào đó ta có thôi hết yêu người
}

staffMelody = \relative c' {
  \time 4/4
  \autoBeamOn

  r2 r4 r8 e16 f16
  \repeat volta 2 {
    e4\times 2/3 { a,8 e'8 f8 } e4. d16 b16
    b4\times 2/3 { c8 c8 a8} a4. a'16 bes16
    a4\times 2/3 { d,8 a'8 bes8 } a4. g16 g16
    g4\times 2/3 { g8 a8 f8 } e2~

    \time 2/4
    \autoBeamOn

    e4 \times 2/3 { e8 e8 e8 }

    \time 4/4

    b'4.   c8 a8   a4 e8
  }
  \alternative {
    {
      d2.   \times 2/3 { b8 b8 b8 }
      f'4.   e8 b8 f'4 e8
      e2.   r8 e16 f16
    }
    {
      d2.   \times 2/3 { a'8 a8 a8 }
      d4.   c16 d16 c8 d4 c8 a2.
    }
  }

  r8 g8 g4.   g16 g16 g4
  f16 e16 d16 e16 e2.

  r8 d8 d4.   d8 d8. d16 \times 2/3 { f8 f8 e8} a,2.
  r8 b8 b4   \times 2/3 {b8 d8 e8} f4
  \times 2/3 {b,8 d8 f8} e2.

  r8   d8 d4  \fermata \times 2/3 {d8 f8 a8} b4  \fermata
  \times 2/3 {a8\fermata   b8\fermata   f'8\fermata  }
  e2.\fermata   r8 e,16 f16
  e4   \times 2/3 {a,8 e'8 f8 } e4.
  d16 b16 b4   \times 2/3 {c8 c8 a8}
  a4.   a'16 bes16

  a4   \times 2/3 {d,8 a'8 bes8} a4.   g16 g16
  g4   \times 2/3 {g8 a8 e8} e2(
  \time 2/4
  e4)
  \times 2/3 {e8 e8 e8}
  \time 4/4

  b'4.   c8 a8   a4 e8
  d2.   \times 2/3 {a'8 a8 a8 }
  d4.   c16 d16 c8 d4 b8

  a1
  \bar "|."
}

theChords = \chordmode {
  \include "predefined-guitar-fretboards.ly"
  \set chordChanges = ##t
  s1
  a2:m a2:m e2:7 a2:m d2:m f2 g2:7 c2 c2
  e2 a2:m d2:m d2:m f2 f2 e2 e2
  d2:m d2:m e2:7 e2:7 a2:m a2:m g2 g2:7 c2 c2
  bes2 bes2 a2:m a2:m g2 g2:7
  c2 a2:m
  d2:m\fermata e4\fermata \times 2/3 {f8 g8 f8\fermata} e2\fermata e2 a2:m a2:m
  e2:7 a2:m
  d2:m f2
  g2:7 c2 c2
  e2 a2:m d2:m d2:m e2:7 e2:7 a2:m a2:m
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
