//
//  ViewController.swift
//  UIHelper
//
//  Created by Pavan on 08/23/2017.
//  Copyright (c) 2017 Pavan. All rights reserved.
//

import UIKit
import UIHelper 

class ViewController: UIViewController, StoryboardIdentifiable {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sb = UIStoryboard(storyboard: "Main")
        
        // Note: Give storyboardId as ClassName 
        let _: ViewController = sb.instantiateViewController()
        
        /*
        let tableView: UITableView = UITableView()
        tableView.register(TableViewCell.self)
         
         In Cell for rowAt indexPath method
         
         let cell = tableView.dequeueReusableCell(for: indexPath) as TableViewCell
        */
        
        _ = UIApplication.appVersion()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

