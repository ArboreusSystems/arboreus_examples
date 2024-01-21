/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 12/09/2023 at 11:43:43
 * */// --------------------------------------------------------------

// System includes
#include <iostream>
#include <sstream>
#include <opencv2/imgproc.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/video.hpp>

// Application includes

// Namespace
using namespace cv;
using namespace std;

// Constants
#define A_UNUSED(inVariable) (void)inVariable;
#define A_RTSP_URL "rtsp://user:password@your.domain:554/your/path"
#define A_RTSP_RECORDED_PATH "/path/to/video.file"

int main(int inCounter, char* inArguments[]) {

    A_UNUSED(inCounter);
    A_UNUSED(inArguments);

    cout << "Built with OpenCV " << CV_VERSION << endl;

	Mat oImage;
	Mat oSource;

	VideoCapture oCapture;
	oCapture.open(A_RTSP_URL);
	oCapture >> oSource;

	bool oIsColor = (oSource.type() == CV_8UC3);

	VideoWriter oWriter;
	int oCodec = VideoWriter::fourcc('a', 'v', 'c', '1');
	double oFPS = 15.0;
	string oFilename = A_RTSP_RECORDED_PATH;
	Size oSizeFrame(640,480);
	oWriter.open(oFilename, oCodec, oFPS, oSizeFrame, oIsColor);
    cout << "Started writing video... " << endl;

	for (int i = 0 ; i < 60 ; i ++) {
		oCapture >> oImage;
        Mat xframe;
		resize(oImage,xframe,oSizeFrame);
		oWriter.write(xframe);
    }

    cout << "Write complete !" << endl;

	oCapture.release();
	oWriter.release();

	return 0;
}
