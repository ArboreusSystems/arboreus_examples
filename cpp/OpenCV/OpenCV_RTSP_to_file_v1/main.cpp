/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 12/09/2023 at 12:21:30
 * */// --------------------------------------------------------------

// System includes
#include <opencv2/core.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/highgui.hpp>
#include <iostream>
#include <stdio.h>

// Application includes
#include "../OpenCV.conf.h"

// Namespace
using namespace cv;
using namespace std;

// Constants
#define A_UNUSED(inVariable) (void)inVariable;


int main(int inCounter, char* inArguments[]) {

	A_UNUSED(inCounter);
	A_UNUSED(inArguments);

	AOpenCVProperties oProperties;

	VideoCapture oCapture(oProperties.mRTSPStreamURL());
	if (!oCapture.isOpened()) {
		cerr << "ERROR! Unable to open camera\n";
		return -1;
	} else {
		cout << "Capturing video opened\n";
	}

	Mat oSource;
	oCapture >> oSource;
	if (oSource.empty()) {
		cerr << "ERROR! blank frame grabbed\n";
		return -1;
	} else {
		cout << "Source isn't empty";
	}

	bool oIsColor = (oSource.type() == CV_8UC3);

	VideoWriter oWriter;
	int oCodec = VideoWriter::fourcc('M','J','P','G');
	double oFPS = 25.0;
	string oFilename = oProperties.mRTSPFilePath();

	oWriter.open(oFilename, oCodec, oFPS, oSource.size(), oIsColor);
	if (!oWriter.isOpened()) {
        cerr << "Could not open the output video file for write\n";
        return -1;
	} else {
		cout << "Writer opened\n";
	}

	cout << "Writing videofile: " << oFilename << endl << "Press any key to terminate" << endl;

	for (;;) {

		if (!oCapture.read(oSource)) {
            cerr << "ERROR! blank frame grabbed\n";
            break;
		}

		oWriter.write(oSource);

		imshow("Live", oSource);
		if (waitKey(5) >= 0)
            break;
    }

    return 0;
}
