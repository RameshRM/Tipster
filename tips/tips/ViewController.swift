//
//  ViewController.swift
//  tips
//
//  Created by Mahadevan, Ramesh on 8/23/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var billAmount: UITextField!
    @IBOutlet var selectedTip: UILabel!
    @IBOutlet var totalAmount: UILabel!
    
    @IBOutlet var tipPercentagesList: UISegmentedControl!
    @IBOutlet var tipAmounts: UISegmentedControl!
    private var _tipPercentages = [18,20,22];
    override func viewDidLoad() {

        bindValues(0.0, total: 0.0);
        super.viewDidLoad()
    }
    
    @IBAction func onTipChanged(sender: AnyObject){
        var thisBillAmountString = NSString(string: billAmount.text);
        var selectedTipValue = Double(self._tipPercentages[tipPercentagesList.selectedSegmentIndex])/100;
        var thisBillAmount = thisBillAmountString.doubleValue;
        var tipValue = (thisBillAmount) * selectedTipValue;
        bindValues(tipValue, total: (thisBillAmount + tipValue));
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onTapped(sender: AnyObject) {
        view.endEditing(true);
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    
    func bindValues(tip: Double, total: Double)->Void{
        selectedTip.text = String(format:"$%.2f",tip);
        totalAmount.text = String(format:"$%.2f", total);
    }
}

