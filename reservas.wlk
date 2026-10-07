import vehiculos.*
import adatacionInteriorColorYMotor.*

class Reservas {
  var property cantidadDePersonasALlevar = 0
  var property distanciaARecorrer = 0
  var property tiempoMaximo = 0
  var property necesidadDeAutoSilencioso = false
  var property necesidadDeTransportarSilla = false
  const coloresContraIndicados = #{}
  
  method agregarColorContraindicado(color) {
    coloresContraIndicados.add(color)
  }
  
  method puedeSerCumplidoPorVehiculo(
    vehiculo
  ) = ((self.tieneCapacidadSuficiente(
    vehiculo
  ) && self.tieneAutonomiaSuficiente(
    vehiculo
  )) && self.tieneVelocidadSuficiente(vehiculo)) && self.esRespetuoso(vehiculo)
  
  method tieneCapacidadSuficiente(
    _vehiculo
  ) = _vehiculo.capacidad() >= cantidadDePersonasALlevar
  
  method tieneAutonomiaSuficiente(
    _vehiculo
  ) = _vehiculo.autonomia() >= distanciaARecorrer
  
  method tieneVelocidadSuficiente(
    _vehiculo
  ) = _vehiculo.velocidadMax() >= (self.velocidadPromedioDeViaje() + 10)
  
  method velocidadPromedioDeViaje() = distanciaARecorrer / tiempoMaximo
  
  method esRespetuoso(vehiculo) = ((!coloresContraIndicados.contains(
    vehiculo.color()
  )) && self.cumpleNecesidadSilencio(vehiculo)) && self.cumpleNecesidadSilla(
    vehiculo
  )
  
  method cumpleNecesidadSilencio(
    _vehiculo
  ) = (!necesidadDeAutoSilencioso) || (!_vehiculo.esRuidoso())
  
  method cumpleNecesidadSilla(
    _vehiculo
  ) = (!necesidadDeTransportarSilla) || _vehiculo.puedeTransportarSilla()
  
  method tieneColorContraIndicado(_color) = coloresContraIndicados.contains(
    _color
  )
  
  method haySilla(_vehiculo) = _vehiculo.puedeTransportarSilla()
  
  method haySilencio(_vehiculo) = !_vehiculo.esRuidoso()
}