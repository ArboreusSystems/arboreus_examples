package systems.arboreus.AJavaPackage;


public class AJavaClass {

	native public static int mCallbackTest(int inNumber);

	public static int mTest(int inNumber) {

		return mCallbackTest(inNumber);
	}
}
