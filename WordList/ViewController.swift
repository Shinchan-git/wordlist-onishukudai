//
//  ViewController.swift
//  WordList
//
//  Created by Owner on 2022/05/02.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func back(sender: UIStoryboardSegue) {
        //Do nothing
    }
    
    @IBAction func onStart() {
        let savedData = UserDefaults.standard
        
        if let savedWords = savedData.array(forKey: "WORD") {
            if savedWords.count > 0 {
                performSegue(withIdentifier: "toQuestionView", sender: nil)
            }
            
        } else {
            let alert = UIAlertController(
                title: "単語",
                message: "まずは「単語一覧」をタップして単語登録してください。",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            present(alert, animated: true, completion: nil)
        }
    }
    
}

