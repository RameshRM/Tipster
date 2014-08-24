//
//  AppSettings.swift
//  tips
//
//  Created by Mahadevan, Ramesh on 8/23/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import Foundation

class AppSettings{
    enum SettingKeys{
        case DefaultTips
    }
    
    class func set(settingsKey: String, settingsValue: AnyObject!)->Void{
        var defaults = NSUserDefaults.standardUserDefaults();
        defaults.setObject(settingsValue, forKey: settingsKey);
    }
    
    class func get(settingsKey: String)->AnyObject!{
        var defaults = NSUserDefaults.standardUserDefaults();
        return defaults.objectForKey(settingsKey);

    }
    
    func doSomething(arg1: String)->Void{
        println("do Something");
    }
    
}