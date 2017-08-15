//
//  ViewController.swift
//  GCNotificationView
//
//  Created by jhl1214@me.com on 08/11/2017.
//  Copyright (c) 2017 jhl1214@me.com. All rights reserved.
//

import UIKit
import GCNotificationView

class ViewController: UIViewController {
    @IBOutlet var customView: UIView!
    
    var notificationView: GCNotificationView = GCNotificationView()
    var yPoint: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideAllTabbar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func hideAllTabbar() {
        self.tabBarController?.tabBar.isHidden = true
        self.customView.isHidden = true
    }
}

extension ViewController {
    @IBAction func toggleYAxis(_ sender: UISegmentedControl) {
        hideAllTabbar()
        
        switch sender.selectedSegmentIndex {
        case 0:
            notificationView.yPoint = 0
            yPoint = 0
        case 1:
            notificationView.yPoint = self.tabBarController?.tabBar.bounds.height ?? 0
            yPoint = self.tabBarController?.tabBar.bounds.height ?? 0
            self.tabBarController?.tabBar.isHidden = false
        case 2:
            notificationView.yPoint = self.customView.bounds.height
            yPoint = self.customView.bounds.height
            self.customView.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func toggleColor(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            notificationView.bgColor = UIColor(red: 78 / 255, green: 136 / 255, blue: 207 / 255, alpha: 1.0)
        case 1:
            notificationView.bgColor = .red
        case 2:
            notificationView.bgColor = .orange
        default:
            break
        }
    }
    
    @IBAction func toggleShowNotification(_ sender: UIButton) {
        notificationView.show(message: "Hello, World!")
    }
}
