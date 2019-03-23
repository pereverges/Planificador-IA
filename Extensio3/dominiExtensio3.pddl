(define (domain marte)
  (:requirements :strips :adl :typing :fluents)
  (:types base rover)
  (:functions
    (suministrosEnBase ?B - base)
    (personasEnBase ?AS - base)
    (suministrosEnCirculacion)
    (personasEnCirculacion)
    (peticionPersonaBase ?B - base)
    (peticionSuministroBase ?B - base)
    (prioridadPersonaBase ?B - base)
    (prioridadSuministroBase ?B - base)
    (numeroDePersonas ?R - rover)
    (combustible ?R - rover)
    (total-cost)
    (penalizacion-total)
  )
  (:predicates
      (roverEnBase ?R - rover ?B - base)
      (esAsentamiento ?B - base)
      (esAlmacen ?B - base)
      (roverCargaSuministro ?R - rover)
      (conexion ?Ba - base ?Be - base)
  )

(:action cargarPersona
  :parameters (?R - rover ?B - base)
  :precondition (and (not (roverCargaSuministro ?R)) (esAsentamiento ?B) (roverEnBase ?R ?B) (< (numeroDePersonas ?R) 2) (> (personasEnBase ?B) 0))
  :effect (and (increase (numeroDePersonas ?R) 1) (decrease (personasEnBase ?B) 1) (increase (personasEnCirculacion) 1))
)

(:action descargarPersona
  :parameters (?R - rover ?B - base)
  :precondition (and (esAsentamiento ?B) (roverEnBase ?R ?B) (> (numeroDePersonas ?R) 0) (> (peticionPersonaBase ?B) 0))
  :effect (and (decrease (numeroDePersonas ?R) 1) (decrease (peticionPersonaBase ?B) 1) (decrease (personasEnCirculacion) 1)
    (when (= (prioridadPersonaBase ?B) 1) (increase (penalizacion-total) 10))
    (when (= (prioridadPersonaBase ?B) 2) (increase (penalizacion-total) 5))
    ;(when (= (prioridadPersonaBase ?B) 3) (increase (penalizacion-total) 1))
  )
)

(:action cargarSuministro
  :parameters (?R - rover ?B - base)
  :precondition (and  (not (roverCargaSuministro ?R)) (esAlmacen ?B) (= (numeroDePersonas ?R) 0) (> (suministrosEnBase ?B) 0) (roverEnBase ?R ?B) )
  :effect (and (roverCargaSuministro ?R) (decrease (suministrosEnBase ?B) 1) (increase (suministrosEnCirculacion) 1))
)

(:action descargarSuministro
  :parameters (?R - rover ?B - base)
  :precondition (and  (esAsentamiento ?B) (roverCargaSuministro ?R) (roverEnBase ?R ?B) (> (peticionSuministroBase ?B) 0))
  :effect (and (not (roverCargaSuministro ?R)) (decrease (peticionSuministroBase ?B) 1) (decrease (suministrosEnCirculacion) 1)
    (when (= (prioridadSuministroBase ?B) 1) (increase (penalizacion-total) 10))
    (when (= (prioridadSuministroBase ?B) 2) (increase (penalizacion-total) 5))
    ;(when (= (prioridadSuministroBase ?B) 3) (increase (penalizacion-total) 1))

    )
)

(:action moverRoverDeBase
  :parameters (?R - rover ?B1 - base ?B2 - base)
  :precondition (and (conexion ?B1 ?B2) (roverEnBase ?R ?B1) (> (combustible ?R) 0))
  :effect (and (not(roverEnBase ?R ?B1)) (roverEnBase ?R ?B2) (decrease (combustible ?R) 1) (increase (total-cost) 1)
    )
)

)
