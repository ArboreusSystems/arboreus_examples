/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 07/09/2023 at 21:03:41
 * */// --------------------------------------------------------------

// System includes
#include <iostream>
#include <sstream>
#include <opencv2/imgproc.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/video.hpp>
#include <unistd.h>

// Application includes

// Namespace
using namespace cv;
using namespace std;

// Variables
vector<vector<Point> > gContours;
vector<Vec4i> gHierarchy;

// Constants
#define A_UNUSED(inVariable) (void)inVariable;
#define A_RTSP_URL "rtsp://user:password@your.domain:554/your/path"
#define A_RTSP_RECORDED_PATH "/path/to/video.file"


int main(int inCounter, char* inArguments[]) {

	A_UNUSED(inCounter);
	A_UNUSED(inArguments);

	Ptr<BackgroundSubtractor> oBackgroundSubtractor;
	oBackgroundSubtractor = createBackgroundSubtractorMOG2();

	const std::string oRTSPStreamAddress = A_RTSP_URL;
	cv::VideoCapture oCapture;

	if(!oCapture.open(oRTSPStreamAddress)) {
		std::cout << "Error opening video stream or file" << std::endl;
		return -1;
	}

	Mat oFrame;
	Mat oFGMask;

	int oFrameWidth = 320;
	int oFrameHeight = 240;

	cv::Size oFrameSize = cv::Size(oFrameWidth, oFrameHeight);

	int oCodec = cv::VideoWriter::fourcc('a', 'v', 'c', '1');
	cv::VideoWriter oOutputVideo;
	oOutputVideo.open(
		A_RTSP_RECORDED_PATH, oCodec,
		oCapture.get(cv::CAP_PROP_FPS), oFrameSize,
		true
	);

	sleep(3);

	while (true) {

		oCapture >> oFrame;
		if (oFrame.empty()) break;

		oBackgroundSubtractor->apply(oFrame, oFGMask);

		imshow("FG Mask", oFGMask);

		RNG oRange(12345);
		findContours(oFGMask, gContours, gHierarchy, RETR_EXTERNAL, CHAIN_APPROX_SIMPLE,Point(0, 0));

		vector<Rect> oBoundRectangle (gContours.size());
		vector<vector<Point>> oContoursPoly( gContours.size() );

		for (int i = 0; i < gContours.size();i++) {

			if (contourArea(gContours[i])< 500) {
				continue;
			}

			putText(oFrame, "Motion Detected", Point(10,20), FONT_HERSHEY_SIMPLEX, 0.75, Scalar(0,0,255),2);
			approxPolyDP( gContours[i], oContoursPoly[i], 3, true );
			oBoundRectangle[i] = boundingRect( oContoursPoly[i] );
			Scalar color = Scalar( oRange.uniform(0, 256), oRange.uniform(0,256), oRange.uniform(0,256) );
			rectangle( oFrame, oBoundRectangle[i].tl(), oBoundRectangle[i].br(), color, 2 );
			resize(oFrame, oFrame, oFrameSize);
			oOutputVideo.write(oFrame);
		}

		imshow("Frame", oFrame);
		int oKeyboard = waitKey(300);
		if (oKeyboard == 'q' || oKeyboard == 27) break;
	}

	oOutputVideo.release();
	return 0;
}
