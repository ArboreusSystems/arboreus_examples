//
//  VCRoot.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 18/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCRoot: UIViewController {

	private var pCurrent: UIViewController;
	
	init() {
		self.pCurrent = VCSplash();
		super.init(nibName: nil, bundle: nil);
	}
	
	required init?(coder aDecoder: NSCoder) {
	
		self.pCurrent = VCSplash();
		super.init(coder: aDecoder);
	}
	
	override func loadView() {

		super.loadView();
		self.view.backgroundColor = _COLOR_BLUE;
	}

    override func viewDidLoad() {
		
		super.viewDidLoad();
		
		self.addChild(pCurrent);
		pCurrent.view.frame = self.view.bounds;
		self.view.addSubview(pCurrent.view);
		pCurrent.didMove(toParent: self);
	}
	
	func mShowAuth() -> Void {
		
		let oAuth: UINavigationController = UINavigationController(
			rootViewController: VCAuth()
		);
		self.addChild(oAuth);
		oAuth.view.frame = self.view.bounds;
		self.view.addSubview(oAuth.view);
		oAuth.didMove(toParent: self);
		pCurrent.willMove(toParent: nil);
		pCurrent.view.removeFromSuperview();
		pCurrent.removeFromParent();
		pCurrent = oAuth;
	}
	
	func mShowMain() -> Void {
		
		self.mAnimateFade(to: UINavigationController(
			rootViewController: VCMain()
		));
	}
	
	func mShowAuthFromApp() -> Void {
		
		self.mAnimateDismiss(to: UINavigationController(
			rootViewController: VCAuth()
		))
	}
	
	private func mAnimateFade(
		to inViewController: UIViewController, inCompletion: (() -> Void)? = nil
	) -> Void {
	
		pCurrent.willMove(toParent: nil);
		self.addChild(inViewController);
		self.transition(
			from: pCurrent, to: inViewController,
			duration: 0.5, options: [.transitionCrossDissolve, .curveEaseOut],
			animations: {}, completion: { completed in
				self.pCurrent.removeFromParent();
				inViewController.didMove(toParent: self);
				self.pCurrent = inViewController;
				inCompletion?();
		});
	}
	
	private func mAnimateDismiss(
		to inViewController: UIViewController, inCompletion: (() -> Void)? = nil
	) -> Void {
		
		inViewController.view.frame = CGRect(
			x: -self.view.bounds.width, y: 0,
			width: self.view.bounds.width, height: self.view.bounds.height
		);
		pCurrent.willMove(toParent: nil);
		self.addChild(inViewController);
		self.transition(
			from: pCurrent, to: inViewController,
			duration: 0.5, options: [], animations: {
				inViewController.view.frame = self.view.bounds;
			}){ completed in
				self.pCurrent.removeFromParent();
				inViewController.didMove(toParent: self);
				self.pCurrent = inViewController;
      			inCompletion?();
			}
	}
}
