package systems.arboreus.ARevenueNative;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import com.revenuecat.purchases.LogLevel;
import com.revenuecat.purchases.Purchases;
import com.revenuecat.purchases.PurchasesConfiguration;


public class ARevenueBridge {

	private static final String pLogTAG = "ARevenueBridge";

	public static void configure(Context context, String apiKey) {

		Log.d(pLogTAG,"ARevenueBridge.configure started");
		Log.d(pLogTAG,"apiKey: " + apiKey);

		new Handler(Looper.getMainLooper()).post(() -> {
			Purchases.setLogLevel(LogLevel.VERBOSE);
			Purchases.configure(
				new PurchasesConfiguration.Builder(context.getApplicationContext(), apiKey).build()
			);
			Log.d(pLogTAG,"ARevenueBridge.configure finished");
		});
	}
}
