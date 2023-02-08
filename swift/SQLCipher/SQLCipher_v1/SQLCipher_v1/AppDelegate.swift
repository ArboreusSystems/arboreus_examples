//
//  AppDelegate.swift
//  SQLCipher_v1
//
//  Created by Alexandr KIRILOV on 08/02/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		var oRC: Int32;
		var oDB: OpaquePointer? = nil;
		var oSTMT: OpaquePointer? = nil
		let oPassword: String = "password";
		
		var oStatus: Bool = false;
		
		oRC = sqlite3_open(":memory:", &oDB);
		if (oRC != SQLITE_OK) {
			let oErrorMessage = String(cString: sqlite3_errmsg(oDB));
			NSLog("Error opening database: \(oErrorMessage)");
			return oStatus;
		}
		
		oRC = sqlite3_key(oDB, oPassword, Int32(oPassword.utf8CString.count));
		if (oRC != SQLITE_OK) {
			let oErrorMessage = String(cString: sqlite3_errmsg(oDB));
			NSLog("Error setting key: \(oErrorMessage)");
		}
		
		oRC = sqlite3_prepare(oDB, "PRAGMA cipher_version;", -1, &oSTMT, nil)
		if (oRC != SQLITE_OK) {
			let oErrorMessage = String(cString: sqlite3_errmsg(oDB));
			NSLog("Error preparing SQL: \(oErrorMessage)");
		}
		
		oRC = sqlite3_step(oSTMT);
		if (oRC == SQLITE_ROW) {
			NSLog("cipher_version: %s", sqlite3_column_text(oSTMT, 0));
		} else {
			let oErrorMessage = String(cString: sqlite3_errmsg(oDB));
			NSLog("Error retrieiving cipher_version: \(oErrorMessage)");
		}
		
		sqlite3_finalize(oSTMT)
		sqlite3_close(oDB)
		
		oStatus = true;
		
		return oStatus;
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}

