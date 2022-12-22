//
//  AItemViewCell.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 22/12/2022.
//

import UIKit
import StoreKit

class AItemViewCell: UITableViewCell {
	
	
	// -----------------------------------
	// MARK: Variables
	
	static let pID: String = "AItemViewCell";
	private let pStoreKit2: AStoreKit2 = AStoreKit2.pSharedInstance;
	private let pButtonBuy: UIButton = UIButton();
	private var pProduct: Optional<Product> = nil;
	private var pCellConfig: Optional<UIListContentConfiguration> = nil;
	private let pBackgroundVew: UIView = UIView();
	
	
	// -----------------------------------
	// MARK: Init
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		
		super.init(style: style, reuseIdentifier: reuseIdentifier);
		
		pCellConfig = self.defaultContentConfiguration();
		pCellConfig?.textProperties.color = __COLOR_WHITE_LIGHT;
		self.contentConfiguration = pCellConfig;
		
		pBackgroundVew.backgroundColor = __COLOR_PURPLE_LIGHT;
		self.selectedBackgroundView = pBackgroundVew;
				
		pButtonBuy.backgroundColor = __COLOR_FIOLENT_DARK;
		pButtonBuy.setTitle("BUY", for: .normal);
		pButtonBuy.setTitleColor(__COLOR_WHITE_LIGHT, for: .normal);
		pButtonBuy.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold);
		pButtonBuy.translatesAutoresizingMaskIntoConstraints = false;
		pButtonBuy.addTarget(self, action: #selector(mActionBuyProduct(inSender:)), for: .touchUpInside);
		self.addSubview(pButtonBuy);
	}
	
	override func layoutSubviews() {
		
		super.layoutSubviews();
		
		pButtonBuy.removeConstraints(pButtonBuy.constraints);
		pButtonBuy.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true;
		pButtonBuy.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10.0).isActive = true;
		pButtonBuy.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75).isActive = true;
		pButtonBuy.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true;
	}
	
	required init?(coder: NSCoder) {
	
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// -----------------------------------
	// MARK: Functionality
	
	func mSetProduct(inProduct: Product) -> Void {
		
		pProduct = inProduct;
		pCellConfig?.text = pProduct?.displayName;
		self.contentConfiguration = pCellConfig;
	}
	
	
	// -----------------------------------
	// MARK: Actions
	
	@objc func mActionBuyProduct(inSender:Any) -> Void {
		
		__ALog("mActionBuyProduct");
		Task {
			do {
				try await pStoreKit2.mPurchaseProduct(pProduct!);
			} catch {
				__ALog("Error! mActionBuyProduct failed")
			}
			
		}
	}
}
