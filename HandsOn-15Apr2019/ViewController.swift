//
//  ViewController.swift
//  HandsOn-15Apr2019
//
//  Created by Henri Lie Jaya on 15/05/19.
//  Copyright © 2019 Henri Lie Jaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var coffeeLabel: UILabel!
    @IBOutlet weak var milkLabel: UILabel!
    
    var coffeeMachine: CoffeeMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coffeeMachine = CoffeeMachine(milk: 200, brand: "Nescafe")
        print("Jumlah Beans : \(coffeeMachine.numOfBeans), Jumlah Milk : \(coffeeMachine.numOfMilk)")
        updateCoffee()
        print(coffeeMachine.voltage)
        print(coffeeMachine.runMotor)
    }
    
    func updateCoffee(){
        coffeeLabel.text = String(coffeeMachine.numOfBeans)
        milkLabel.text = String(coffeeMachine.numOfMilk)
    }
    
    @IBAction func addCoffee(_ sender: Any) {
        coffeeMachine.addBeans(beans: 100)
        updateCoffee()
    }
    @IBAction func addMilk(_ sender: Any) {
        coffeeMachine.addMilk(milk: 100)
        updateCoffee()
    }
    @IBAction func makeCoffee(_ sender: Any) {
        coffeeMachine.makeCoffee()
        updateCoffee()
    }
    
}

