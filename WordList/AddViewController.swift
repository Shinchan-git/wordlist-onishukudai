//
//  AddViewController.swift
//  WordList
//
//  Created by Owner on 2022/05/03.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!

    var wordArray: [Dictionary<String, String>] = []
    let savedData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedWords = savedData.array(forKey: "WORD") {
            wordArray = savedWords as! [Dictionary<String, String>]
        }
    }
    
    @IBAction func saveWord() {
        if englishTextField.text! == "" || japaneseTextField.text! == "" { return }
        let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
        
        wordArray.append(wordDictionary)
        savedData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "単語の登録が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
    }
    
}
