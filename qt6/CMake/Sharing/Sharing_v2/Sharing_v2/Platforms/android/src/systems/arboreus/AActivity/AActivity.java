package systems.arboreus.AActivity;

import org.qtproject.qt.android.bindings.QtActivity;
import android.os.Bundle;
import android.content.Intent;
import android.util.Log;


public class AActivity extends QtActivity {

	private static final String oLogTag = "AActivity";
	private static String pSharingText = null;

	private static native void mOnSharedText();

	@Override
	public void onCreate(Bundle inSavedInstanceState) {

		super.onCreate(inSavedInstanceState);
		mStoreSharedText(getIntent(),false);
		Log.d(oLogTag,"onCreate: started");
	}

	@Override
	public void onNewIntent(Intent inIntent) {

		super.onNewIntent(inIntent);
		setIntent(inIntent);
		mStoreSharedText(inIntent,true);
		Log.d(oLogTag, "onNewIntent: New intent appeared");
	}

	private void mStoreSharedText(Intent inIntent,boolean inNotifyNative) {

		if (inIntent == null) {
			Log.d(oLogTag,"mStoreSharedText: Intent is null");
			return;
		}

		String oAction = inIntent.getAction();
		String oMimeType = inIntent.getType();

		if (
			!Intent.ACTION_SEND.equals(oAction) ||
			oMimeType == null ||
			!oMimeType.startsWith("text/")
		) {
			return;
		}

		String oSharedValue = null;

		if (inIntent.hasExtra(Intent.EXTRA_TEXT)) {
			Object oExtraObject = inIntent.getParcelableExtra(Intent.EXTRA_TEXT);
			if (oExtraObject == null) {
				CharSequence oTextCharSequence = inIntent.getCharSequenceExtra(Intent.EXTRA_TEXT);
				if (oTextCharSequence != null) oSharedValue = oTextCharSequence.toString();
			}
		}

		if (oSharedValue == null || oSharedValue.trim().isEmpty()) {
			oSharedValue = inIntent.getStringExtra(Intent.EXTRA_TEXT);
		}

		if (oSharedValue == null || oSharedValue.trim().isEmpty()) {
			oSharedValue = inIntent.getStringExtra(Intent.EXTRA_SUBJECT);
		}

		if (oSharedValue == null || oSharedValue.trim().isEmpty()) {
			Log.d(oLogTag,"mStoreSharedText: Text is null");
			return;
		}

		synchronized (AActivity.class) {
			pSharingText = oSharedValue;
			Log.d(oLogTag,"mStoreSharedText: Got shared text: '" + pSharingText + "'");
		}

		if (inNotifyNative) {
			try {
				mOnSharedText();
			} catch (UnsatisfiedLinkError oError) {
				Log.e(oLogTag,"mStoreSharedText: JAVA error:",oError);
			}
		}
	}

	public static synchronized String mTakeSharedText() {

		if (pSharingText == null) {
			Log.w(oLogTag,"takeSharedText: Empty sharing text");
			return "";
		}

		String oResult = pSharingText;
		pSharingText = null;
		Log.d(oLogTag,"takeSharedText: Got text '" + oResult + "'");

		return oResult;
	}
}