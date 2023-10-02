/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 02/10/2023 at 14:12:04
 * */// --------------------------------------------------------------

// System includes
#ifdef __cplusplus
extern "C" {
#endif

#include <inttypes.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdio.h>
#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
#include <libavutil/avutil.h>

#ifdef __cplusplus
} // closing brace for extern "C"
#endif

// Application includes
#include "../FFMPEG.conf.h"

// Function definitinons
static void fLogging(const char* inMessage, ...);

// Namespace
using namespace std;

// Constants
#define A_UNUSED(inVariable) (void)inVariable;

// Functions
// -----------
/*!
	\fn

	Doc.
*/

static void fLogging(const char* inMessage, ...) {

	va_list oArguments;
	fprintf(stderr,"LOG: ");
	va_start(oArguments,inMessage);
	vfprintf(stderr,inMessage,oArguments);
	va_end(oArguments);
	fprintf(stderr,"\n");
}


int main(int inCounter, char* inArguments[]) {

	A_UNUSED(inCounter);
	A_UNUSED(inArguments);

	AFFMPEGConfig oFFMPEGConfig;

	AVFormatContext* oInputFormatContext = avformat_alloc_context();
	if (!oInputFormatContext) {
		fLogging("ERROR! Can't create input context");
		return EXIT_FAILURE;
	} else {
		fLogging("Created input context");
	}

	int oOpenInput = avformat_open_input(&oInputFormatContext,oFFMPEGConfig.mRTSPStreamURL(),NULL,NULL);
	if (oOpenInput != 0) {
		fLogging("ERROR! Can't open input");
		return EXIT_FAILURE;
	} else {
		fLogging("Opened input");
	}

	int oInputStreamInfo = avformat_find_stream_info(oInputFormatContext, NULL);
	if (oInputStreamInfo != 0) {
		fLogging("ERROR! Can't get input stream info");
		return EXIT_FAILURE;
	} else {
		fLogging("Got input stream info");
	}

	av_dump_format(oInputFormatContext, 0, oFFMPEGConfig.mRTSPStreamURL(), 0);

	avformat_close_input(&oInputFormatContext);
	avformat_free_context(oInputFormatContext);

	return EXIT_SUCCESS;
}
