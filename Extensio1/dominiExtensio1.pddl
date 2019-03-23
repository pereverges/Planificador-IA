(define (domain marte)
  (:requirements :strips :adl :typing :fluents)
  (:types base suministro persona rover)
  (:functions
    (numeroDePersonas ?R - rover)
  )
  (:predicates
      (suministroEnBase ?S - suministro ?B - base)
      (personaEnBase ?P - persona ?AS - base)
      (roverEnBase ?R - rover ?B - base)
      (personaEnRover ?P - persona ?R - rover)
      (suministroEnRover ?S - suministro ?R - rover)
      (esAsentamiento ?B - base)
      (esAlmacen ?B - base)
      (roverCargaSuministro ?R - rover)
  )

(:action cargarPersona
  :parameters (?P - persona ?R - rover ?B - base)
  :precondition (and (not (roverCargaSuministro ?R)) (esAsentamiento ?B) (< (numeroDePersonas ?R) 2) (personaEnBase ?P ?B) (roverEnBase ?R ?B) )
  :effect (and (personaEnRover ?P ?R) (increase (numeroDePersonas ?R) 1) (not (personaEnBase ?P ?B)))
)

(:action descargarPersona
  :parameters (?P - persona ?R - rover ?B - base)
  :precondition (and (personaEnRover ?P ?R) (> (numeroDePersonas ?R) 0) (esAsentamiento ?B) (roverEnBase ?R ?B))
  :effect (and (not (personaEnRover ?P ?R)) (decrease (numeroDePersonas ?R) 1) (personaEnBase ?P ?B))
)

(:action cargarSuministro
  :parameters (?S - suministro ?R - rover ?B - base)
  :precondition (and (esAlmacen ?B) (= (numeroDePersonas ?R) 0) (not (roverCargaSuministro ?R)) (suministroEnBase ?S ?B) (roverEnBase ?R ?B) )
  :effect (and (suministroEnRover ?S ?R) (roverCargaSuministro ?R) (not (suministroEnBase ?S ?B)))
)

(:action descargarSuministro
  :parameters (?S - suministro ?R - rover ?B - base)
  :precondition (and (esAlmacen ?B) (suministroEnRover ?S ?R) (roverCargaSuministro ?R) (roverEnBase ?R ?B))
  :effect (and (not (suministroEnRover ?S ?R)) (not (roverCargaSuministro ?R)) (suministroEnBase ?S ?B))
)

(:action moverRoverDeBase
  :parameters (?R - rover ?B1 - base ?B2 - base)
  :precondition (and (roverEnBase ?R ?B1))
  :effect (and (not(roverEnBase ?R ?B1)) (roverEnBase ?R ?B2))
  )
)
