import Vikingos.*

class Jinete {
	var property dragon
	method pescadoMaximoALevantar(unVikingo) = dragon.peso() - unVikingo.peso()
	method danio(unVikingo) = unVikingo.barbarosidad() + unVikingo.item().poder() + dragon.danio()
	method velocidad(unVikingo) = dragon.velocidad() - 1 * unVikingo.peso()
	method aumentarHambre(unVikingo, unaCantidad) {unVikingo.nivelDeHambre(unVikingo.nivelDeHambre() + 5)}
}