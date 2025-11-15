package systems.arboreus.AJavaPackage1;


public class AJavaClass1 {

	native public static int mAJavaPackage1TestCallBack(int inNumber);

	public static int mTest(int inNumber) {

		return mAJavaPackage1TestCallBack(inNumber);
	}
}
