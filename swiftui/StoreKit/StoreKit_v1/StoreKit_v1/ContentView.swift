//
//  ContentView.swift
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 02/01/2023.
//

import StoreKit
import SwiftUI

struct ContentView: View {
	
	@StateObject var pStoreKit: AStoreKit = AStoreKit();
	
	var body: some View {
		
		VStack {
			
			Text("StoreKit_v1")
				.padding()
				.font(Font.system(size: 16.0))
			
			Text("Subscription example")
				.font(Font.system(size: 22.0).weight(.bold))
				.foregroundColor(__COLOR_BLUE_DARK)
			
			if let oProduct: Product = pStoreKit.pSubscriptionProduct {
				Button(action: {
					__ALog("Clicked button");
					pStoreKit.mBuySubscription();
				}) {
					Text("Subscribe now \(oProduct.displayPrice)")
				}
					.padding()
					.background(__COLOR_FIOLENT_DARK)
					.foregroundColor(__COLOR_WHITE_LIGHT)
				}
		}
		
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(__COLOR_SALAD_LIGHT)
		.onAppear() {
			
			pStoreKit.mFetchSubscription();
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	
	static var previews: some View {
	
		ContentView()
    }
}
