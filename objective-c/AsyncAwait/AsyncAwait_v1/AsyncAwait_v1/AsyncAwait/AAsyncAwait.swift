//
//  AAsyncAwait.swift
//  AsyncAwait_v1
//
//  Created by Alexandr Kirilov on 22/12/2022.
//

import Foundation

struct AUser: Codable {
	
	var name: String = "NoName";
}

@objcMembers class AAsyncAwait: NSObject {

	let pURL: Optional<URL> = URL(string:"https://jsonplaceholder.typicode.com/users");
	private var pUsers: Array<AUser> = [AUser]();

	@objc func mFetchUsers() async -> NSArray {
		
		guard let oURL = pURL else { return []; }
		
		let oOutput: NSMutableArray = [];
		
		do {
			let (oData,_) = try await URLSession.shared.data(from: oURL);
			let oUsers = try JSONDecoder().decode([AUser].self, from: oData);
			pUsers = oUsers;
			for iName in pUsers {
				oOutput.add(iName.name);
			}
			return oOutput;
		} catch {
			return oOutput;
		}
	}
}
