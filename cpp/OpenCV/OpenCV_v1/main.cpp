/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 07/09/2023 at 14:03:15
 * */// --------------------------------------------------------------

// System includes
#include <iostream>
#include <opencv2/opencv.hpp>

// Application includes

// Namespace
using namespace std;
using namespace cv;

// Constants
#define A_UNUSED(inVariable) (void)inVariable;
#define A_RTSP_URL "rtsp://user:password@your.domain:554/your/path"


int main(int inCounter, char* inArguments[]) {

	A_UNUSED(inCounter);
	A_UNUSED(inArguments);

	VideoCapture oVideo(A_RTSP_URL);
	if (!oVideo.isOpened()) {
		cout << "Error opening video stream or file" << endl;
	} else {
		int oFPS = oVideo.get(5);
		cout << "Frames per second :" << oFPS;
		int oFrameCount = oVideo.get(7);
		cout << "  Frame count :" << oFrameCount;
	}

	while (oVideo.isOpened()) {

		Mat oFrame;
		bool oIsSuccess = oVideo.read(oFrame);

		if(oIsSuccess == true) {
			 imshow("Frame", oFrame);
		}

		if (oIsSuccess == false) {
			cout << "Video camera is disconnected" << endl;
			break;
		}

		int key = waitKey(20);
		if (key == 'q') {
			cout << "q key is pressed by the user. Stopping the video" << endl;
			break;
		}
	}

	oVideo.release();
	destroyAllWindows();

	return 0;
}
