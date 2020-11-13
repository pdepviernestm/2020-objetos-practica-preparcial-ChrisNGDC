import Vikingos.*

class Jinete inherits Vikingo{
	const dragon
	override method pescadoMaximoALevantar() = dragon.peso() - peso
	override method danio() = super() + dragon.danio()
	override method velocidad() = dragon.velocidad() - 1 * peso
	override method aumentarHambre(unaCantidad) {nivelDeHambre += 5}
}