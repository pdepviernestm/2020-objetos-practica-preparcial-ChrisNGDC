class Item{
	method poder() = 0
}

object sistemaDeVuelo inherits Item{}

object hacha inherits Item{
	override method poder() = 30
}

object maza inherits Item{
	override method poder() = 100
}

object comestible inherits Item{
	method hambreARecuperar() = 10
}