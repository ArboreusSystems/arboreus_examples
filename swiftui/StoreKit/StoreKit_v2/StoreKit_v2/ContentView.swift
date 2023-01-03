//
//  ContentView.swift
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 03/01/2023.
//

import SwiftUI
import StoreKit


struct ContentView: View {

	@State private var pProducts: [Product] = [];
	private let pStorekit: AStorekit = AStorekit.pSharedInstance;

	var body: some View {
	
		VStack(spacing:10) {
		
			Text("Subscriptions")
				.padding()
				.font(Font.system(size: 22.0).weight(.bold))
				.foregroundColor(__COLOR_BLUE_DARK)
				
			ForEach(self.pProducts) {iProduct in
				AButtonTemplate(
					pTitle: "\(iProduct.displayName) \(iProduct.displayPrice)",
					pAction: {},
					pProduct: iProduct
				)
			}
			
			Button(action: {
					__ALog("Clicked Restore purchase");
					Task {
						try await AppStore.sync();
					}
				}) {
					Text("Restore purchase ")
				}
					.padding()
					.foregroundColor(__COLOR_PURPLE_DARK)

		} .task {
			do {
				self.pProducts = try await pStorekit.mLoadProducts();
			} catch {
				__ALog("ERROR! Getting products failed");
			}
		}
		
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(__COLOR_SALAD_LIGHT)
		.onAppear() {
			
			__ALog("ContentView appeared");
		}
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
    
		ContentView()
    }
}
