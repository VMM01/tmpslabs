//
//  ViewController.swift
//  DesignPatterns
//
//  Created by Vadim Mocan on 1/29/19.
//  Copyright © 2019 MidnightWorks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let factory = SimpleFactory.sharedFactory
        
        let sedanCar = factory.produceCar(type: .sedan) as! Sedan
        
//
////        let sedanFactory = SedanFactory() // FACTORY METHOD
////        let sedan = sedanFactory.produce()
//        
////        let sedan = Sedan.shared // Singleton Value
////        let sedan = Sedan.sharedInstance() // Singleton Complex
//        sedan.drive()
//        sedan.color = .red
//        sedan.maxSpeed = 250
//        sedan.weight = 1500
//        sedan.selfPrint()
//        let copySedan = sedan.copyObject() as! Sedan
//        copySedan.color = .yellow
//        copySedan.selfPrint()
//        
//        
//        //FACTORY METHOD
////        let suvFactory = SUVFactory()
////        let suv = suvFactory.produce()
////        suv.drive()
////
////        let truckFactory = TruckFactory()
////        let truck = truckFactory.produce()
////        truck.drive()
//        let sedanFactory = SedanFactory()
//        let suvFactory = SUVFactory()
//        let truckFactory = TruckFactory()
//        
//        let sedanDirector = Director(factory: sedanFactory)
//        sedanDirector.produce()
//        
//        let suvDirector = Director(factory: suvFactory)
//        suvDirector.produce()
//        
//        let truckDirector = Director(factory: truckFactory)
//        truckDirector.produce()
        
        //ABSTRACT FACTORY
        let autoBuilder: AutoBuilder = AutoBuilder(type: "Car")
        let wheels: CarWheels = autoBuilder.buildWheels() as! CarWheels
        wheels.setMode("Michlenne")
        wheels.setSize(19)
        wheels.getCharacteristics(String(wheels.size!), wheels.model!)
        let engine: CarEngine = autoBuilder.buildEngine() as! CarEngine
        engine.setMode("Diesel")
        engine.setPower("150")
        engine.getCharacteristics(engine.power!, engine.model!)
        let sedan = autoBuilder.getSedan()
        
        let busBuilder: AutoBuilder = AutoBuilder(type: "Bus")
        let busWheels: BusWheels = busBuilder.buildWheels() as! BusWheels
        busWheels.setMode("Nokian")
        busWheels.setSize(30)
        busWheels.getCharacteristics(String(busWheels.size!), busWheels.model!)
        let busEngine: BusEngine = busBuilder.buildEngine() as! BusEngine
        busEngine.getCharacteristics(busEngine.power ?? "Engine is not produced", busEngine.model ?? "Engine is not produced")
    }
}

