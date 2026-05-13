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
	const property image="pelota.png"
	var property position = game.at(5,5)	
}
