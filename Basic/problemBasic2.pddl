(define (problem roversEnMarte)
  (:domain marte)
  (:objects
    b1 b2 b3 b4 b5 - base
    s1 s2 s3 s4 s5 s6 - suministro
    p1 p2 p3 p4 p5 p6 p7 p8 - persona
    r1 - rover
  )
  (:init
      (suministroEnBase s1 b1)
      (suministroEnBase s2 b1)
      (suministroEnBase s3 b1)
      (suministroEnBase s4 b1)
      (suministroEnBase s5 b1)
      (suministroEnBase s6 b1)

      (personaEnBase p1 b2)
      (personaEnBase p2 b2)
      (personaEnBase p3 b2)
      (personaEnBase p4 b2)
      (personaEnBase p5 b2)
      (personaEnBase p6 b2)

      (personaEnBase p7 b5)
      (personaEnBase p8 b5)

      (roverEnBase r1 b1)

      (esAlmacen b1)
      (esAlmacen b3)
      (esAsentamineto b2)
      (esAsentamineto b4)
      (esAsentamineto b5)
  )

  (:goal
    (and
    (personaEnBase p1 b4)
    (personaEnBase p2 b4)
    (personaEnBase p3 b4)
    (personaEnBase p4 b4)
    (personaEnBase p5 b4)
    (personaEnBase p6 b4)

    (personaEnBase p7 b4)
    (personaEnBase p8 b4)

    (suministroEnBase s1 b3)
    (suministroEnBase s2 b3)
    (suministroEnBase s3 b3)
    (suministroEnBase s4 b3)
    (suministroEnBase s5 b3)
    (suministroEnBase s6 b3)
    )
  )
)
