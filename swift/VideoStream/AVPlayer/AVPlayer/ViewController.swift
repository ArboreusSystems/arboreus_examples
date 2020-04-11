//
//  ViewController.swift
//  AVPlayer
//
//  Created by Alexandr Kirilov on 02/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
	
	@IBAction func playVideo(_ sender: AnyObject) {
		
		guard let oUrl = URL(string: "WRITE YOU URL HERE") else {
			return;
		}
		let oPlayer = AVPlayer(url: oUrl);
		let oController = AVPlayerViewController();
		oController.player = oPlayer;
		
		present(oController, animated: true) {
			oPlayer.play();
		}
	}

	override func viewDidLoad() {
		
		super.viewDidLoad();
		view.backgroundColor = .cyan;
	}
}

