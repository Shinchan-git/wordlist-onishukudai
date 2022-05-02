//
//  QuestionViewController.swift
//  WordList
//
//  Created by Owner on 2022/05/03.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextButton: UIButton!

    var isAnswered: Bool = false
    var wordArray: [Dictionary<String, String>] = []
    var currentNumber: Int = 0
    let savedData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerLabel.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        wordArray = savedData.array(forKey: "WORD") as! [Dictionary<String, String>]
        wordArray.shuffle()
        questionLabel.text = wordArray[currentNumber]["english"]
    }
    
    @IBAction func onNext() {
        if isAnswered {
            currentNumber += 1
            answerLabel.text = ""
            
            if currentNumber < wordArray.count {
                questionLabel.text = wordArray[currentNumber]["english"]
                isAnswered = false
                nextButton.setTitle("答えを表示", for: .normal)
            } else {
                currentNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        } else {
            answerLabel.text = wordArray[currentNumber]["japanese"]
            isAnswered = true
            nextButton.setTitle("次へ", for: .normal)
        }
    }
    
}
