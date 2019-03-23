(define (problem roversEnMarte)
  (:domain marte)
  (:objects
    b1 b2 b3 b4 - base
    r1 r2 - rover
  )
  (:init
      (conexion b1 b2)
      (conexion b2 b3)
      (conexion b3 b4)
      (conexion b4 b1)

      (esAlmacen b1)
      (esAsentamiento b2)
      (esAsentamiento b3)
      (esAsentamiento b4)

      (= (suministrosEnBase b1) 5)
      (= (personasEnBase b2) 4)
      (= (personasEnBase b3) 0)
      (= (personasEnBase b4) 0)

      (roverEnBase r1 b1)
      (= (numeroDePersonas r1) 0)
      (= (combustible r1) 50)

      (roverEnBase r2 b2)
      (= (numeroDePersonas r2) 0)
      (= (combustible r2) 50)

      (= (peticionSuministroBase b3) 30) ;numero de peticiones de la base, respecto a suministros
      (= (prioridadSuministroBase b3) 3) ;prioridad de las peticiones de suministros de la base

      (= (peticionPersonaBase b3) 30)
      (= (prioridadPersonaBase b3) 3)

      (= (peticionSuministroBase b4) 30)
      (= (prioridadSuministroBase b4) 1)

      (= (peticionPersonaBase b4) 30)
      (= (prioridadPersonaBase b4) 1)


      (= (personasEnCirculacion) 0) ;estan en algun rover esperando llegar a su destino
      (= (suministrosEnCirculacion) 0)

      (= (total-cost) 0)

      (= (penalizacion-total) 0)
 
  )
  (:goal
    (and
      (forall (?b - base) (and (or (not(esAsentamiento ?b)) (= (personasEnBase ?b) 0)) (or (not(esAlmacen ?b)) (= (suministrosEnBase ?b) 0)))) ; almacen implica suministrosEnBase=0, traducido logicamente
      (= (suministrosEnCirculacion) 0)
      (= (personasEnCirculacion) 0)
    )
  )
  (:metric minimize (penalizacion-total))
)
