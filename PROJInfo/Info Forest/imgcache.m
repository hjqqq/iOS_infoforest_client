//
//  imgcache.m
//  Info Forest
// 
//  Created by Becky Hogan on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//




#import "UIImageView+AFNetworking.h"
#import "imgCache.h"
#import "ViewController.h"
#import "Request.h"
#define TMP NSTemporaryDirectory()

#define CATCH_NUM 10 //jb how many items can be cached

@class Request;

@implementation imgcache;
@synthesize ListOfCachedUrls = _ListOfCachedUrls;
@synthesize count = _count;
@synthesize broadbent = _broadbent;



/*
typedef struct 
{ NSString *Base;
    NSString *device; 
    NSString *dataType; 
    NSString *extra;
    int pageNumber;
}InfoForestUrl;
*/

-(id)init
{   
    if(self = [super init])
    {
        _count = 0;
        _broadbent = [[NSFileManager alloc] init];
        _ListOfCachedUrls = [[NSMutableArray alloc] initWithArray: [_broadbent contentsOfDirectoryAtPath:TMP
                                                                                                   error:nil]];    
    }
    return self;
}


- (UIImage*) cacheImage: (NSString *) ImageURLString
{    
    NSURL *ImageURL = [NSURL URLWithString: ImageURLString];
    //generating unique name for the cached file with ImageURLString so you can retrive it back
    NSMutableString *tmpStr = [NSMutableString stringWithString:ImageURLString];
    [tmpStr replaceOccurrencesOfString:@"/" withString:@"-" options:1 range:NSMakeRange(0, [tmpStr length])];
    
    NSString *filename = [NSString stringWithFormat:@"%@",tmpStr];
    
    NSString *uniquePath = [TMP stringByAppendingPathComponent: filename];
    
    // Check for file existence
    //if(![[NSFileManager defaultManager] fileExistsAtPath: uniquePath])
    if(![_broadbent fileExistsAtPath:uniquePath])
    {
        // The file doesn't exist, we should get a copy of it
        
        
        // Fetch image
 //       NSData *data = [[NSData alloc] initWithContentsOfURL: ImageURL];
        NSData *data = [[NSData alloc] initWithContentsOfURL:ImageURL];//
   
        /*NSURLResponse *test = [[NSURLResponse alloc ] initWithURL:ImageURL
                                                         MIMEType:@"hello" 
                                            expectedContentLength:-1 
                                                 textEncodingName:nil];
                               
                      */  
        
        UIImage *image = [[UIImage alloc] initWithData: data];
                
            
        // Is it PNG or JPG/JPEG?
        // Running the image representation function writes the data from the image to a file
        //if([ImageURLString rangeOfString: @".png" options: NSCaseInsensitiveSearch].location != NSNotFound)
        //{
        //    [UIImagePNGRepresentation(image) writeToFile: uniquePath atomically: YES];
        //    _count++;
        //}
        //else if(
        //       [ImageURLString rangeOfString: @".jpg" options: NSCaseInsensitiveSearch].location != NSNotFound ||
        //       [ImageURLString rangeOfString: @".jpeg" options: NSCaseInsensitiveSearch].location != NSNotFound
        //       )
        //{
        [UIImageJPEGRepresentation(image, 100) writeToFile: uniquePath atomically: YES];
            _count++;
        //}
        
        if ([[NSFileManager defaultManager] fileExistsAtPath: uniquePath]) 
            NSLog(@"I saved the file and then was able to find it(first Time I have seen this guy)");
        else
            NSLog(@"I saved the file, but I can't find it. D'oh");
            
        
        
    }
    else  
    {
        NSLog(@"I did not have to save the file(Loaded from cach)");
    }
    
return  ([[UIImage alloc] initWithContentsOfFile:uniquePath]);
}

                                                    
@end