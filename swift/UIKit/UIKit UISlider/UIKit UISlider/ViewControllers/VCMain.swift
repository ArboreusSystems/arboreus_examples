//
//  VCMain.swift
//  UIKit UISlider
//
//  Created by Alexandr Kirilov on 01/08/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit
import AVFoundation

class VCMain: UIViewController {

	var pPlayer: AVAudioPlayer = AVAudioPlayer();
	let pSlider: UISlider = UISlider();
	let pPlayerControl: UIView = UIView();
	let pButtonPlay: UIButton = UIButton();
	let pButtonPause: UIButton = UIButton();

	let pLabelLanguage: UILabel = UILabel();
	let pLabelNotice: UILabel = UILabel();
	let pButtonExit: UIButton = UIButton();

	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = _COLOR_WHITE;
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad();
		
		self.mCreateLabelLanguage();
		self.mCreateLabelNotice();
		self.mCreateButtonExit();
		
		self.mCreatePlayerMenu();
		self.mCreateSlider();
		
		do {
			let oAudioPath: Optional<String> = Bundle.main.path(forResource: "sample", ofType: "mp3");
			try pPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: oAudioPath!));
			pSlider.maximumValue = Float(pPlayer.duration);
		} catch {
			print("Audio player error");
		}
	}
	
	private func mCreateSlider() -> Void {
	
		pSlider.minimumValue = 0.0;
		pSlider.addTarget(self, action: #selector(mDoPlayerPosition(inSlider:)), for: .valueChanged);
		self.view.addSubview(pSlider);
		pSlider.translatesAutoresizingMaskIntoConstraints = false;
		pSlider.centerXAnchor.constraint(equalTo: pPlayerControl.centerXAnchor).isActive = true;
		pSlider.topAnchor.constraint(
			equalTo: pPlayerControl.bottomAnchor,
			constant: self.view.bounds.height * 0.02
		).isActive = true;
		pSlider.widthAnchor.constraint(equalTo: pPlayerControl.widthAnchor).isActive = true;
		pSlider.heightAnchor.constraint(equalTo: pButtonExit.heightAnchor).isActive = true;
	}
	
	private func mCreatePlayerMenu() -> Void {
		
		self.view.addSubview(pPlayerControl);
		pPlayerControl.translatesAutoresizingMaskIntoConstraints = false;
		pPlayerControl.widthAnchor.constraint(
			equalTo: self.view.widthAnchor,
			constant: -self.view.bounds.width * 0.2
		).isActive = true;
		pPlayerControl.heightAnchor.constraint(
			equalTo: self.view.heightAnchor,
			constant: -self.view.bounds.height * 0.83
		).isActive = true;
		pPlayerControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
		pPlayerControl.centerYAnchor.constraint(
			equalTo: self.view.centerYAnchor,
			constant: -self.view.bounds.height * 0.13
		).isActive = true;
		pPlayerControl.backgroundColor = _COLOR_PURPLE;
		
		self.view.addSubview(pButtonPlay);
		pButtonPlay.translatesAutoresizingMaskIntoConstraints = false;
		pButtonPlay.backgroundColor = _COLOR_CLEAN_WHITE;
		pButtonPlay.setTitleColor(_COLOR_PURPLE, for: .normal);
		pButtonPlay.setTitle("Play", for: .normal);
		pButtonPlay.addTarget(self, action: #selector(mDoPlay), for: .touchUpInside);
		pButtonPlay.centerYAnchor.constraint(equalTo: pPlayerControl.centerYAnchor).isActive = true;
		pButtonPlay.leftAnchor.constraint(equalTo: pPlayerControl.leftAnchor, constant: self.view.bounds.height * 0.04).isActive = true;
		pButtonPlay.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.25).isActive = true;
		pButtonPlay.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.08).isActive = true;
		
		self.view.addSubview(pButtonPause);
		pButtonPause.translatesAutoresizingMaskIntoConstraints = false;
		pButtonPause.backgroundColor = _COLOR_CLEAN_WHITE;
		pButtonPause.setTitleColor(_COLOR_PURPLE, for: .normal);
		pButtonPause.setTitle("Pause", for: .normal);
		pButtonPause.addTarget(self, action: #selector(mDoPause), for: .touchUpInside);
		pButtonPause.centerYAnchor.constraint(equalTo: pPlayerControl.centerYAnchor).isActive = true;
		pButtonPause.rightAnchor.constraint(equalTo: pPlayerControl.rightAnchor, constant: -self.view.bounds.height * 0.04).isActive = true;
		pButtonPause.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.25).isActive = true;
		pButtonPause.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.08).isActive = true;
	}
	
	private func mCreateLabelLanguage() -> Void {

		pLabelLanguage.text = "Swift examples";
		self.view.addSubview(pLabelLanguage);
		pLabelLanguage.translatesAutoresizingMaskIntoConstraints = false;
		pLabelLanguage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true;
		pLabelLanguage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
	}

	private func mCreateLabelNotice() -> Void {

		pLabelNotice.text = "UISlider Example";
		self.view.addSubview(pLabelNotice);
		pLabelNotice.translatesAutoresizingMaskIntoConstraints = false;
		pLabelNotice.topAnchor.constraint(equalTo: self.pLabelLanguage.bottomAnchor, constant: 20).isActive = true;
		pLabelNotice.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
	}

	private func mCreateButtonExit() -> Void {

		self.view.addSubview(pButtonExit);
		pButtonExit.translatesAutoresizingMaskIntoConstraints = false;
		pButtonExit.backgroundColor = _COLOR_BLUE_DARK;
		pButtonExit.setTitleColor(.white, for: .normal);
		pButtonExit.setTitle("Exit", for: .normal);
		pButtonExit.addTarget(self, action: #selector(mDoExit), for: .touchUpInside);
		pButtonExit.centerXAnchor.constraint(
			equalTo: self.view.centerXAnchor
		).isActive = true;
		pButtonExit.bottomAnchor.constraint(
			equalTo: self.view.bottomAnchor,
			constant: -self.view.bounds.height * 0.06
		).isActive = true;
		pButtonExit.widthAnchor.constraint(
			equalTo: self.view.widthAnchor,
			constant: -self.view.bounds.width * 0.2
		).isActive = true;
		pButtonExit.heightAnchor.constraint(
			equalTo: self.view.heightAnchor,
			constant: -self.view.bounds.height * 0.93
		).isActive = true;
	}
	
	@objc private func mDoPlayerPosition(inSlider: UISlider) -> Void {
		
		if (inSlider == pSlider) {
			self.pPlayer.currentTime = TimeInterval(inSlider.value);
		}
	}
	
	@objc private func mDoPlay() -> Void {
		
		self.pPlayer.play();
	}
	
	@objc private func mDoPause() -> Void {
	
		self.pPlayer.pause();
	}

	@objc private func mDoExit() -> Void {

	    HMain.mDoExit();
	}
}
