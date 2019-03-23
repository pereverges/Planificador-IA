(define (problem roversEnMarte)
  (:domain marte)
  (:objects
    b1 b2 b3 b4 - base
    s1 s2 s3 - suministro
    p1 p2 p3 - persona
    r1 - rover
  )
  (:init
      (roverEnBase r1 b1)
      (= (numeroDePersonas r1) 0)

      (suministroEnBase s1 b1)
      (suministroEnBase s2 b1)
      (suministroEnBase s3 b1)

      (personaEnBase p1 b2)
      (personaEnBase p2 b2)
      (personaEnBase p3 b2)

      (esAlmacen b1)
      (esAlmacen b3)
      (esAsentamiento b2)
      (esAsentamiento b4)
  )

  (:goal
    (and
    (personaEnBase p1 b4)
    (personaEnBase p2 b4)
    (personaEnBase p3 b4)

    (suministroEnBase s1 b3)
    (suministroEnBase s2 b3)
    (suministroEnBase s3 b3)
    )
  )
)
