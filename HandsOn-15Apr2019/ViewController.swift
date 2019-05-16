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
    
// Handson 16Mei
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
// ---
    var coffeeMachine: CoffeeMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coffeeMachine = CoffeeMachine(milk: 200, brand: "Nescafe")
        print("Jumlah Beans : \(coffeeMachine.numOfBeans), Jumlah Milk : \(coffeeMachine.numOfMilk)")
        updateCoffee()
        print(coffeeMachine.voltage)
        print(coffeeMachine.runMotor)
        
//individual delegate buat passwordtextfield, untuk username sudah didelegate dengan klik kanan di usernametextfield
// tips untuk delegate atau konfigurasi lainnya jika dapat dilakukan di storyboard sebaiknya dilakukan di storyboard
        
        
        passwordTextField.delegate = self
    }
    
    
//-----
    
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
    
    @IBAction func submitButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail", let destination = segue.destination as? DetailViewController {
            destination.nameFromPreviousView = userNameTextField.text
        }
    }

    
}
//Handson 16Mei - agar textfield bisa ganti ke textfield selanjutnya.
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField{
            // biar harus ada isinya.
            if textField.text == "" {
                let alert = UIAlertController(title: "Error", message: "You should enter your username", preferredStyle: .alert)
                //biar alert bisa diklik OK
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert,animated: true, completion: nil)
            } else {
                passwordTextField.becomeFirstResponder()
            }
            passwordTextField.becomeFirstResponder()
        } else {
// biar di detail dismiss atau hilang atau mengecil
            passwordTextField.resignFirstResponder()
        }
        return true
    }
}

