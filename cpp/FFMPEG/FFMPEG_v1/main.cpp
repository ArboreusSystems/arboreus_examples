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

	AVFormatContext* pFormatContext = avformat_alloc_context();
	if (!pFormatContext) {
		gLogging("ERROR could not allocate memory for Format Context");
		return EXIT_FAILURE;
	} else {
		gLogging("Allocated input context");
	}

	if (avformat_open_input(&pFormatContext, oFFMPEGConfig.mRTSPStreamURL(), NULL, NULL) != 0) {
		gLogging("ERROR could not open the file");
		return EXIT_FAILURE;
	} else {
		gLogging("Opened input stream");
		gLogging("format %s, duration %lld us, bit_rate %lld",
			pFormatContext->iformat->name,
			pFormatContext->duration,
			pFormatContext->bit_rate
		);
	}

	if (avformat_find_stream_info(pFormatContext,  NULL) < 0) {
		gLogging("ERROR could not get the stream info");
		return EXIT_FAILURE;
	} else {
		gLogging("Found stream info");
	}

	AVCodec* pCodec = NULL;
	AVCodecParameters* pCodecParameters =  NULL;
	int video_stream_index = -1;

	for (int i = 0; i < pFormatContext->nb_streams; i++) {

		AVCodecParameters* pLocalCodecParameters =  NULL;
		pLocalCodecParameters = pFormatContext->streams[i]->codecpar;
		gLogging("AVStream->time_base before open coded %d/%d",
			pFormatContext->streams[i]->time_base.num,
			pFormatContext->streams[i]->time_base.den
		);
		gLogging("AVStream->r_frame_rate before open coded %d/%d",
			pFormatContext->streams[i]->r_frame_rate.num,
			pFormatContext->streams[i]->r_frame_rate.den
		);
		gLogging("AVStream->start_time %" PRId64, pFormatContext->streams[i]->start_time);
		gLogging("AVStream->duration %" PRId64, pFormatContext->streams[i]->duration);

		AVCodec* pLocalCodec = NULL;
		pLocalCodec = const_cast<AVCodec *>(avcodec_find_decoder(pLocalCodecParameters->codec_id));

		if (pLocalCodec==NULL) {
			gLogging("ERROR unsupported codec!");
			continue;
		}

		if (pLocalCodecParameters->codec_type == AVMEDIA_TYPE_VIDEO) {
			if (video_stream_index == -1) {
				video_stream_index = i;
				pCodec = pLocalCodec;
				pCodecParameters = pLocalCodecParameters;
			}
			gLogging("Video Codec: resolution %d x %d",
				pLocalCodecParameters->width,
				pLocalCodecParameters->height
			);
		} else if (pLocalCodecParameters->codec_type == AVMEDIA_TYPE_AUDIO) {
			gLogging("Audio Codec: %d channels, sample rate %d",
				pLocalCodecParameters->channels,
				pLocalCodecParameters->sample_rate
			);
		}

		gLogging("\tCodec %s ID %d bit_rate %lld",
			pLocalCodec->name, pLocalCodec->id,
			pLocalCodecParameters->bit_rate
		);
	}

	if (video_stream_index == -1) {
		gLogging("File %s does not contain a video stream!", inArguments[1]);
		return EXIT_FAILURE;
	}

	AVCodecContext* pCodecContext = avcodec_alloc_context3(pCodec);
	if (!pCodecContext) {
		gLogging("failed to allocated memory for AVCodecContext");
		return EXIT_FAILURE;
	}

	if (avcodec_parameters_to_context(pCodecContext, pCodecParameters) < 0) {
		gLogging("failed to copy codec params to codec context");
		return EXIT_FAILURE;
	}

	if (avcodec_open2(pCodecContext, pCodec, NULL) < 0) {
		gLogging("failed to open codec through avcodec_open2");
		return EXIT_FAILURE;
	}

	AVFrame *pFrame = av_frame_alloc();
	if (!pFrame) {
		gLogging("failed to allocate memory for AVFrame");
		return EXIT_FAILURE;
	}

	AVPacket *pPacket = av_packet_alloc();
	if (!pPacket) {
		gLogging("failed to allocate memory for AVPacket");
		return EXIT_FAILURE;
	}

	int response = 0;
	int how_many_packets_to_process = 8;

	while (av_read_frame(pFormatContext, pPacket) >= 0) {

		if (pPacket->stream_index == video_stream_index) {
			gLogging("AVPacket->pts %" PRId64, pPacket->pts);
			response = gDecodePacket(pPacket, pCodecContext, pFrame);
			if (response < 0) break;
			if (--how_many_packets_to_process <= 0) break;
		}

		av_packet_unref(pPacket);
	}

	gLogging("releasing all the resources");

	avformat_close_input(&pFormatContext);
	av_packet_free(&pPacket);
	av_frame_free(&pFrame);
	avcodec_free_context(&pCodecContext);

	return EXIT_SUCCESS;
}

