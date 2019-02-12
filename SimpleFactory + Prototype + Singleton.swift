//
//  SimpleFactory.swift
//  DesignPatterns
//
//  Created by Vadim Mocan on 1/29/19.
//  Copyright © 2019 MidnightWorks. All rights reserved.
//

import Foundation
import UIKit

enum CarType {
    case sedan, SUV, truck
}

protocol Car {
    func drive()
}

class Sedan: NSObject, Car {
    var wheels: Wheels?
    var engine: Engine?
    var color: UIColor?
    var maxSpeed: Int?
    var weight: Int?
    
    init(wheels: Wheels?) {
        self.wheels = wheels
    }
    
    init(engine: Engine?) {
        self.engine = engine
    }
    
    init(wheels: Wheels?, engine: Engine?) {
        self.wheels = wheels
        self.engine = engine
    }
    
     init(color: UIColor?, maxSpeed: Int?, weight: Int?) {
        self.color = color
        self.maxSpeed = maxSpeed
        self.weight = weight
    }
    
    //PROTOTYPE
    func copyObject() -> Car {
        return Sedan(color: self.color, maxSpeed: self.maxSpeed, weight: self.weight)
    }
    
    //SINGLETON
    static let shared = Sedan(color: UIColor(), maxSpeed: 0, weight: 0)
    
    class func sharedInstance() -> Sedan {
        return Sedan(color: UIColor(), maxSpeed: 0, weight: 0)
    }
    
    func selfPrint() {
        print(self.color!)
        print(self.maxSpeed!)
        print(self.weight!)
    }
    
    func drive() {
        print("drive a sedan")
    }
}
class SUV: Car {
    func drive() {
        print("drive a SUV")
    }
}

class Truck: Car {
    func drive() {
        print("drive a truck")
    }
}


// Main Factory
class SimpleFactory {
    static let sharedFactory = SimpleFactory()
    
    func produceCar(type: CarType) -> Car {
        switch type {
        case .sedan:
            return Sedan.shared
        case .SUV:
            return SUV()
        case .truck:
            return Truck()
        }
    }
}
