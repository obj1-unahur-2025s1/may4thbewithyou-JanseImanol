class Personaje{
    method potencia()
}

object r2d2 inherits Personaje {
   var bateria = 50
   
   override method potencia() = bateria * self.valentia() 
   method valentia() = 10

   method cargaCompleta() {
     bateria = 100
   }

   method descargarBateria(unNumero) {
     bateria = (bateria - unNumero).min(100)
   }
}

object hanSolo inherits Personaje {
  var estaCongelado = true
  const armaEquipada = []



  method estaCongelado() = estaCongelado 
  override method potencia() = if (self.estaCongelado()) 0 else armaEquipada.energia() * 2

  method descongelar() {estaCongelado = false}

  method cambiarArma(unArma) {
    if (armaEquipada.isEmpty()){
        armaEquipada.add(unArma)
    }else{
        armaEquipada.removeAll()
        armaEquipada.add(unArma)
    }
  }
}

class Arma{
    const energia
    method energia() = energia
}

class Maestro inherits Personaje{
    var esperanza = 50
    const midiclorianos
    const sable 

    method esJedi() = esperanza > 0
    
    override method potencia() = if (self.esJedi()) midiclorianos * 0.001 + sable.energia() * 10 else midiclorianos * 0.001 + sable.energia() * ladoOscuro.fuerza()

    method leOcurre(unSuceso) {
        if (!self.esJedi() and unSuceso.energia()>=100){
            esperanza = 50
        }else{
            esperanza = (esperanza + unSuceso.energia()).max(0)
        }
    }
}

object ladoOscuro {
  var property fuerza = 10
}

class Suceso{
    const energia
    method energia() = energia
}

class ConseguirAmigo inherits Suceso{
    const unAmigo
    override method energia() = unAmigo.potencia()
}

class ParticiparBatalla inherits Suceso{
    const cantBajas
    override method energia() = -(cantBajas * 0.10)
}

class GanarCarrera inherits Suceso{
    override method energia() = 5 
}





