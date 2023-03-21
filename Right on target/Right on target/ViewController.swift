//
//  ViewController.swift
//  Right on target
//
//  Created by Oleksandr Sushchenko on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    // Загадане число
    var number: Int = 0
    // Раунд
    var round: Int = 0
    // Сума очок за раунд
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Генеруємо випадкове число
        self.number = Int.random(in: 1...50)
        // Передаємо значення випадкового числа в label
        self.label.text = String(self.number)
        
    }
    
    @IBAction func checkNumber() {
        
        // Якщо гра тільки починається
        if self.round == 0 {
            // Генеруємо випадкове число
            self.number = Int.random(in: 1...50)
            // Передаємо значення випадкового числа в label
            self.label.text = String(self.number)
            // Встановлюємо лічильник раундів на 1
            self.round = 1
        } else {
            // Отримуємо значення на слайдері
            let numSlider = Int(self.slider.value)
            // Порівнюємо значення із загаданим та підраховуємо очки
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            } else if numSlider < self.number {
                self.points += 50 - self.number + numSlider
            } else {
                self.points += 50
            }
            if self.round == 5 {
                // АЛЕРТ виводимо інформаційне вікно з результатами гри
                let alert = UIAlertController(
                    title: "Гру закінчено",
                    message: "Ви заробили \(self.points) очків",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Почати заново", style:
                        .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
            }
            // Генеруємо випадкове число
            self.number = Int.random(in: 1...50)
            // Передаємо значення випадкового числа в label
            self.label.text = String(self.number)
        }
    }
    
}






