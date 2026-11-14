// ----------------------------------------------------------
/*!
	\class ARevenueBridge class
	\title
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/11/2026 at 15:36:47
	\endlist
*/
// ----------------------------------------------------------

package systems.arboreus.ARevenueNative;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import androidx.annotation.NonNull;

import com.revenuecat.purchases.LogLevel;
import com.revenuecat.purchases.Offering;
import com.revenuecat.purchases.Offerings;
import com.revenuecat.purchases.Package;
import com.revenuecat.purchases.Purchases;
import com.revenuecat.purchases.PurchasesConfiguration;
import com.revenuecat.purchases.PurchasesError;
import com.revenuecat.purchases.interfaces.ReceiveOfferingsCallback;
import com.revenuecat.purchases.models.PricingPhase;
import com.revenuecat.purchases.models.StoreProduct;
import com.revenuecat.purchases.models.SubscriptionOption;
import com.revenuecat.purchases.CustomerInfo;
import com.revenuecat.purchases.EntitlementInfo;
import com.revenuecat.purchases.PurchaseParams;
import com.revenuecat.purchases.interfaces.PurchaseCallback;
import com.revenuecat.purchases.models.StoreTransaction;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;


// Class definitions
public class ARevenueBridge {

	private static final String pLogTAG = "ARevenueBridge";
	private static Offerings pCachedOfferings = null;


	// -----------
	/*!
		\fn

		Doc.
	*/

	public static void mConfigure(Context inContext, String inAPIKey) {

		Log.d(pLogTAG,"ARevenueBridge.configure started");
		Log.d(pLogTAG,"inAPIKey: " + inAPIKey);

		new Handler(Looper.getMainLooper()).post(() -> {

			Purchases.setLogLevel(LogLevel.VERBOSE);
			Purchases.configure(
				new PurchasesConfiguration.Builder(inContext.getApplicationContext(),inAPIKey).build()
			);
			Log.d(pLogTAG,"ARevenueBridge.configure finished");
		});
	}


	// -----------
	/*!
		\fn

		Doc.
	*/

	public static void mGetOfferings() {

		Log.d(pLogTAG, "ARevenueBridge.getOfferings started");

		Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsCallback() {

			@Override
			public void onReceived(Offerings inOfferings) {

				pCachedOfferings = inOfferings;
				Offering pCachedOfferings = inOfferings.getCurrent();
				if (pCachedOfferings != null) {
					Log.d(pLogTAG,"offerings.current.description: " + pCachedOfferings.getServerDescription());
					Log.d(pLogTAG,"offerings.current.identifier: " + pCachedOfferings.getIdentifier());
					Log.d(pLogTAG,"offerings.current.availablePackages: " + pCachedOfferings.getAvailablePackages());
				} else {
					Log.d(pLogTAG, "offerings.current is null");
				}
			}

			@Override
			public void onError(PurchasesError inError) {

				Log.e(pLogTAG,"Error while getting offerings from server: " + inError.getMessage());
			}
		});
	}

	// -----------
	/*!
		\fn

		Doc.
	*/

	public static String mGetProducts() {

		JSONArray oOutput = new JSONArray();

		if (pCachedOfferings == null || pCachedOfferings.getCurrent() == null) {
			Log.w(pLogTAG, "getProducts: cachedOfferings or current offering is null. Call getOfferings() first.");
			return oOutput.toString();
		}

		List<Package> oAvailablePackages = pCachedOfferings.getCurrent().getAvailablePackages();
		for (Package iPackage : oAvailablePackages) {

			StoreProduct iStoreProduct = iPackage.getProduct();

			String iIntroPriceString = "";
			SubscriptionOption iDefaultOption = iStoreProduct.getDefaultOption();
			if (iDefaultOption != null) {
				PricingPhase iIntroPhase = iDefaultOption.getIntroPhase();
				if (iIntroPhase != null) {
					iIntroPriceString = iIntroPhase.getPrice().getFormatted();
				} else if (iDefaultOption.getFreePhase() != null) {
					iIntroPriceString = iDefaultOption.getFreePhase().getPrice().getFormatted();
				}
			}

			String iSubscriptionGroupID = "";
			if (iDefaultOption != null) iSubscriptionGroupID = iDefaultOption.getId();

			Log.d(pLogTAG,"------------------------------------");
			Log.d(pLogTAG,"iStoreProduct.hashCode: " + iStoreProduct.hashCode());
			Log.d(pLogTAG,"iStoreProduct.currencyCode: " + iStoreProduct.getPrice().getCurrencyCode());
			Log.d(pLogTAG,"iStoreProduct.title: " + iStoreProduct.getTitle());
			Log.d(pLogTAG,"iStoreProduct.subscriptionOptions (discounts/offers): " + iStoreProduct.getSubscriptionOptions());
			Log.d(pLogTAG,"iStoreProduct.description: " + iStoreProduct.getDescription());
			Log.d(pLogTAG,"iStoreProduct.introductoryPriceString: " + iIntroPriceString);
			Log.d(pLogTAG,"iStoreProduct.price (amountMicros): " + iStoreProduct.getPrice().getAmountMicros());
			Log.d(pLogTAG,"iStoreProduct.id (productIdentifier): " + iStoreProduct.getId());
			Log.d(pLogTAG,"iStoreProduct.basePlanId (subscriptionGroup): " + iSubscriptionGroupID);
			Log.d(pLogTAG,"iStoreProduct.formattedPrice: " + iStoreProduct.getPrice().getFormatted());

			try {

				JSONObject iProduct = new JSONObject();
				iProduct.put("RCIdentifier",iPackage.getIdentifier());
				iProduct.put("SKIdentifier",iStoreProduct.getId());
				iProduct.put("Title", iStoreProduct.getTitle());
				iProduct.put("Description",iStoreProduct.getDescription());
				iProduct.put("Price",iStoreProduct.getPrice().getFormatted());
				iProduct.put("Currency",iStoreProduct.getPrice().getCurrencyCode());
				oOutput.put(iProduct);

			} catch (Exception inErrorCatched) {
				Log.e(pLogTAG, "Failed to serialize product JSON: " + inErrorCatched.getMessage());
			}
		}

		return oOutput.toString();
	}


	// -----------
	/*!
		\fn

		Doc.
	*/

	public static void mSubscribe(Activity inActivity, String inPackageId) {

		Log.d(pLogTAG, "inPackageId: " + inPackageId);

		if (pCachedOfferings == null || pCachedOfferings.getCurrent() == null) {
			Log.e(pLogTAG, "Error. cachedOfferings is null. Aborting purchase to prevent crash.");
			return;
		}

		Package oPackage = null;
		List<Package> oAvailablePackages = pCachedOfferings.getCurrent().getAvailablePackages();
		for (Package iPackage : oAvailablePackages) {
			Log.d(pLogTAG, "iPackage.identifier: " + iPackage.getIdentifier());
			if (iPackage.getProduct().getId().equals(inPackageId)) {
				Log.d(pLogTAG, "iPackage.product.id: " + iPackage.getProduct().getId());
				oPackage = iPackage;
				break;
			}
		}

		if (oPackage == null) {
			Log.e(pLogTAG, "Error. Package is nil. Aborting purchase to prevent crash.");
			return;
		}

		final Package oTargetPackage = oPackage;
		inActivity.runOnUiThread(() -> {

			PurchaseParams params = new PurchaseParams.Builder(inActivity,oTargetPackage).build();
			Purchases.getSharedInstance().purchase(params, new PurchaseCallback() {

				@Override
				public void onCompleted(StoreTransaction inTransaction, CustomerInfo inCustomerInfo) {

					EntitlementInfo oEntitlement = inCustomerInfo.getEntitlements().get(inPackageId);
					if (oEntitlement != null && oEntitlement.isActive()) {
						Log.d(pLogTAG,"Purchase successful.");
					} else {
						Log.d(pLogTAG,"Purchase completed, active entitlements: " + inCustomerInfo.getEntitlements().getActive().keySet());
					}
				}

				@Override
				public void onError(PurchasesError inError, boolean inUserCancelled) {

					if (inUserCancelled) {
						Log.d(pLogTAG,"Purchase canceled");
						return;
					}
					Log.e(pLogTAG,"Error: " + inError.getMessage());
				}
			});
		});
	}


	// -----------
	/*!
		\fn

		Doc.
	*/

	public static void mSubscribeWithRCProduct(Activity inActivity, String inProductId) {

		Log.d(pLogTAG, "oPackageId: " + inProductId);

		if (pCachedOfferings == null || pCachedOfferings.getCurrent() == null) {
			Log.e(pLogTAG, "Error. cachedOfferings is null. Aborting purchase to prevent crash.");
			return;
		}

		Package oPackage = null;
		List<Package> oAvailablePackages = pCachedOfferings.getCurrent().getAvailablePackages();
		for (Package iPackage : oAvailablePackages) {
			Log.d(pLogTAG, "iPackage.identifier: " + iPackage.getIdentifier());
			if (iPackage.getIdentifier().equals(inProductId)) {
				Log.d(pLogTAG, "iPackage.identifier: " + iPackage.getIdentifier());
				oPackage = iPackage;
				break;
			}
		}

		if (oPackage == null) {
			Log.e(pLogTAG, "Error. Package is nil. Aborting purchase to prevent crash.");
			return;
		}

		final Package oTargetPackage = oPackage;
		inActivity.runOnUiThread(() -> {

			PurchaseParams oParams = new PurchaseParams.Builder(inActivity,oTargetPackage).build();
			Purchases.getSharedInstance().purchase(oParams,new PurchaseCallback() {

				@Override
				public void onCompleted(StoreTransaction inTransaction, CustomerInfo inCustomerInfo) {

					EntitlementInfo oEntitlement = inCustomerInfo.getEntitlements().get(inProductId);
					if (oEntitlement != null && oEntitlement.isActive()) {
						Log.d(pLogTAG, "Purchase successful.");
					} else {
						Log.d(pLogTAG, "Purchase completed, active entitlements: " + inCustomerInfo.getEntitlements().getActive().keySet());
					}
				}

				@Override
				public void onError(PurchasesError inError, boolean inUserCancelled) {

					if (inUserCancelled) {
						Log.d(pLogTAG, "Purchase canceled");
						return;
					}
					Log.e(pLogTAG, "Error: " + inError.getMessage());
				}
			});
		});
	}
}
