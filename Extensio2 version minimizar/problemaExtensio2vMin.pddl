(define (problem roversEnMarte)
  (:domain marte)
  (:objects
    b1 b2 b3 - base
    r1 r2 - rover
  )
  (:init
      (conexion b1 b2)
      (conexion b2 b3)
      (conexion b3 b1)

      (esAlmacen b1)
      (esAsentamiento b2)
      (esAsentamiento b3)

      (= (suministrosEnBase b1) 1)
      (= (personasEnBase b2) 20)
      (= (personasEnBase b3) 0)

      (roverEnBase r1 b1)
      (= (numeroDePersonas r1) 0)
      (= (combustible r1) 60)

      (roverEnBase r2 b2)
      (= (numeroDePersonas r2) 0)
      (= (combustible r2) 60)

      (= (peticionSuministroBase b3) 30) ;numero de peticiones de la base, respecto a suministros

      (= (peticionPersonaBase b3) 30)


      (= (personasEnCirculacion) 0) ;estan en algun rover esperando llegar a su destino
      (= (suministrosEnCirculacion) 0)

      (= (total-cost) 0)
  )
  (:goal
    (and
      (forall (?b - base) (and (or (not(esAsentamiento ?b)) (= (personasEnBase ?b) 0)) (or (not(esAlmacen ?b)) (= (suministrosEnBase ?b) 0))))
      (= (suministrosEnCirculacion) 0)
      (= (personasEnCirculacion) 0)
    )
  )
  (:metric minimize (total-cost))
)
