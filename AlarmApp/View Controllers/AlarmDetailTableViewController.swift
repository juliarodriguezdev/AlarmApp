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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpAlarmButton()
    }

    // MARK: - Table view data source
    func setUpAlarmButton() {
        switch alarmIsOn {
            case true:
            enableButton.setTitle("Enabled", for: .normal)
            case false:
            enableButton.setTitle("Disabled", for: .normal)
            
        }
    }

    @IBAction func enableButtonTapped(_ sender: Any) {
        alarmIsOn = !alarmIsOn
        setUpAlarmButton()
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

}
