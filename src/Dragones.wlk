class Dragon{
 	const property peso
 	const property danio = self.poder()
 	const requisitosDeMontura = []
 	
 	method poder() = 0
 	method velocidad() = self.velocidadBase() - peso
 	method velocidadBase() = 60
 	method puedeMontarme(unVikingo) = unVikingo.clase().peso() <= peso * 0.2 and requisitosDeMontura.all({unRequisito => unRequisito.loCumple(unVikingo)})
}
 
class FuriaNocturna inherits Dragon{
 	override method velocidad() = super() * 3
}

class NadderMortifero inherits Dragon{
	const inteligencia
	override method poder() = 150
	override method puedeMontarme(unVikingo) = super(unVikingo) and inteligencia >= unVikingo.clase().inteligencia()
}

class Gronckle inherits Dragon{
 	override method velocidadBase() = super() / 2
 	override method poder() = 5 * peso
}

class Requisito{
	const requisito
	method loCumple(unVikingo) = requisito.apply(unVikingo)
}