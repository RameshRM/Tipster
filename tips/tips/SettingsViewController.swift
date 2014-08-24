//
//  SettingsViewController.swift
//  tips
//
//  Created by Mahadevan, Ramesh on 8/23/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var defaultTipsPercentage: UITextField!
    @IBOutlet var saveSettings: UIBarButtonItem!
    private var defaultTips: Double=0;
    override func viewDidLoad() {
        saveSettings.enabled = false;
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func closeSettings(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onTapped(sender: AnyObject) {
        view.endEditing(true);
    }
    
    @IBAction func onTipsPercenatgeChanged(sender: AnyObject) {
        var defaultTipsInString = NSString(string: defaultTipsPercentage.text);
        var defaultTip = defaultTipsInString.doubleValue;
        bindState(defaultTipsInString.doubleValue);
        defaultTips = getValidTipValue(defaultTip);
    }
    
    @IBAction func save(sender: AnyObject) {
        AppSettings.set("defaultTips", settingsValue: defaultTips);
        closeSettings(sender);
    }
    
    func bindState(tipsPercentage: Double)->Void{
        saveSettings.enabled = (tipsPercentage > 0 && tipsPercentage < 100);
    }
    
    
    func getValidTipValue(tipValue: Double)->Double{
        if(tipValue > 0 && tipValue < 100){
            return tipValue;
        }
        return 0;
    }
    
}
