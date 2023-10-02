/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 28/09/2023 at 11:15:37
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

#ifdef __cplusplus
} // closing brace for extern "C"
#endif

// Application includes
#include "../FFMPEG.conf.h"

// Namespace

// Function definitinons
static void gLogging(const char* inMessage, ...);
static int gDecodePacket(AVPacket* inPacket, AVCodecContext* inCodecContext, AVFrame* inFrame);
static void gSaveGrayFrame(unsigned char* inBuffer, int inWrap, int inXSize, int inYSize, char* inFilename);

// Constants
#define A_UNUSED(inVariable) (void)inVariable;

// Global functions

// -----------
/*!
	\fn

	Doc.
*/

static void gLogging(const char* inMessage, ...) {

	va_list oArguments;
	fprintf(stderr,"LOG: ");
	va_start(oArguments,inMessage);
	vfprintf(stderr,inMessage,oArguments);
	va_end(oArguments);
	fprintf(stderr,"\n");
}


// -----------
/*!
	\fn

	Doc.
*/

static int gDecodePacket(AVPacket* inPacket, AVCodecContext* inCodecContext, AVFrame* inFrame) {

	int oResponse = avcodec_send_packet(inCodecContext, inPacket);
	if (oResponse < 0) {
		gLogging("Error while sending a packet to the decoder: %s", av_err2str(oResponse));
		return oResponse;
	}

	while (oResponse >= 0) {
		oResponse = avcodec_receive_frame(inCodecContext, inFrame);
		if (oResponse == AVERROR(EAGAIN) || oResponse == AVERROR_EOF) {
			break;
		} else if (oResponse < 0) {
			gLogging("Error while receiving a frame from the decoder: %s", av_err2str(oResponse));
			return oResponse;
		}

		if (oResponse >= 0) {
			gLogging("Frame %d (type=%c, size=%d bytes, format=%d) pts %d key_frame %d [DTS %d]",
				inCodecContext->frame_number,
				av_get_picture_type_char(inFrame->pict_type),
				inFrame->pkt_size,
				inFrame->format,
				inFrame->pts,
				inFrame->key_frame,
				inFrame->coded_picture_number
			);

			char iFrameFilename[1024];
			snprintf(iFrameFilename, sizeof(iFrameFilename), "%s-%d.pgm", "frame", inCodecContext->frame_number);

			if (inFrame->format != AV_PIX_FMT_YUV420P) {
				gLogging("Warning: the generated file may not be a grayscale image, but could e.g. be just the R component if the video format is RGB");
			}

			gSaveGrayFrame(inFrame->data[0], inFrame->linesize[0], inFrame->width, inFrame->height, iFrameFilename);
		}
	}

	return 0;
}


// -----------
/*!
	\fn

	Doc.
*/

static void gSaveGrayFrame(
	unsigned char* inBuffer, int inWrap, int inXSize, int inYSize, char* inFilename
) {

	FILE* oFile;
	int i;
	oFile = fopen(inFilename,"w");
	fprintf(oFile, "P5\n%d %d\n%d\n", inXSize, inYSize, 255);
	for (i = 0; i < inYSize; i++) {
		fwrite(inBuffer + i * inWrap, 1, inXSize, oFile);
	}
	fclose(oFile);
}


// Application
int main(int inCounter, const char* inArguments[]) {

	A_UNUSED(inCounter);
	A_UNUSED(inArguments);

	AFFMPEGConfig oFFMPEGConfig;

	AVFormatContext* oInputFormatContext = NULL;
	AVPacket* oInputPacket = NULL;
	AVFrame* oInputFrame = NULL;

	int oInputVideoDecodingResponse = 0;
	int oInputVideoReceiveFrameResponce = 0;
	int oInputVideoStreamIndex = 0;
	AVCodec* oInputCodecVideo = NULL;
	AVCodecParameters* oInputCodecVideoParameters = NULL;
	AVCodecContext* oInputCodecVideoContext = NULL;

	int oInputAudioDecodingResponse = 0;
	int oInputAudioReceiveFrameResponce = 0;
	int oInputAudioStreamIndex = 0;
	AVCodec* oInputCodecAudio = NULL;
	AVCodecParameters* oInputCodecAudioParameters = NULL;
	AVCodecContext* oInputCodecAudioContext = NULL;

	int oInputFrameCounter = 25;

	oInputFormatContext = avformat_alloc_context();
	if (!oInputFormatContext) {
		gLogging("ERROR Can't allocate memory for Format Context");
		return EXIT_FAILURE;
	} else {
		gLogging("Allocated oInputContext");
	}

	if (avformat_open_input(&oInputFormatContext, oFFMPEGConfig.mRTSPStreamURL(), NULL, NULL) != 0) {
		gLogging("ERROR Can't open input stream");
		return EXIT_FAILURE;
	} else {
		gLogging("Opened input stream with format %s, duration %lld us, bit_rate %lld",
			oInputFormatContext->iformat->name,
			oInputFormatContext->duration,
			oInputFormatContext->bit_rate
		);
	}

	if (avformat_find_stream_info(oInputFormatContext,NULL) < 0) {
		gLogging("ERROR Can't get the stream info");
		return EXIT_FAILURE;
	} else {
		gLogging("Found stream info");
	}

	for (int i = 0; i < oInputFormatContext->nb_streams; i++) {

		AVCodecParameters* iCodecParameters = oInputFormatContext->streams[i]->codecpar;
		if (iCodecParameters->codec_type == AVMEDIA_TYPE_VIDEO) {

			oInputCodecVideoParameters = iCodecParameters;
			oInputVideoStreamIndex = i;
			oInputCodecVideo = const_cast<AVCodec*>(
				avcodec_find_decoder(oInputCodecVideoParameters->codec_id)
			);
			gLogging("Video Codec: %s resolution %d x %d",
				oInputCodecVideo->long_name,
				oInputCodecVideoParameters->width,
				oInputCodecVideoParameters->height
			);
			oInputCodecVideoContext = avcodec_alloc_context3(oInputCodecVideo);
			avcodec_parameters_to_context(oInputCodecVideoContext,oInputCodecVideoParameters);
			avcodec_open2(oInputCodecVideoContext,oInputCodecVideo,NULL);

		}
		if (iCodecParameters->codec_type == AVMEDIA_TYPE_AUDIO) {

			oInputCodecAudioParameters = iCodecParameters;
			oInputAudioStreamIndex = i;
			oInputCodecAudio = const_cast<AVCodec*>(
				avcodec_find_decoder(oInputCodecAudioParameters->codec_id)
			);
			gLogging("Audio Codec: %s %d channels, sample rate %d",
				oInputCodecAudio->long_name,
				oInputCodecAudioParameters->channels,
				oInputCodecAudioParameters->sample_rate
			);
			oInputCodecAudioContext = avcodec_alloc_context3(oInputCodecAudio);
			avcodec_parameters_to_context(oInputCodecAudioContext,oInputCodecAudioParameters);
			avcodec_open2(oInputCodecAudioContext,oInputCodecAudio,NULL);

		}
		av_free(iCodecParameters);
	}

	oInputPacket = av_packet_alloc();
	oInputFrame = av_frame_alloc();

	while (av_read_frame(oInputFormatContext,oInputPacket) >= 0) {

		if (oInputPacket->stream_index == oInputVideoStreamIndex) {

			gLogging("Handling video stream");

			oInputVideoDecodingResponse = avcodec_send_packet(oInputCodecVideoContext,oInputPacket);
			if (oInputVideoDecodingResponse < 0) {
				gLogging("Error while sending a packet to the decoder: %s", av_err2str(oInputVideoDecodingResponse));
				return oInputVideoDecodingResponse;
			} else {
				gLogging("Sent video packet");
			}

			oInputVideoReceiveFrameResponce = avcodec_receive_frame(oInputCodecVideoContext,oInputFrame);
			if (
				oInputVideoReceiveFrameResponce == AVERROR(EAGAIN) ||
				oInputVideoReceiveFrameResponce == AVERROR_EOF ||
				oInputVideoReceiveFrameResponce < 0
			) {
				gLogging("Error while video frame receiving: %d",av_err2str(oInputVideoReceiveFrameResponce));
				break;
			} else {
				gLogging("Video frame received with TYPE: %c FRAME_NUMBER %lld FRAME_NUM: %lld FRAME_SIZE: %lld PKT_DTS: %lld KEY_FRAME: %d CODED_PICTURE_NUMBER: %d DISPLAY_PICTURE_NUMBER: %d",
					av_get_picture_type_char(oInputFrame->pict_type),
					oInputCodecVideoContext->frame_number,
					oInputCodecVideoContext->frame_num,
					oInputCodecVideoContext->frame_size,
					oInputFrame->pkt_dts,
					oInputFrame->key_frame,
					oInputFrame->coded_picture_number,
					oInputFrame->display_picture_number
				);
			}
		}

		if (oInputPacket->stream_index == oInputAudioStreamIndex) {

			gLogging("Handling audio stream");

			oInputAudioDecodingResponse = avcodec_send_packet(oInputCodecAudioContext,oInputPacket);
			if (oInputAudioDecodingResponse < 0) {
				gLogging("Error while sending a packet to the decoder: %s", av_err2str(oInputAudioDecodingResponse));
				return oInputAudioDecodingResponse;
			} else {
				gLogging("Sent audio packet");
			}

			oInputAudioReceiveFrameResponce = avcodec_receive_frame(oInputCodecAudioContext,oInputFrame);
			if (
				oInputAudioReceiveFrameResponce == AVERROR(EAGAIN) ||
				oInputAudioReceiveFrameResponce == AVERROR_EOF ||
				oInputAudioReceiveFrameResponce < 0
			) {
				gLogging("Error while audio frame receiving: %d",av_err2str(oInputAudioReceiveFrameResponce));
				break;
			} else {
				gLogging("Audio frame received with FRAME_NUMBER %lld FRAME_NUM: %lld FRAME_SIZE: %lld PKT_TIMEBASE: %lld",
					oInputCodecAudioContext->frame_number,
					oInputCodecAudioContext->frame_num,
					oInputCodecAudioContext->frame_size,
					oInputCodecAudioContext->pkt_timebase
				);
			}
		}

		gLogging("%d",oInputFrameCounter);
		if (--oInputFrameCounter <=0 ) break;
	}

	avcodec_close(oInputCodecVideoContext);
	avcodec_free_context(&oInputCodecVideoContext);
	av_free(oInputCodecVideo);
	av_free(oInputCodecVideoParameters);

	avcodec_close(oInputCodecAudioContext);
	avcodec_free_context(&oInputCodecAudioContext);
	av_free(oInputCodecAudio);
	av_free(oInputCodecAudioParameters);

	av_packet_free(&oInputPacket);
	av_frame_free(&oInputFrame);

	avformat_close_input(&oInputFormatContext);
	avformat_free_context(oInputFormatContext);

	return EXIT_SUCCESS;
}

