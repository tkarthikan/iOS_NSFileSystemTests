//
//  ios_file_system.m
//  Test-FileSystem
//
//  Created by planitar on 2024-04-30.
//

#import <Foundation/Foundation.h>
//#include

#ifdef __APPLE__
    #include "TargetConditionals.h"
#endif
#ifdef __APPLE__
#if TARGET_OS_IOS || TARGET_OS_SIMULATOR
#import "ios_file_system.hpp"
#import <Foundation/Foundation.h>
#import <stdlib.h>
#import <stdlib.h>
#include <string>
#include <sstream>
#include <vector>

@implementation IosFileSystem

+ (BOOL)dirExists:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = NO;
    return [fileManager fileExistsAtPath:path isDirectory:&isDirectory] && isDirectory;
}

+ (bool)fileExists:(NSString*)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:path];
}

//
//+ (bool)symlinkExists:(const std::string &)path {
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSDictionary *attributes = [fileManager attributesOfItemAtPath:[NSString stringWithUTF8String:path.c_str()] error:nil];
//    return attributes[NSFileType] == NSFileTypeSymbolicLink;
//}

+ (BOOL)createDir:(NSString*)name {
    NSError *error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:name withIntermediateDirectories:YES attributes:nil error:&error];
    return error == nil;
}

+ (long)GetFileSize:(NSString*)filename {
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filename error:nil];
    return [attributes[NSFileSize] longValue];
}

+ (bool)CopyFile:(NSString*)src toDestination:(NSString*)dst {
    NSError *error = nil;
    [[NSFileManager defaultManager] copyItemAtPath:src toPath:dst error:&error];
    return error == nil;
}

+ (bool)RemoveFile:(NSString*)path {
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    return error == nil;
}

//
+ (void)cleanFolder:(NSString*)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:path error:nil];
    for (NSString *file in contents) {
        [fileManager removeItemAtPath:[NSString stringWithFormat:@"%@/%@", path, file] error:nil];
    }
}
//
+ (std::vector<std::string>)getFolderList:(const std::string &)path showHidden:(bool)show_hidden {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:[NSString stringWithUTF8String:path.c_str()] error:nil];
    std::vector<std::string> folders;
    for (NSString *file in contents) {
        if (![file hasPrefix:@"."] || show_hidden) {
            folders.push_back([file UTF8String]);
        }
    }
    return folders;
}
//
//+ (std::vector<std::string>)getFileList:(const std::string &)path showHidden:(bool)show_hidden {
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSArray *contents = [fileManager contentsOfDirectoryAtPath:[NSString stringWithUTF8String:path.c_str()] error:nil];
//    std::vector<std::string> files;
//    for (NSString *file in contents) {
//        if (![file hasPrefix:@"."] || show_hidden) {
//            files.push_back([file UTF8String]);
//        }
//    }
//    return files;
//}
//
//+ (int)getFileList:(const std::string &)path list:(std::vector<std::string>&)list {
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSArray *contents = [fileManager contentsOfDirectoryAtPath:[NSString stringWithUTF8String:path.c_str()] error:nil];
//    for (NSString *file in contents) {
//        [list push_back:[file UTF8String]];
//    }
//    return list.size();
//}
//
//+ (bool)safeFlashRmRf:(const std::string&)flashPath toPath:(const std::string&)path keepFolder:(bool)keepFolder {
//    if ([self CopyFile:flashPath toDestination:path]) {
//        if (!keepFolder) {
//            [self RemoveFile:flashPath];
//        }
//        return true;
//    }
//    return false;
//}

@end

#endif
#endif
