//
//  ALogger.h
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 15/12/2022.
//

#import <Foundation/Foundation.h>
#import <sys/time.h>
#import <sys/utsname.h>

#define NSLog(args...) fCustomNSLog(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);

NS_ASSUME_NONNULL_BEGIN

void fCustomNSLog(const char* inFile, int inLineNumber, const char* inFunctionName, NSString* inFormat, ...);
void fCustomNSLogToConsole(NSString* inLogEvent);


@interface ALogger : NSObject

@property (strong,atomic) NSFileManager* pFileManager;
@property (assign,nonatomic) BOOL pIsWriteToFile;

@property (strong,atomic) NSString* pDirLogs;
@property (strong,atomic) NSString* pPathLogfile;

+(ALogger*) mInstance;
+(uint64_t) mCurrentTimestamp;
-(void) mAddTofile:(NSString*)inLog;

@end

NS_ASSUME_NONNULL_END
