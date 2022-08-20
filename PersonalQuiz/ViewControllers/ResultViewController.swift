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
        printMostRelevantAnimal()
    }
    
    //MARK: IBActions
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    //MARK: Private Methods
    
    private func findTheMostFrequentAnimal() -> AnimalType {
        
        var animalsCount: [AnimalType: Int] = [:]
        
        for animal in answers {
            if animalsCount.keys.contains(animal.type) {
                animalsCount[animal.type]! += 1
            } else {
                animalsCount[animal.type] = 1
            }
        }
        
        let sortedAnimals = animalsCount.sorted(by: { $0.value > $1.value })
        
        print(sortedAnimals)
        return sortedAnimals.first!.key
    }
    
    private func printMostRelevantAnimal() {
        youAreLabel.text = "Вы - " + String(findTheMostFrequentAnimal().rawValue)
        youAreInfo.text = findTheMostFrequentAnimal().definition
    }
}
