//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать массив с ответами на экран с результатами - Done
    // 2. Определить наиболее часто встречающийся тип животного - Done
    // 3. Отобразить результаты в соотвствии с этим животным - Done
    // 4. Избавиться от кнопки возврата назад на экране результатов - Done
    
    //MARK: IBOutlets
    
    @IBOutlet var youAreLabel: UILabel!
    @IBOutlet var youAreInfo: UILabel!
    
    //MARK: Private Properties
    
    var answers: [Answer] = []
    
    //MARK: LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        youAreLabel.text = "Вы - " + String(findTheMostFrequentAnimal().rawValue)
        youAreInfo.text = findTheMostFrequentAnimal().definition
    }
    
    //MARK: IBActions
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    //MARK: Private Methods
    
    private func findTheMostFrequentAnimal() -> AnimalType {
        
        var dogCount = 0
        var catCount = 0
        var rabbitCount = 0
        var turtleCount = 0
        var mostFrequentAnimal: AnimalType = .dog
        
        for animal in answers {
            switch animal.type {
            case .dog:
                dogCount += 1
            case .cat:
                catCount += 1
            case .rabbit:
                rabbitCount += 1
            case .turtle:
                turtleCount += 1
            }
        }
        
        if dogCount > catCount, dogCount > rabbitCount, dogCount > turtleCount {
            mostFrequentAnimal = .dog
        } else if catCount > dogCount, catCount > rabbitCount, catCount > turtleCount {
            mostFrequentAnimal = .cat
        } else if rabbitCount > dogCount, rabbitCount > catCount, rabbitCount > turtleCount {
            mostFrequentAnimal = .rabbit
        } else if turtleCount > dogCount, turtleCount > catCount, turtleCount > rabbitCount {
            mostFrequentAnimal = .turtle
        }
        
        return mostFrequentAnimal
    }
}
