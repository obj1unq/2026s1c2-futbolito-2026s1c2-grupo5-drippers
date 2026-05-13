/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
	method taquito(){

		self.validarPelota()
		pelota.patearHaciaIzquierda(2)
	}

	method validarPelota(){
		if (not self.position().equals(pelota.position()) ){
			self.error("No está la pelota en la posición")
		}
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method patearHaciaIzquierda(distancia){

		const nuevaX = 0.max(position.x() - distancia)
        position = game.at(nuevaX, position.y())
	}	
}
