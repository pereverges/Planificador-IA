(define (problem roversEnMarte)
(:domain marte)
(:objects b0 b1 b2 b3 b4 b5 b6 b7 -base
          r0 r1 r2 r3 r4 -rover
)
(:init
(conexion b0 b1)
(conexion b1 b2)
(conexion b2 b3)
(conexion b3 b4)
(conexion b4 b5)
(conexion b5 b6)
(conexion b6 b7)
(conexion b7 b0)
(esAlmacen b0)
(= (suministrosEnBase b0) 0)
(esAlmacen b1)
(= (suministrosEnBase b1) 4)
(esAsentamiento b2)
(= (personasEnBase b2) 8)
(esAsentamiento b3)
(= (personasEnBase b3) 5)
(esAsentamiento b4)
(= (personasEnBase b4) 0)
(esAsentamiento b5)
(= (personasEnBase b5) 0)
(esAsentamiento b6)
(= (personasEnBase b6) 0)
(esAsentamiento b7)
(= (personasEnBase b7) 0)
(roverEnBase r0 b5)
(= (numeroDePersonas r0) 0)
(= (combustible r0) 78)
(roverEnBase r1 b0)
(= (numeroDePersonas r1) 0)
(= (combustible r1) 297)
(roverEnBase r2 b1)
(= (numeroDePersonas r2) 0)
(= (combustible r2) 87)
(roverEnBase r3 b6)
(= (numeroDePersonas r3) 0)
(= (combustible r3) 159)
(roverEnBase r4 b5)
(= (numeroDePersonas r4) 0)
(= (combustible r4) 113)
(= (peticionSuministroBase b4) 488)
(= (prioridadSuministroBase b4) 1)
(= (peticionPersonaBase b4) 155)
(= (prioridadPersonaBase b4) 1)
(= (peticionSuministroBase b5) 818)
(= (prioridadSuministroBase b5) 3)
(= (peticionPersonaBase b5) 53)
(= (prioridadPersonaBase b5) 3)
(= (peticionSuministroBase b6) 770)
(= (prioridadSuministroBase b6) 3)
(= (peticionPersonaBase b6) 968)
(= (prioridadPersonaBase b6) 2)
(= (peticionSuministroBase b7) 211)
(= (prioridadSuministroBase b7) 3)
(= (peticionPersonaBase b7) 347)
(= (prioridadPersonaBase b7) 1)
(= (personasEnCirculacion) 0)
(= (suministrosEnCirculacion) 0)
(= (total-cost) 0)
(= (penalizacion-total) 0)
)
(:goal
(and (forall (?b - base) (and (or (not(esAsentamiento ?b)) (= (personasEnBase ?b) 0)) (or (not(esAlmacen ?b)) (= (suministrosEnBase ?b) 0)))) (= (suministrosEnCirculacion) 0) (= (personasEnCirculacion) 0))
)
)