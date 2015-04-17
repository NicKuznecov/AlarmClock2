//
//  ThirdViewController.swift
//  AlarmClock2
//
//  Created by Nick Kuznecov, Jacob Garland on 2015-04-02.
// Purpose: This is the third and final page of the app, where settings for the applications other pages are changed and set.
import UIKit

class ThirdViewController: UIViewController {
    var modeStringTwo = "false"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBOutlet weak var clockModeOutlet2: UISegmentedControl!
    @IBAction func modeButton(sender: AnyObject) {
        switch clockModeOutlet2.selectedSegmentIndex {
        case 0:
            modeStringTwo = "false"
        case 1:
            modeStringTwo = "true"
        default:
            break;
        }
        
    }

    // sets the mode of the date picker from 24 hour mode to 12 hour mode and vice versa

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}