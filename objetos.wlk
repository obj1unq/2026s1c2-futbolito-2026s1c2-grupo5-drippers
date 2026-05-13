/** First Wollok example */
import wollok.game.*

object lionel {

	var camisetaActual = "titular"
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-"+camisetaActual+".png"
	}

	method camisetaActual() {
		return camisetaActual
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method patear() {
		pelota.validarPosicionDePelota()
		pelota.position( game.at(
			(position.x() + 3).min(game.width() - 1),
				position.y()
			))
	}

	method taquito() {
		pelota.validarPosicionDePelota()
		pelota.patearHaciaIzquierda(2)
	}
		
	method cambiarCamiseta() {
		self.validarCambio()
		if (camisetaActual == "titular"){
			camisetaActual = "suplente"
		} else {
			camisetaActual= "titular"
		}
	}

	method estaEnZonaDeCambio() {
		return self.position().x() == 0
	}
	
	method validarCambio(){
		if (!self.estaEnZonaDeCambio()){
			self.error("No esta en zona de cambio")
		}
	}

}


object pelota {
	const property image = "pelota.png"
	var property position = game.at(5,5)


	method validarPosicionDePelota() {

        if (not(position == lionel.position())) {

            self.error("la pelota no esta en la misma posicion que Lionel")
        }

    }

	method elevarse() {
	  
		self.validarPosicionDePelota()
		position = position.up(1)

		game.schedule(2000, {
			
			position = position.down(1)
		})
	}

	method patearHaciaIzquierda(distancia){

		const nuevaX = 0.max(position.x() - distancia)
        position = game.at(nuevaX, position.y())
	}	
}