//
//  File.swift
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 03/01/2023.
//

import SwiftUI
import StoreKit


struct AButtonTemplate: View {
	
	@State private var pIsPressed: Bool = false;
	private let pStoreKit: AStorekit = AStorekit.pSharedInstance;
	
	let pTitle: String;
	let pAction: () -> Void;
	let pProduct: Product;
	
	var body: some View {
	
		Button(pTitle, action: {
			
			__ALog("Clicked button: \(self.pTitle)");
			pAction();
			Task {
				do {
					try await pStoreKit.mPurchaseProduct(inProduct: self.pProduct);
					__ALog("Purchased product: \(self.pProduct.id)");
				} catch {
					__ALog("ERROR! Purchasing product failed: \(self.pProduct.id)");
				}
			}
		})
			.foregroundColor(self.pIsPressed ? __COLOR_WHITE_LIGHT : __COLOR_WHITE)
			.font(Font.system(size: 18.0).weight(.bold))
			.padding()
			.background(self.pIsPressed ? __COLOR_ORANGE_DARK : __COLOR_FIOLENT_DARK)
			.cornerRadius(4)
			
			.simultaneousGesture(
				DragGesture(minimumDistance: 0)
					.onChanged({_ in
						self.pIsPressed = true;
					})
					.onEnded({_ in
						self.pIsPressed = false;
					})
            )
    }
}
