(define (domain marte)
  (:requirements :strips :adl :typing :fluents)
  (:types base suministro persona rover)
  (:predicates
      (suministroEnBase ?S - suministro ?B - base)
      (personaEnBase ?P - persona ?B - base)
      (roverEnBase ?R - rover ?B - base)
      (personaEnRover ?P - persona ?R - rover)
      (suministroEnRover ?S - suministro ?R - rover)
      (esAsentamineto ?B - base)
      (esAlmacen ?B - base))

(:action cargarPersona
  :parameters (?P - persona ?R - rover ?B - base)
  :precondition (and (esAsentamineto ?B) (personaEnBase ?P ?B) (roverEnBase ?R ?B) (not (personaEnRover ?P ?R)))
  :effect (and (personaEnRover ?P ?R) (not (personaEnBase ?P ?B)))
)

(:action decargarPersona
  :parameters (?P - persona ?R - rover ?B - base)
  :precondition (and (personaEnRover ?P ?R) (esAsentamineto ?B) (roverEnBase ?R ?B))
  :effect (and (not (personaEnRover ?P ?R)) (personaEnBase ?P ?B))
)

(:action cargarSuministro
  :parameters (?S - suministro ?R - rover ?B - base)
  :precondition (and (esAlmacen ?B) (suministroEnBase ?S ?B) (roverEnBase ?R ?B) (not (suministroEnRover ?S ?R)))
  :effect (and (suministroEnRover ?S ?R) (not (suministroEnBase ?S ?B)))
)

(:action decargarSuministro
  :parameters (?S - suministro ?R - rover ?B - base)
  :precondition (and (suministroEnRover ?S ?R) (esAlmacen ?B) (roverEnBase ?R ?B))
  :effect (and (not (suministroEnRover ?S ?R)) (suministroEnBase ?S ?B))
)

(:action moverRoverDeBase
  :parameters (?R - rover ?B1 - base ?B2 - base)
  :precondition (and (roverEnBase ?R ?B1))
  :effect (and (not(roverEnBase ?R ?B1)) (roverEnBase ?R ?B2))
  )
)
