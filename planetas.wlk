class Planeta{
    var poblacion
    const defensores = []

    method sacarDefensor(unDefensor) {defensores.remove(unDefensor)}
    method agregarDefensor(unDefensor) {defensores.add(unDefensor)}

    method invacion(intencidad) {
      if (!self.sePuedeDefender(intencidad)){
        poblacion = poblacion * 0.10
      }
    }

    method sePuedeDefender(intencidad) =  defensores.sum({d => d.potencia()}) > intencidad
    method personajeMasPotente() = defensores.max({d => d.potencia()}) 
}