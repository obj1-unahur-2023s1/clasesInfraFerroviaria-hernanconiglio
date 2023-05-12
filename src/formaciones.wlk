import vagones.*

class Formacion {
	const property vagones = []
	
	method capacidadPasajeros() {return
		vagones.sum({v=>v.capacidadPasajeros()})
	}
	
	method vagonesPopulares() {return
		vagones.count({v=>v.capacidadPasajeros()>50})
	}
	
	method esFormacionCarguera() {return
		vagones.all({v=>v.cantMaximaDeCarga()>=1000})
	}
	
	method vagonMasPesado() = vagones.max({v=>v.pesoMaximo()})
	method vagonMasLiviano() = vagones.min({v=>v.pesoMaximo()})

	method dispersionPesos() {return
		self.vagonMasPesado().pesoMaximo() -
		self.vagonMasLiviano().pesoMaximo()
	}
	
	method cantidadBanios() {return
		vagones.count({v=>v.tieneBanio()})
		//vagones.filter({v=>v.tieneBanio()}).size() queda más lindo con el count
	}
	
	method hacerMantenimiento() {
		vagones.forEach({v=>v.hacerMantenimiento()})
	}
	
	method vagonesDePasajeros() {return
		vagones.filter({v=>v.capacidadPasajeros()>0})
	}
	
	method vagonConMasPasajeros() {return
		self.vagonesDePasajeros().max({v=>v.capacidadPasajeros()})
	}

	method vagonConMenosPasajeros() {return
		self.vagonesDePasajeros().min({v=>v.capacidadPasajeros()})
	}
	
	method estaEquilibradaEnPasajeros() {
		return !self.vagonesDePasajeros().isEmpty() and self.vagonConMasPasajeros().capacidadPasajeros() -
		self.vagonConMenosPasajeros().capacidadPasajeros() <= 20
	}
	
	method cantidadDeVagonesDePasajeros(){return
		vagones.count({v=>v.capacidadPasajeros() > 0})
	}				
	
	method cantPasajerosPorVagon() = vagones.map({v=>v.capacidadPasajeros()})
	
	method estaOrganizada() {return
		(self.cantidadDeVagonesDePasajeros() == 0) ||
		(0..self.cantidadDeVagonesDePasajeros() - 1).all
		({i=>self.cantPasajerosPorVagon().get(i) > 0})
	}	

}
