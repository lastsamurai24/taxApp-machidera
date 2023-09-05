//
//  ViewController.swift
//  taxApp
//
//  Created by 待寺翼 on 2023/09/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showLabel: UILabel!
    var taxArray: [String] = []
    @IBOutlet weak var addTextField: UITextField!
    
    @IBOutlet weak var taxRateSegment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDfaults = UserDefaults.standard
        if userDfaults.object(forKey: "tax") != nil {
            taxArray = userDfaults.object(forKey: "tax") as! [String]
        
        }
    }
    
    
    
    
    @IBAction func addButton(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        taxArray = []
        if addTextField.text != "" {
            taxArray.append(addTextField.text!)
            userDefaults.set(taxArray, forKey: "tax")
            self.navigationController?.popViewController(animated: true)
            //questionsキーで保存されてるオブジェクトがあったら
            if userDefaults.object(forKey: "tax")  != nil {
            }
            addTextField.text = ""
        }
    }
}
