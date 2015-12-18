//
//  FriendTableViewController.swift
//  iOS9Features
//
//  Created by Shane on 15/11/25.
//  Copyright © 2015年 Shane. All rights reserved.
//

import UIKit

class FriendTableViewController: UITableViewController {
    
    let datasource = Datasource();
    var lastSelectedFriend: Person?;

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell");
        
        datasource.savePeopleToIndex();
    }
    
    
    func showFriend(id: String) {
        lastSelectedFriend = datasource.friendFromID(id);
        // 从 spotlight 进来都 无法找到 showFriend,.
       // performSegueWithIdentifier("showFriend", sender: self);
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil);
        let friendVC =  sb.instantiateViewControllerWithIdentifier("friendVCSB") as! FriendViewController;
        friendVC.person = lastSelectedFriend;
        self.navigationController?.pushViewController(friendVC, animated: true);

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! FriendViewController;
        destination.person = lastSelectedFriend!;
        
    }
}
    
extension FriendTableViewController  {
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        let person = datasource.people[indexPath.row]
        cell?.textLabel?.text = person.name
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.people.count
    }
    
    // This shouldn't be necessary as the tap action is in the Storyboard, but it doesn't seem to be working in beta 1.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedIndex = tableView.indexPathForSelectedRow?.row
        lastSelectedFriend = datasource.people[selectedIndex!]
        
//        performSegueWithIdentifier("showFriend", sender: self)
        let sb = UIStoryboard.init(name: "Main", bundle: nil);
        let friendVC =  sb.instantiateViewControllerWithIdentifier("friendVCSB") as! FriendViewController;
        friendVC.person = lastSelectedFriend;
        self.navigationController?.pushViewController(friendVC, animated: true);
        
        
    }
}


