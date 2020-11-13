import Items.*
import Jinetes.*
import Dragones.*

class Vikingo{
	const property peso
	const property inteligencia
	const property velocidad
	const property barbarosidad
	var nivelDeHambre
	const property item
	
	method nivelDeHambre() = nivelDeHambre
	method aumentarHambre(unaCantidad) {nivelDeHambre += unaCantidad}
	method reducirHambre(unaCantidad) {nivelDeHambre = 0.max(nivelDeHambre - unaCantidad)}
	method estaHambriento() = nivelDeHambre >= 100
	method participarEnPosta(unaPosta) {
		if (unaPosta.puedeParticipar(self))
			unaPosta.realizadoPor(self)
	}
	method poseeUnSistemaDeVuelo() = item == sistemaDeVuelo
	method masBarbaroQue(unaCantidad) = barbarosidad > unaCantidad
	method pescadoMaximoALevantar() = 0.5 * peso + barbarosidad * 2
	method danio() = barbarosidad + item.poder()
	method masAptoQuePara(unVikingo, unaPosta) = unaPosta.compatibilidad(self) > unaPosta.compatibilidad(unVikingo)
	method accionarDespuesDeUnaPosta() {}
}

object hipo {
	var clase = new Vikingo(peso = 50, inteligencia = 10, velocidad = 5, barbarosidad = 6, nivelDeHambre = 0, item = sistemaDeVuelo)
	method clase() = clase
	method convertirAJineteCon(unDragon) {
		if (unDragon.puedeMontarme(self))
			clase = new Jinete(dragon = unDragon, peso = 50, inteligencia = 10, velocidad = 5, barbarosidad = 6, nivelDeHambre = 0, item = sistemaDeVuelo)
		else self.error("Conversion no posible")
	}
}

object astrid inherits Vikingo(peso = 55, inteligencia = 8, velocidad = 10, barbarosidad = 9, nivelDeHambre = 0, item = hacha){}

object patan inherits Vikingo(peso = 60, inteligencia = 3, velocidad = 9, barbarosidad = 8, nivelDeHambre = 0, item = maza){}

object patapez inherits Vikingo(peso = 80, inteligencia = 10, velocidad = 2, barbarosidad = 7, nivelDeHambre = 0, item = comestible){
	override method estaHambriento() = nivelDeHambre >= 50
	override method participarEnPosta(unaPosta) {
		nivelDeHambre += unaPosta.consumoDeHambre() * 2
	}
	override method accionarDespuesDeUnaPosta() { self.reducirHambre(comestible.hambreARecuperar()) }
}