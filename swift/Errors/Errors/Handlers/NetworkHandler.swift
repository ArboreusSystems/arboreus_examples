//
//  NetworkHandler.swift
//  Errors
//
//  Created by Alexandr Kirilov on 09/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

enum RequestResult<T,E:Error> {
	case success(T);
	case failure(E);
}

enum NetworkError: Error {
	case InvalidRequest;
	case InvalidResponse;
}

class NetworkHandler: NSObject {

	func mMakeRequest(inCompletion: @escaping (RequestResult<String,NetworkError>) -> Void) -> Void {
		
		// let oRequestSuccess: Bool = false;
		let oRequestSuccess: Bool = true;
		if (oRequestSuccess) {
			// let oRequestValid: Bool = true;
			let oRequestValid: Bool = false;
			if (oRequestValid) {
				inCompletion(.success("No errors. Everything success."));
			} else {
				inCompletion(.failure(.InvalidRequest));
			}
		} else {
			inCompletion(.failure(.InvalidRequest));
		}
	}
}
