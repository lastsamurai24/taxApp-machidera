//
//  ViewController.swift
//  taxApp
//
//  Created by 待寺翼 on 2023/09/04.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    var addtax:Decimal = 0
    var taxArray: [Decimal] = []
    
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var taxRateSegment: UISegmentedControl!
    @IBOutlet weak var tableTaxview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextField.placeholder = "数字を入れてください"
        tableTaxview.delegate = self
        tableTaxview.dataSource = self
        updateLabel()
        taxArray.removeAll()
    }
    
    
    @IBAction func addTextfield(_ sender: Any) {
        updateLabel()
    }
    
    @IBAction func taxchange(_ sender: Any) {
        updateLabel()
    }
    func updateLabel(){
        let tax:Decimal = taxRateSegment.selectedSegmentIndex == 0 ? 1.1 : 1.08
        let cost = Decimal(string: addTextField.text!) ?? 0
        addtax = cost * tax
        let  addtaxString = "\(addtax)"
        showLabel.text = addtaxString
    }
    
    @IBAction func addButton(_ sender: Any) {
        guard addTextField.text != "" else { return }
        
        taxArray.append(contentsOf: [addtax])
        
        UserDefaults.standard.set(taxArray, forKey: "item")
      
        addTextField.text = ""
        updateLabel()
        self.tableTaxview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableTaxview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "\(taxArray[indexPath.row])"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taxArray.remove(at: indexPath.row)
            
            UserDefaults.standard.set(taxArray, forKey: "item")
            tableTaxview.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taxArray.count
        
            
        }
    }

