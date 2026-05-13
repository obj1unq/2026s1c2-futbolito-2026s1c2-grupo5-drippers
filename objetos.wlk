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

	method patear() {
		if (pelota.estaEnLaPosicionDe(self))
			position = game.at(
				(position.x() + 3).min(game.width() - 1),
				position.y()
			)
	}

	method taquito() {
		if (pelota.estaEnLaPosicionDe(self)){
			pelota.patearHaciaIzquierda(2)
		}
		
	}
}


object pelota {
	const property image = "pelota.png"
	var property position = game.at(5,5)


	method estaEnLaPosicionDe(jugador) {
		return self.position() == jugador.position()
	}

	method elevarse() {
	  
		self.estaEnLaPosicionDe(lionel)
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

