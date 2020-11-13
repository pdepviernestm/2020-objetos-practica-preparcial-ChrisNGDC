import Vikingos.*
import Postas.*
import Dragones.*
import Jinetes.*
import Items.*

const Vikingos = [hipo, astrid, patan, patapez]

object torneo {
	var participantes = []
	const property rankingPesca = []
	const property rankingCombate = []
	const property rankingCarrera = []
	
	method inscribirParticipanteA(unVikingo, unaPosta) { 
		if (unaPosta.puedeParticipar(unVikingo))
			participantes.add(unVikingo)
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
	method jugarse(){
		const carrera = new Carrera(distancia = new Range(start = 5, end = 20).anyOne())
		self.inscribirParticipantesA(pesca)
		self.rankearEn(pesca, rankingPesca)
		self.realizarPosta(pesca)
		self.inscribirParticipantesA(combate)
		self.rankearEn(combate, rankingCombate)
		self.realizarPosta(combate)
		self.inscribirParticipantesA(carrera)
		self.rankearEn(carrera, rankingCarrera)
		self.realizarPosta(carrera)
	}	
}
