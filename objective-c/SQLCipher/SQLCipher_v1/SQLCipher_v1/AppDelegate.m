//
//  AppDelegate.m
//  SQLCipher_v1
//
//  Created by Alexandr KIRILOV on 08/02/2023.
//

#import "AppDelegate.h"

#import "sqlite3.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	NSString *databasePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
                          stringByAppendingPathComponent: @"sqlcipher.db"];
	
	sqlite3 *db;
	sqlite3_stmt *stmt;
	bool sqlcipher_valid = NO;
	
	if (sqlite3_open([databasePath UTF8String], &db) == SQLITE_OK) {
		
		const char* key = [@"DBKey" UTF8String];
		sqlite3_key(db, key, (int)strlen(key));
		
		if (sqlite3_exec(db, (const char*) "SELECT count(*) FROM sqlite_master;", NULL, NULL, NULL) == SQLITE_OK) {
			if(sqlite3_prepare_v2(db, "PRAGMA cipher_version;", -1, &stmt, NULL) == SQLITE_OK) {
				if(sqlite3_step(stmt)== SQLITE_ROW) {
					const unsigned char *ver = sqlite3_column_text(stmt, 0);
					if(ver != NULL) {
						sqlcipher_valid = YES;
						NSLog(@"ciper_version = %s", ver);
					}
				}
				sqlite3_finalize(stmt);
			}
		}
		
		sqlite3_close(db);
	}
	
	return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
	// Called when a new scene session is being created.
	// Use this method to select a configuration to create the new scene with.
	return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
	// Called when the user discards a scene session.
	// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
	// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
