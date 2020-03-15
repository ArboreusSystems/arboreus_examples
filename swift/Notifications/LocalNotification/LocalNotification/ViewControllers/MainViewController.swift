//
//  MainViewController.swift
//  LocalNotification
//
//  Created by Alexandr Kirilov on 15/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit
import UserNotifications

class MainViewController: UIViewController, UNUserNotificationCenterDelegate {
	
    override func viewDidLoad() {
		
		super.viewDidLoad();
		view.backgroundColor = __COLOR_GREEN;
		
		let center = UNUserNotificationCenter.current();
		center.delegate = self;
		center.requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {(inGranted,inError) in
			print("Granted: \(inGranted)");
			print("Error: \(String(describing: inError))");
		});
		
		let content = UNMutableNotificationContent();
		content.title = "Content title";
		content.body = "Content body";
		content.sound = UNNotificationSound.default;
		
		let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false);
		
		let request = UNNotificationRequest(identifier: "test", content: content, trigger: trigger);
		center.add(request) { (inError) in
			print("Completed. Error: \(String(describing: inError))");
		}
	}
	
	func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
		
		completionHandler([.alert,.sound,.badge]);
	}
	
	func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
		
		if (response.notification.request.identifier == "test") {
			
			print("Identifier: \(response.notification.request.identifier)");
			view.backgroundColor = __COLOR_BLUE;
		}
	}
}
