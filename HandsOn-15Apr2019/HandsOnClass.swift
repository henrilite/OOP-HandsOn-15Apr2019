//
//  HandsOnClass.swift
//  HandsOn-15Apr2019
//
//  Created by Henri Lie Jaya on 15/05/19.
//  Copyright © 2019 Henri Lie Jaya. All rights reserved.
//

import Foundation

class CoffeeMachine {
    var numOfBeans : Int = 100
    var numOfMilk : Int
    let brand : String
    
    init(milk : Int, brand : String) {
        numOfMilk = milk
        self.brand = brand
    }
    
    func addMilk(milk : Int) {
        numOfMilk += milk
    }
    
    func addBeans(beans : Int) {
        numOfBeans += beans
    }
    
    func makeCoffee() {
        numOfBeans -= 2
        numOfMilk -= 1
    }
}
