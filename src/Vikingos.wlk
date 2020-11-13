import Items.*
import Jinetes.*
import Dragones.*

class Vikingo{
	const property peso
	const property inteligencia
	const property barbarosidad
	const property item
	const property velocidad
	var clase = normal
	var nivelDeHambre
	
	method nivelDeHambre() = nivelDeHambre
	method aumentarHambre(unaCantidad) {clase.aumentarHambre(unaCantidad)}
	method reducirHambre(unaCantidad) {nivelDeHambre = 0.max(nivelDeHambre - unaCantidad)}
	method estaHambriento() = nivelDeHambre >= 100
	method participarEnPostaCon(unaPosta, unosDragones) {
		if (unaPosta.puedeParticipar(self))
			clase = self.mejorClaseParaCon(unaPosta, unosDragones)
			unaPosta.realizadoPor(self)
	}
	method poseeUnSistemaDeVuelo() = item == sistemaDeVuelo
	method masBarbaroQue(unaCantidad) = barbarosidad > unaCantidad
	method masAptoQuePara(unVikingo, unaPosta) = unaPosta.compatibilidad(self) > unaPosta.compatibilidad(unVikingo)
	method accionarDespuesDeUnaPosta() {}
	method convertirAJineteCon(unDragon) {
		if (unDragon.puedeMontarme(self)){
			clase = new Jinete(dragon = unDragon)
		}
		else console.println("Conversion no posible")
	}
	method convertirANormal() { clase = normal }
	method mejorClaseParaCon(unaPosta, unosDragones){
		const posibles = unosDragones.forEach({unDragon => new Jinete(dragon = unDragon)}) + normal
		return posibles.max({unPosible => unPosible.pescadoMaximoALevantar(self)})
	}
	method controlarClase(unaPosta) { clase =  self.mejorClaseParaCon(unaPosta, unosDragones)}
}

object normal {
	method pescadoMaximoALevantar(unVikingo) = 0.5 * unVikingo.peso() + unVikingo.barbarosidad() * 2
	method danio(unVikingo) = unVikingo.barbarosidad() + unVikingo.item().poder()
	method velocidad(unVikingo) = unVikingo.velocidad()
	method aumentarHambre(unVikingo, unaCantidad) {unVikingo.nivelDeHambre(unVikingo.nivelDeHambre() + unaCantidad)}
}

object hipo inherits Vikingo(peso = 50, inteligencia = 10, velocidad = 5, barbarosidad = 6, nivelDeHambre = 0, item = sistemaDeVuelo){}

object astrid inherits Vikingo(peso = 55, inteligencia = 8, velocidad = 10, barbarosidad = 9, nivelDeHambre = 0, item = hacha){}

object patan inherits Vikingo(peso = 60, inteligencia = 3, velocidad = 9, barbarosidad = 8, nivelDeHambre = 0, item = maza){}

object patapez inherits Vikingo(peso = 80, inteligencia = 10, velocidad = 2, barbarosidad = 7, nivelDeHambre = 0, item = comestible){
	override method estaHambriento() = nivelDeHambre >= 50
	override method participarEnPosta(unaPosta) {
		nivelDeHambre += unaPosta.consumoDeHambre() * 2
	}
	override method accionarDespuesDeUnaPosta() { self.reducirHambre(comestible.hambreARecuperar()) }
}