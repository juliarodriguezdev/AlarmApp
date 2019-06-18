//
//  AlarmDetailTableViewController.swift
//  AlarmApp
//
//  Created by julia rodriguez on 6/17/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {
    
    var alarm: Alarm? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    var alarmIsOn: Bool = true
    
    @IBOutlet weak var dateDisplayPicker: UIDatePicker!
    @IBOutlet weak var textFieldDetail: UITextField!
    @IBOutlet weak var enableButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    @IBAction func enableButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let alarmName = textFieldDetail.text else { return }
        if let alarm = alarm {
            AlarmController.sharedInstance.update(alarm: alarm, fireDate: dateDisplayPicker.date, name: alarm.name, enabled: alarmIsOn)
        } else {
            AlarmController.sharedInstance.addAlarm(fireDate: dateDisplayPicker.date, name: alarmName, enabled: alarmIsOn)
        }
        navigationController?.popViewController(animated: true)
    }
    

    func updateViews() {

        guard let alarm = alarm else { return }
        alarmIsOn = alarm.enabled
        dateDisplayPicker.date = alarm.fireDate
        textFieldDetail.text = alarm.name
    
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
