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
    var round: Int = 1
    // Сума очків за раунд
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        // Генеруємо випадкове число
        self.number = Int.random(in: 1...50)
        // Передаємо значення випадкового числа в label
        self.label.text = String(self.number)
        
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
        
        // Створюємо мітку для виведення номера версії
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        // Текст мітки
        versionLabel.text = "Версія 1.1"
        // Додаємо мітку до батьківської view
        self.view.addSubview(versionLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    // Лінива властивість для зберігання View Controller
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    // Приватний метод, що завантажує View Controller
    private func getSecondViewController() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
        return viewController as! SecondViewController
    }
    
    @IBAction func showNextScreen() {
        self.present(secondViewController, animated: true)
    }
    
    @IBAction func checkNumber() {
        
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






