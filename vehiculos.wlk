import adatacionInteriorColorYMotor.*

class Torino {
  var property velocidadMax = 0
  var property autonomia = 0
  var property color = rojo
  
  method capacidad() = 4
  
  method esRuidoso() = true
  
  method puedeTransportarSilla() = false
}

class Economico {
  const adaptaciones = #{}
  var property color = beige
  const autonomiaBase = 200
  
  method añadirAdaptacion(_adaptacion) {
    adaptaciones.add(_adaptacion)
  }
  
  method esRuidoso() = !self.existeAdaptacionSilenciosa()
  
  method existeAdaptacionSilenciosa() = adaptaciones.contains(
    cañoDeEscapeExtra
  ) || adaptaciones.contains(tanqueExtraDeGas)
  
  method puedeTransportarSilla() = adaptaciones.contains(transportadorDeSilla)
  
  method capacidad() = 5 - adaptaciones.sum(
    { adaptacion => adaptacion.espacioOcupado() }
  )
  
  method velocidadMax() = if (adaptaciones.isEmpty()) 120
                          else adaptaciones.map(
                              { adaptacion => adaptacion.velocidadMax() }
                            ).min()
  
  method autonomia() = autonomiaBase + adaptaciones.sum(
    { adaptacion => adaptacion.autonomia() }
  )
}

object combiAdaptable {
  const color = celeste
  var motor = urbano
  var interior = interiorAccesible
  
  method asignarMotor(_motor) {
    motor = _motor
  }
  
  method asignarInterior(_interior) {
    interior = _interior
  }
  
  method velocidadMax() = motor.velocidadMax()
  
  method esRuidoso() = motor.esRuidoso()
  
  method autonomia() = motor.autonomia()
  
  method puedeTransportarSilla() = interior.puedeTransportarSilla()
  
  method color() = color
  
  method capacidad() = interior.capacidad()
}