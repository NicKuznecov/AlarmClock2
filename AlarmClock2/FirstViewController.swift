//
//  FirstViewController.swift
//  AlarmClock2
//
//  Created by 200231116 on 2015-04-02.
//  Copyright (c) 2015 200231116. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate {

  //  string selectedDate;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var alarmArray: [String] = []


    @IBOutlet weak var alarmDatePicker: UIDatePicker!
    @IBOutlet weak var alarmPickerView: UIPickerView!
    @IBOutlet weak var clockModeOutlet: UISegmentedControl!
    
    @IBAction func setAlarmAction(sender: AnyObject)
    {
        
        var formatter: NSDateFormatter = NSDateFormatter()
        if (test.text == "12 Hour Mode")
        {
            formatter.dateFormat = "dd-MM-yyyy hh:mm a"
        }
        else if (test.text == "24 Hour Mode")
        {
            formatter.dateFormat = "dd-MM-yyyy HH:mm"
        }
        let stringDate: String = formatter.stringFromDate(alarmDatePicker.date)
        println(stringDate)
    
        alarmArray.append(stringDate)
        
        alarmPickerView.reloadAllComponents()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return alarmArray.count}
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    return alarmArray[row]}
    
    @IBAction func deleteAlarmAction(sender: AnyObject) {
        
        
    }
    @IBAction func alarmClockAction(sender: AnyObject) {
    }
    
    @IBOutlet weak var test: UILabel!
    @IBAction func clockModeAction(sender:
        AnyObject) {
            
    }
    
    @IBAction func indexChanged (sender:UISegmentedControl)
    {
        switch clockModeOutlet.selectedSegmentIndex {
            
        case 0:
            test.text = "12 Hour Mode";
        alarmDatePicker.locale = NSLocale(localeIdentifier: "default")
        case 1:
            test.text = "24 Hour Mode";
         alarmDatePicker.locale = NSLocale(localeIdentifier: "en_DK")
            
        default:
            
            break;
        }
        
        
    }
    
    
}

