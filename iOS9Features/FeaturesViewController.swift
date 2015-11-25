//
//  FirstViewController.swift
//  iOS9Features
//
//  Created by Shane on 15/11/25.
//  Copyright © 2015年 Shane. All rights reserved.
//

import UIKit

class FeaturesViewController: UITableViewController {
    
    var _feature : NSArray = ["Search APIs"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell : UITableViewCell!;
        var cellId : String!;
        cellId = "cell";
        cell = tableView.dequeueReusableCellWithIdentifier(cellId);
//        if (cell == nil) {
//            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellId);
//        }
        
        cell.textLabel?.text = _feature.objectAtIndex(indexPath.row) as? String;
        return cell;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return _feature.count;
        
    }

}

