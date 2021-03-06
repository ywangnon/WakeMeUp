//
//  MediaViewController.swift
//  WakeMeUp
//
//  Created by richard oh on 2018. 3. 23..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit
import UserNotifications

class MediaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 

    
  @IBOutlet weak var mediaTableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        }

    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Update the app interface directly.
        
        // Play a sound.
        completionHandler(UNNotificationPresentationOptions.sound)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.content.categoryIdentifier == "TIMER_EXPIRED" {
            // Handle the actions for the expired timer.
            if response.actionIdentifier == "SNOOZE_ACTION" {
                // Invalidate the old timer and create a new one. . .
            }
            else if response.actionIdentifier == "STOP_ACTION" {
                // Invalidate the timer. . .
            }
        }
        
        // Else handle actions for other notification types. . .
    }

    
    
  //header text setting
  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    guard let header = view as? UITableViewHeaderFooterView else {return }
    header.textLabel?.textColor = .gray
    header.textLabel?.font = UIFont.boldSystemFont(ofSize: 10)
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
  //sections
  func numberOfSections(in tableView: UITableView) -> Int {
    return 4
  }
  // header title
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 0 {
      return nil
    }else if section == 1{
      return "   "
    }else if section == 2{
      return "SONGS"
    }else{
      return "RINGTONES"
    }
  }
  // row
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 3{
      return 10
    }else{
      return 1
    }
  }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = mediaTableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath)
    if indexPath.section == 0 {
      cell.textLabel?.text = "Buy More Tones"
    }else if indexPath.section == 1 {
      cell.textLabel?.text = "Vibration"
      cell.accessoryType = .disclosureIndicator
    }else if indexPath.section == 2 {
      cell.textLabel?.text = "Pick a Song"
      cell.accessoryType = .disclosureIndicator
    }else{
      if indexPath.row == 0{
        cell.textLabel?.text = "bell"
        
        
      } else if indexPath.row == 1{
        cell.textLabel?.text = "tickle"
        
      }
    }
    return cell
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let cell = mediaTableView.dequeueReusableCell(withIdentifier: "medisCell", for: indexPath)
    
    if indexPath.section == 3{
      if cell.accessoryType == .checkmark{
        cell.accessoryType = .none
      }else{
        cell.accessoryType = .checkmark
      }
    }
    
    if cell.accessoryType == .checkmark {
        
        let txtStr = cell.textLabel?.text
        UserDefaults.standard.set(txtStr, forKey: "bell")
    }
    
  }
}
