//
//  FirstViewController.swift
//  AlarmClock2
//
//  Created by Nick Kuznecov, Jacob Garland on 2015-04-02.
// Purpose: This is the primary page of the application responsible for setting the alarms and allowing users to delete them

import UIKit


class FirstViewController: UIViewController, UIPickerViewDelegate, UIAlertViewDelegate {
    
    @IBOutlet weak var loadImage: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var alarmDatePicker: UIDatePicker!
    @IBOutlet weak var alarmPickerView: UIPickerView!
    @IBOutlet weak var clockModeOutlet: UISegmentedControl!

    var modeString = String()

    var selectedValue = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
     
        var timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector("checkTime"), userInfo: nil, repeats: true)
        
    
    }
    

    func checkTime()
    {
        var counter = 0
        for time:String in alarmArray {
            
            //formats dates from the date picker based on if its 24 hour mode or 12 hour mode
            var formatter: NSDateFormatter = NSDateFormatter()
            var militaryFormatter: NSDateFormatter = NSDateFormatter()
            formatter.dateFormat = "dd-MM-yyyy hh:mm a"
            militaryFormatter.dateFormat = "dd-MM-yyyy HH:mm"
 
            
            // accepts the datepicker info into a variable
            let militaryDateSearch: String = militaryFormatter.stringFromDate(NSDate())
            let dateSearch: String = formatter.stringFromDate(NSDate())
            
            if time == dateSearch || time == militaryDateSearch
                
            {
                //alerts the user of the alarm if they are still running the app when its time
                let alertView = UIAlertView(title: "ALARM!!!!!!", message: time, delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "OK")
                alertView.alertViewStyle = .Default
                alertView.show()
                
                alarmArray.removeAtIndex(counter)
                alarmPickerView.reloadAllComponents()

            }
            counter = counter + 1
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // an array that fills the list with set dates
    var alarmArray: [String] = []
    
    @IBAction func setAlarmAction(sender: AnyObject)
    {
        

        //formats dates from the date picker based on if its 24 hour mode or 12 hour mode
        var formatter: NSDateFormatter = NSDateFormatter()
        if (test.text == "12 Hour Mode")
        {
            formatter.dateFormat = "dd-MM-yyyy hh:mm a"
        }
        //
        else if (test.text == "24 Hour Mode")
        {
            formatter.dateFormat = "dd-MM-yyyy HH:mm"
        }
        
        // accepts the datepicker info into a variable
        let stringDate: String = formatter.stringFromDate(alarmDatePicker.date)
        println(stringDate)
        
        //alerts the user of the alarm if they are still running the app when its time
        let alertView = UIAlertView(title: "Alarm set to:", message: stringDate, delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "OK")
        alertView.alertViewStyle = .Default
        alertView.show()
        
        //alerts the user of the alarm if they are working outside the app
        var localNotification:UILocalNotification = UILocalNotification()
        localNotification.alertAction = "ALARM"
        localNotification.alertBody = "Wake up!"
        localNotification.fireDate = alarmDatePicker.date
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    
        alarmArray.append(stringDate)
        
        //refresh the picker
        alarmPickerView.reloadAllComponents()
    }
    
    // these functions set the picker to be as big as the array of dates
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return alarmArray.count}
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        //stores the selected row number of the pickerview in a variable
        var selectedValue = alarmArray[pickerView.selectedRowInComponent(0)]

    return alarmArray[row]
        
    }
    
    @IBAction func deleteAlarmAction(sender: AnyObject) {
        
        
    }
    @IBAction func alarmClockAction(sender: AnyObject) {
    }
    
    @IBOutlet weak var test: UILabel!
    @IBAction func clockModeAction(sender:
        AnyObject) {
            
    }
    // sets the mode of the date picker from 24 hour mode to 12 hour mode and vice versa
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
    
    @IBAction func deleteButton(sender: AnyObject) {
        //uses stored pickerview variable to delete the appropriate array entry and reload the pickerview
        alarmArray.removeAtIndex(selectedValue)
        alarmPickerView.reloadAllComponents()

        
        }
    }
    


