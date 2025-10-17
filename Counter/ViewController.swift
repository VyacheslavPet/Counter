//
//  ViewController.swift
//  Counter
//
//  Created by Петров Вячеслав on 17.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var historyView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var count = 0
    let f: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return f
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = "0"
        counterLabel.font = .boldSystemFont(ofSize: 64)
        counterLabel.textAlignment = .center
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
                
        // Настройка истории
        historyView.text = "История изменений:\n"
        historyView.isEditable = false
        historyView.layer.borderWidth = 1
        historyView.layer.cornerRadius = 10
        historyView.translatesAutoresizingMaskIntoConstraints = false
        
        //Кнопки
        plusButton.backgroundColor = .systemRed
        minusButton.backgroundColor = .systemBlue
        resetButton.backgroundColor = .systemGray
        }
    
    func log(_ text: String) {
        historyView.text += "\(f.string(from: Date())): \(text)\n"
        historyView.scrollRangeToVisible(NSRange(location: historyView.text.utf16.count - 1, length: 0))
    }
   
    @IBAction func minusCounter(_ sender: Any) {
        count -= 1
        counterLabel.text = "\(count)"
        log("значение изменено на -1")
    }
    
    @IBAction func plusCounter(_ sender: Any) {
        count += 1
        counterLabel.text = "\(count)"
        log("значение изменено на +1")
    }
    
    @IBAction func reserCounter(_ sender: Any) {
        count = 0
        counterLabel.text = "\(count)"
        log("значение изменено на 0")
    }
}
