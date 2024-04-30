//
//  ios_file_system.h
//  Test-FileSystem
//
//  Created by planitar on 2024-04-30.
//

#ifndef ios_file_system_hpp
#define ios_file_system_hpp
#ifdef __APPLE__
    #include "TargetConditionals.h"

#if TARGET_OS_IOS || TARGET_OS_SIMULATOR

#import <Foundation/Foundation.h>
#import <stdlib.h>

//#ifdef __objc2
#include <string>
#include <sstream>
#include <vector>

//    #include "ims_file_system.h"
@interface IosFileSystem :  NSObject
+ (BOOL)dirExists:(NSString *)path;
+ (BOOL)fileExists:(NSString *)path;
+ (BOOL)symlinkExists:(NSString *)path;
+ (BOOL)createDir:(NSString *)name;
+ (long)GetFileSize:(NSString *)filename;
+ (BOOL)CopyFile:(NSString *)src toDestination:(NSString *)dst;
+ (BOOL)RemoveFile:(NSString *)path;
+ (void)cleanFolder:(NSString *)path;
+ (std::vector<std::string>)getFolderList:(const std::string &)path showHidden:(BOOL)show_hidden;
+ (NSArray<NSString *> *)getFileList:(NSString *)path showHidden:(BOOL)show_hidden;
+ (int)getFileList:(NSString *)path list:(NSMutableArray<NSString *> *)list;
+ (BOOL)safeFlashRmRf:(NSString *)flashPath path:(NSString *)path keepFolder:(BOOL)keepFolder;
@end 

//#endif
#endif
#endif


#endif /* ios_file_system_h */

