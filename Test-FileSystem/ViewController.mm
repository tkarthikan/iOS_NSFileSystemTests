//
//  ViewController.m
//  Test-FileSystem
//
//  Created by planitar on 2024-04-30.
//

#import "ViewController.h"
#import "ios_file_system.hpp"

@interface ViewController ()
- (void)createIMSFlashPath;
- (void)checkIfIMSFlashDirectoryCreated;
- (void)checkIfFileExists;
- (void)CopyFileToImsFlashPath;
- (void)createFileinDocuementFolder;

@end

@implementation ViewController

- (void)createIMSFlashPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSLog(@"Documents Directory: %@", documentsDirectory);
    
    // Append the desired directory name to the Documents directory path
    NSString *directoryPath = [documentsDirectory stringByAppendingPathComponent:@"imsFlash"];

    // Check if the directory already exists
    BOOL isDirectory;
    BOOL directoryExists = [[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:&isDirectory];

    BOOL success = [IosFileSystem createDir:directoryPath];
    
    if (success) {
        NSLog(@"Directory created successfully");
    } else {
        NSLog(@"Failed to create directory");
    }
}

- (void)checkIfIMSFlashDirectoryCreated {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSLog(@"Documents Directory: %@", documentsDirectory);
    // Append the desired directory name to the Documents directory path
    NSString *directoryPath = [documentsDirectory stringByAppendingPathComponent:@"imsFlash"];

    BOOL success = [IosFileSystem dirExists:directoryPath];
    
    if (success) {
        NSLog(@"IMS Flash Directory exists");
    } else {
        NSLog(@"Does not exist");
    }
}

- (void)createFileinDocuementFolder {
    // Get the path to the Documents directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSLog(@"Documents Directory: %@", documentsDirectory);

    // Specify the file name and path
    NSString *fileName = @"example.txt";
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];

    // Check if the file already exists
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSLog(@"File already exists at path: %@", filePath);
        return;
    }

    // Create some content for the file
    NSString *fileContent = @"Hello, this is some example text.";

    // Write the content to the file
    NSError *error;
    BOOL success = [fileContent writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if (success) {
        NSLog(@"File created successfully at path: %@", filePath);
    } else {
        NSLog(@"Failed to create file: %@", error.localizedDescription);
    }
}

- (void)checkIfFileExists {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSLog(@"Documents Directory: %@", documentsDirectory);
    // Append the desired directory name to the Documents directory path
    //NSString *directoryPath = [documentsDirectory stringByAppendingPathComponent:@"imsFlash"];
    NSString *fileName = @"example.txt";
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];

    BOOL success = [IosFileSystem fileExists:filePath];
    
    if (success) {
        NSLog(@"File exists");
    } else {
        NSLog(@"Does not exist");
    }
}

- (void)CopyFileToImsFlashPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSLog(@"Documents Directory: %@", documentsDirectory);
    // Append the desired directory name to the Documents directory path
    //NSString *directoryPath = [documentsDirectory stringByAppendingPathComponent:@"imsFlash"];
    NSString *fileName = @"example.txt";
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    // Append the desired directory name to the Documents directory path
    NSString *directoryPath = [documentsDirectory stringByAppendingPathComponent:@"imsFlash"];

    BOOL success = [IosFileSystem CopyFile:filePath toDestination:directoryPath];
    
    if (success) {
        NSLog(@"File copied");
    } else {
        NSLog(@"Does not exist");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createIMSFlashPath];
    [self checkIfIMSFlashDirectoryCreated]; // Corrected method call
    [self createFileinDocuementFolder];
    [self checkIfFileExists];
    [self CopyFileToImsFlashPath];
    // Do any additional setup after loading the view.
}


@end
