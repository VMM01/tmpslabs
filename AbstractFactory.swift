import Foundation

protocol Wheels {
    func setSize(_ size: Int) -> Void
    func setMode(_ model: String) -> Void
    func getCharacteristics(_ size: String,_ model: String)
}

protocol Engine {
    func setPower(_ power: String) -> Void
    func setMode(_ model: String) -> Void
    func getCharacteristics(_ power: String,_ model: String)
}

protocol AbstractAutoFactory {
    func createWheels() -> Wheels
    func createEngine() -> Engine
}

class CarWheels: Wheels {
    var size: Int?
    var model: String?
    
    func setSize(_ size: Int) {
        self.size = size
    }
    
    func setMode(_ model: String) {
        self.model = model
    }
    
    func getCharacteristics(_ size: String, _ model: String) {
        print("CarWheels: \nModel: \(model), Size: R\(size)")
    }
}

class BusWheels: Wheels {
    var size: Int?
    var model: String?
    
    func setSize(_ size: Int) {
        self.size = size
    }
    
    func setMode(_ model: String) {
        self.model = model
    }
    
    func getCharacteristics(_ size: String, _ model: String) {
        print("BusWheels: \nModel: \(model), Size: R\(size)")
    }
}

class CarEngine: Engine {
    var power: String?
    var model: String?
    
    func setMode(_ model: String) {
        self.model = model
    }
    
    func setPower(_ power: String) {
        self.power = power
    }
    
    func getCharacteristics(_ power: String,_ model: String) {
        print("CarEngine: \nModel: \(model), Power: \(power) PS")
    }
}

class BusEngine: Engine {
    var power: String?
    var model: String?
    
    func setPower(_ power: String) {
        self.power = power
    }
    
    func setMode(_ model: String) {
        self.model = model
    }
    
    func getCharacteristics(_ power: String, _ model: String) {
        print("BusEngine: \nModel: \(model), Power: \(power) PS")
    }
}

class CarFactory: AbstractAutoFactory {
    func createWheels() -> Wheels {
        let wheels = CarWheels()
        return wheels
    }
    
    func createEngine() -> Engine {
        let engine = CarEngine()
        return engine
    }
}

class BusFactory: AbstractAutoFactory {
    func createWheels() -> Wheels {
        return BusWheels()
    }
    
    func createEngine() -> Engine {
        return BusEngine()
    }
}

class AutoBuilder {
    private var type: String
    private var autoFactory: AbstractAutoFactory?
    var wheels: Wheels?
    var engine: Engine?
    init(type: String) {
        self.type = type
    }
    
    func initAutoFactory() -> Void {
        if autoFactory != nil { return }
        if type == "Car" { autoFactory = CarFactory() }
        else { autoFactory = BusFactory() }
    }
    
    func buildWheels() -> Wheels {
        initAutoFactory()
        let wheels = autoFactory!.createWheels()
        self.wheels = wheels
        return wheels
    }
    
    func buildEngine() -> Engine {
        initAutoFactory()
        let engine = autoFactory!.createEngine()
        self.engine = engine
        return engine
    }
    
    func getSedan() -> Sedan {
        return Sedan(wheels: self.wheels ?? nil, engine: self.engine ?? nil)
    }
}
