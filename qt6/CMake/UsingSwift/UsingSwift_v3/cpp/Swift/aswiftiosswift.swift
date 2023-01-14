import Foundation

@objcMembers class ASwiftIOSSwift: NSObject {

	override init() {

		super.init();
		print("ASwiftIOSSwift init");
	}

	@objc func mString() -> NSString {

		let oString: NSString = "SwiftString";
		return oString;
	}
}
