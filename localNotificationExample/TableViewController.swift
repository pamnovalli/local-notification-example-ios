//
//  TableViewController.swift
//  localNotificationExample
//
//  Created by Pamela Ianovalli on 08/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let notifications = ["Local Notification",
                         "Local Notification with content"]
    
    let notificationCenter = NotificationCenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = notifications[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let notificationType = notifications[indexPath.row]
        
        let alert = UIAlertController(title: "", message: notificationType, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.notificationCenter.scheduleNotification(notificationType: notificationType)
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
