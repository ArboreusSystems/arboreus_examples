//
//  ALogger.m
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 15/12/2022.
//

#import "ALogger.h"

void fCustomNSLogToConsole(NSString* inLogEvent) {
    
    fprintf(stderr, "%s",[inLogEvent UTF8String]);
}

void fCustomNSLog(const char* inFile, int inLineNumber, const char* inFunctionName, NSString* inFormat, ...) {

    va_list oArguments;
    va_start (oArguments,inFormat);
    uint64_t oTime = [ALogger mCurrentTimestamp];
    
    if (![inFormat hasSuffix: @"\n"]) inFormat = [inFormat stringByAppendingString: @""];
     
    NSString* fileName = [[NSString stringWithUTF8String:inFile] lastPathComponent];
    NSString* oLogEvent = [NSString stringWithFormat:@"%lld %@ %s:[%@]:[%d]\n",
        oTime,
        [[NSString alloc] initWithFormat:inFormat arguments:oArguments],
        inFunctionName,
        fileName,
        inLineNumber
    ];
    
    va_end (oArguments);
    fCustomNSLogToConsole(oLogEvent);
    [[ALogger mInstance] mAddTofile:oLogEvent];
}


@implementation ALogger

+(ALogger*) mInstance {
    
    static ALogger* oSharedInstance = nil;
    static dispatch_once_t oToken;
    dispatch_once(&oToken,^{
        oSharedInstance = [[ALogger alloc] init];
    });
    return oSharedInstance;
}

-(instancetype) init {
    
    self = [super init];
    if (self) {
        
        [self setPIsWriteToFile:NO];
        
        if (_pIsWriteToFile) {
            [self setPFileManager:[NSFileManager defaultManager]];
            [self mInitLogger];
        }
    
    }
    return self;
}

-(void) mInitLogger {
    
    NSArray* oPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    _pDirLogs = [NSString stringWithFormat:@"%@/Logs",[oPaths objectAtIndex:0]];
    [self mInitLogDir];
    
    _pPathLogfile = [NSString stringWithFormat:@"%@/log_%llu.txt",_pDirLogs,[ALogger mCurrentTimestamp]];
    [self mInitLogfile];
}

-(void) mInitLogDir {
    
    NSError* oError;
    if (![_pFileManager fileExistsAtPath:_pDirLogs]) {
        [_pFileManager createDirectoryAtPath:_pDirLogs withIntermediateDirectories:YES attributes:nil error:&oError];
            if (oError) {
            NSString* oLogEvent = [NSString stringWithFormat:@"%lld %@ %s:[%s]:[%d]\n",
                [ALogger mCurrentTimestamp],
                @"Error in creating Log directory",
                __PRETTY_FUNCTION__,
                __FILE__,
                __LINE__
            ];
            fCustomNSLogToConsole(oLogEvent);
        } else {
            NSString* oLogEvent = [NSString stringWithFormat:@"%lld %@ %s:[%s]:[%d]\n",
                [ALogger mCurrentTimestamp],
                @"Log directory created",
                __PRETTY_FUNCTION__,
                __FILE__,
                __LINE__
            ];
            fCustomNSLogToConsole(oLogEvent);
        }
    } else {
        NSString* oLogEvent = [NSString stringWithFormat:@"%lld %@ %s:[%s]:[%d]\n",
            [ALogger mCurrentTimestamp],
            @"Log directory existed",
            __PRETTY_FUNCTION__,
            __FILE__,
            __LINE__
        ];
        fCustomNSLogToConsole(oLogEvent);
    }
}

-(void) mInitLogfile {
    
    NSString* oLogEvent = [NSString stringWithFormat:@"%lld %@ %s:[%s]:[%d]\n",
        [ALogger mCurrentTimestamp],
        [NSString stringWithFormat:@"Logfile initiated for %@",[self mInitDeviceInfo]],
        __PRETTY_FUNCTION__,
        __FILE__,
        __LINE__
    ];

    NSData* oFileData = [oLogEvent dataUsingEncoding:NSUTF8StringEncoding];
    [_pFileManager createFileAtPath:_pPathLogfile contents:oFileData attributes:nil];
    
    if (![_pFileManager fileExistsAtPath:_pPathLogfile]) {
        NSString* oLogEvent = [NSString stringWithFormat:@"%lld %@ %s:[%s]:[%d]\n",
            [ALogger mCurrentTimestamp],
            [NSString stringWithFormat:@"Log file not created: %@",_pPathLogfile],
            __PRETTY_FUNCTION__,
            __FILE__,
            __LINE__
        ];
        fCustomNSLogToConsole(oLogEvent);
    } else {
        NSString* oLogEvent = [NSString stringWithFormat:@"%lld %@ %s:[%s]:[%d]\n",
            [ALogger mCurrentTimestamp],
            [NSString stringWithFormat:@"Log file created: %@",_pPathLogfile],
            __PRETTY_FUNCTION__,
            __FILE__,
            __LINE__
        ];
        fCustomNSLogToConsole(oLogEvent);
    }
}

-(NSString*) mInitDeviceInfo {
    
    struct utsname oSystemInfo;
    uname(&oSystemInfo);
    return [NSString stringWithCString:oSystemInfo.machine encoding:NSUTF8StringEncoding];
}

-(void) mAddTofile:(NSString*)inLogEvent {
    
    if (_pIsWriteToFile) {
    
        NSFileHandle* oFileHandler = [NSFileHandle fileHandleForWritingAtPath:_pPathLogfile];
        if (oFileHandler) {
            [oFileHandler seekToEndOfFile];
            [oFileHandler writeData:[inLogEvent dataUsingEncoding:NSUTF8StringEncoding]];
            [oFileHandler closeFile];
        } else {
            NSString* oLogEvent = [NSString stringWithFormat:@"%lld %@ %s:[%s]:[%d]\n",
                [ALogger mCurrentTimestamp],
                [NSString stringWithFormat:@"Adding to log failed"],
                __PRETTY_FUNCTION__,
                __FILE__,
                __LINE__
            ];
            fCustomNSLogToConsole(oLogEvent);
        }
        
    }
}

+(uint64_t) mCurrentTimestamp {
    
    struct timeval oTimevalue;
    gettimeofday(&oTimevalue, NULL);
    uint64_t oMillisecondsSinceEpoch = oTimevalue.tv_sec * (uint64_t)1000000 + oTimevalue.tv_usec;
    return oMillisecondsSinceEpoch;
}

@end
