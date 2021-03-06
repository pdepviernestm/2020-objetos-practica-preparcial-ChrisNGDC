class Posta{
	method consumoDeHambre()
	method puedeParticipar(unVikingo) = unVikingo.nivelDeHambre() + self.consumoDeHambre() < 100
	method realizadoPor(unVikingo) {
		unVikingo.clase().aumentarHambre(self.consumoDeHambre())
	}
	method compatibilidad(unVikingo)
}

object pesca inherits Posta{
	override method consumoDeHambre() = 5
	override method compatibilidad(unVikingo) = unVikingo.clase().pescadoMaximoALevantar(unVikingo)
}

object combate inherits Posta{
	override method consumoDeHambre() = 10
	override method compatibilidad(unVikingo) = unVikingo.clase().danio(unVikingo)
}

class Carrera inherits Posta{
	const distancia
	override method consumoDeHambre() = 1 * distancia
	override method compatibilidad(unVikingo) = unVikingo.clase().velocidad(unVikingo)
}