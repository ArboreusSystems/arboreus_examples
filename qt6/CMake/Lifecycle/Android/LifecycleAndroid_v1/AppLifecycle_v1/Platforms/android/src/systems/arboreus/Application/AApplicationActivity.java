package systems.arboreus.Application;

import org.qtproject.qt.android.bindings.QtActivity;
import android.os.Bundle;


public class AApplicationActivity extends QtActivity {

	@Override
	public void onCreate(Bundle inBundle) {

		System.out.println("JAVA NATIVE onCreate before QtActivity");
		super.onCreate(inBundle);
		System.out.println("JAVA NATIVE onCreate after QtActivity");
	}

	@Override
	public void onStart() {

		System.out.println("JAVA NATIVE onStart before QtActivity");
		super.onStart();
		System.out.println("JAVA NATIVE onStart after QtActivity");
	}

	@Override
	public void onResume() {

		System.out.println("JAVA NATIVE onResume before QtActivity");
		super.onResume();
		System.out.println("JAVA NATIVE onResume after QtActivity");
	}

	@Override
	public void onPause() {

		System.out.println("JAVA NATIVE onPause before QtActivity");
		super.onPause();
		System.out.println("JAVA NATIVE onPause after QtActivity");
	}

	@Override
	public void onStop() {

		System.out.println("JAVA NATIVE onStop before QtActivity");
		super.onStop();
		System.out.println("JAVA NATIVE onStop after QtActivity");
	}

	@Override
	public void onDestroy() {

		System.out.println("JAVA NATIVE onDestroy before QtActivity");
		super.onDestroy();
		System.out.println("JAVA NATIVE onDestroy after QtActivity");
	}

	@Override
	public void onRestart() {

		System.out.println("JAVA NATIVE onRestart before QtActivity");
		super.onRestart();
		System.out.println("JAVA NATIVE onRestart after QtActivity");
	}
}
