//
//  TableViewController.swift
//  contactss
//
//  Created by Диас Нургалиев on 03.06.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayCont = [""]
    var arrayNum = [""]
    var suret = "cont"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    override func viewWillAppear(_ animated: Bool) {
            let defaults = UserDefaults.standard
            
            if let array = defaults.array(forKey: "contArray"){
                arrayCont = array as! [String]
                
            }
            if let array = defaults.array(forKey: "contNum"){
                arrayNum = array as! [String]
                
            }
            tableView.reloadData()
        }
    

    func saveConts(){
            let defaults = UserDefaults.standard
            
            defaults.set(arrayCont, forKey: "contArray")
            defaults.set(arrayNum, forKey: "contNum")
        tableView.reloadData()
        }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayCont.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
//            cell.textLabel?.text = arrayCont[indexPath.row]
//            cell.detailTextLabel?.text = arrayNum[indexPath.row]
            
            // Configure the cell...\
        let labelName = cell.viewWithTag(1000) as! UILabel
        labelName.text = arrayCont[indexPath.row]
        
        let labelNum = cell.viewWithTag(1001) as! UILabel
        labelNum.text = arrayNum[indexPath.row]
        
        if arrayCont.isEmpty{
            let Image = cell.viewWithTag(1002) as! UIImageView
            Image.image = UIImage(named: suret)
        }
//            let imageview = cell.viewWithTag(1002) as! UIImageView
//            imageview.image = UIImage(named: suret)!
                return cell
        }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let mainScreen = storyboard?.instantiateViewController(identifier: "main") as!ViewController
//
//        mainScreen.image = suret
//
//        navigationController?.show(mainScreen, sender: self)
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            arrayCont.remove(at: indexPath.row)
            
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            saveConts()
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
