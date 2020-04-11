//
//  UIHandler.swift
//  UniversalUI
//
//  Created by Alexandr Kirilov on 02/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class UIHandler: NSObject {

	static func mDefineStatusBarBackground() -> Void {
		
		if #available(iOS 13, *) {
			let oStatusBar = UIView(frame: (UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
			oStatusBar.backgroundColor = __STATUS_BAR_BACKGROUND_COLOR;
			UIApplication.shared.keyWindow?.addSubview(oStatusBar);
		} else {
			let oStatusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView;
			if (oStatusBar.responds(to: #selector(setter: UIView.backgroundColor))) {
				oStatusBar.backgroundColor = __STATUS_BAR_BACKGROUND_COLOR;
			}
		}
	}
}
