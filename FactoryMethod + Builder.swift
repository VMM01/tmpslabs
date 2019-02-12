//
//  FactoryMethod.swift
//  DesignPatterns
//
//  Created by Vadim Mocan on 1/29/19.
//  Copyright © 2019 MidnightWorks. All rights reserved.
//

import Foundation

// Factories Interface
protocol Factory {
    func produceWheel()
    func produceEngine()
    func produceChassis()
}

// concrete factory
class SedanFactory: Factory {
    func produceWheel() {
        print("produce wheel for sedan")
    }
    func produceEngine() {
        print("produce engine for sedan")
    }
    func produceChassis() {
        print("produce chassis for sedan")
    }
}

class SUVFactory: Factory {
    func produceWheel() {
        print("produce wheel for SUV")
    }
    func produceEngine() {
        print("produce engine for SUV")
    }
    func produceChassis() {
        print("produce chassis for SUV")
    }
}

class TruckFactory: Factory {
    func produceWheel() {
        print("produce wheel for Truck")
    }
    func produceEngine() {
        print("produce engine for Truck")
    }
    func produceChassis() {
        print("produce chassis for Truck")
    }
}

class Director {
    var factory: Factory
    init(factory: Factory) {
        self.factory = factory
    }
    func produce() {
        factory.produceWheel()
        factory.produceEngine()
        factory.produceChassis()
    }
}
