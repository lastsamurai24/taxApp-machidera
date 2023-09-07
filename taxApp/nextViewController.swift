//
//  nextViewController.swift
//  taxApp
//
//  Created by 待寺翼 on 2023/09/05.
//

import UIKit

class nextViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
            let resultArray = UserDefaults.standard.object(forKey: "item") as? [Double]
            UserDefaults.standard.set([0], forKey: "item")
            
        let sum = resultArray!.reduce(0) { (num1:Double, num2:Double) -> Double in
                return num1 + num2
                
            }
            
            resultLabel.text = String(format: "%.0f", sum)
            
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    

