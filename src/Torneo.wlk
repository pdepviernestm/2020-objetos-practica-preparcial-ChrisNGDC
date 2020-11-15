import Vikingos.*
import Postas.*
import Dragones.*
import Jinetes.*
import Items.*

const Vikingos = [hipo, astrid, patan, patapez]

object torneo {
	var participantes = []
	const dragonesDisponibles = []
	const property rankingPesca = []
	const property rankingCombate = []
	const property rankingCarrera = []
	
	method agregarDragonesDisponibles(unosDragones) {
		unosDragones.forEach({unDragon => dragonesDisponibles.add(unDragon)})
	}
	method inscribirParticipanteA(unVikingo, unaPosta) { 
		if (unaPosta.puedeParticipar(unVikingo)){
			unVikingo.controlarClase(unaPosta, dragonesDisponibles)
			participantes.add(unVikingo)
		}
	}
	method inscribirParticipantesA(unaPosta) { Vikingos.forEach({unVikingo => self.inscribirParticipanteA(unVikingo, unaPosta)}) }
	method realizarPosta(unaPosta) { 
		participantes.forEach({unVikingo => unaPosta.realizadoPor(unVikingo)})
		participantes.clear()
	}
	method rankearEn(unaPosta, unRanking) {
		participantes = participantes.sortedBy({unVikingo, otroVikingo => unVikingo.masAptoQuePara(otroVikingo, unaPosta)})
		participantes.forEach({unVikingo => unRanking.add(unVikingo)})
	}
	method ocurrirUna(unaPosta, unRaking){
		self.inscribirParticipantesA(unaPosta)
		self.rankearEn(unaPosta, unRaking)
		self.realizarPosta(unaPosta)
	}
	method jugarse(){
		const carrera = new Carrera(distancia = new Range(start = 5, end = 20).anyOne())
		self.ocurrirUna(pesca, rankingPesca)
		self.ocurrirUna(combate, rankingCombate)
		self.ocurrirUna(carrera, rankingCarrera)
	}
}
