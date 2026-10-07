object cañoDeEscapeExtra {
  method espacioOcupado() = 0
  
  method autonomia() = -10
  
  method velocidadMax() = 115
}

object transportadorDeSilla {
  method espacioOcupado() = 1
  
  method autonomia() = -20
  
  method velocidadMax() = 90
}

object tanqueExtraDeGas {
  method espacioOcupado() = 1
  
  method autonomia() = 200
  
  method velocidadMax() = 80
}
///interiores
object interiorEspacioso {
  method capacidad() = 7
  
  method puedeTransportarSilla() = false
}

object interiorAccesible {
  method capacidad() = 5
  
  method puedeTransportarSilla() = true
}
///motores
object deportivo {
  method autonomia() = 400
  
  method velocidadMax() = 230
  
  method esRuidoso() = true
}

object urbano {
  method autonomia() = 1000
  
  method velocidadMax() = 130
  
  method esRuidoso() = false
}
///colores
object rojo {
  
}

object beige {
  
}

object celeste {
  
}