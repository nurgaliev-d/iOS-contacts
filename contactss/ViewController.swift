//
//  ViewController.swift
//  contactss
//
//  Created by Диас Нургалиев on 03.06.2023.
//

import UIKit

class ViewController: UIViewController {

    let image = "cont"
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageview.image = UIImage(named: image)
    }
        

    @IBAction func addcont(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let contName = textfield.text!
        let contNum = textfield1.text!
        
        var contarray:[String] = []
        
        
        if let array = defaults.array(forKey: "contArray"){
            
            contarray = array as! [String]
            contarray.append(contName)
            defaults.set(contarray, forKey: "contArray")
        }else{
            let array = [contName]
            
            defaults.set(array, forKey: "contArray")
            
        }
        var contnum:[String] = []
        
        
        if let array1 = defaults.array(forKey: "contNum"){
                    
                    contnum = array1 as! [String]
                    contnum.append(contNum)
                    defaults.set(contnum, forKey: "contNum")
                }else{
                    let array1 = [contNum]
                    
                    defaults.set(array1, forKey: "contNum")
                    
                }
        textfield.text = ""
        textfield1.text = ""
    }
}

