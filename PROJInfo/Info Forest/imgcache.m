//
//  imgcache.m
//  Info Forest
// 
//  Created by Becky Hogan on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//




#import "UIImageView+AFNetworking.h"
#import "ImgCache.h"
#import "ViewController.h"
#import "Request.h"
#define TMP NSTemporaryDirectory()

@class Request;

@implementation imgcache


- (void) cacheImage: (NSString *) ImageURLString
{
    NSURL *ImageURL = [NSURL URLWithString: ImageURLString];
    //generating unique name for the cached file with ImageURLString so you can retrive it back
    NSMutableString *tmpStr = [NSMutableString stringWithString:ImageURLString];
    [tmpStr replaceOccurrencesOfString:@"/" withString:@"-" options:1 range:NSMakeRange(0, [tmpStr length])];
    
    NSString *filename = [NSString stringWithFormat:@"%@",tmpStr];
    
    NSString *uniquePath = [TMP stringByAppendingPathComponent: filename];
    
    // Check for file existence
    if(![[NSFileManager defaultManager] fileExistsAtPath: uniquePath])
    {
        // The file doesn't exist, we should get a copy of it
        
        
        // Fetch image
        NSData *data = [[NSData alloc] initWithContentsOfURL: ImageURL];
        UIImage *image = [[UIImage alloc] initWithData: data];
        
        // Is it PNG or JPG/JPEG?
        // Running the image representation function writes the data from the image to a file
        if([ImageURLString rangeOfString: @".png" options: NSCaseInsensitiveSearch].location != NSNotFound)
        {
            [UIImagePNGRepresentation(image) writeToFile: uniquePath atomically: YES];
            
        }
        else if(
                [ImageURLString rangeOfString: @".jpg" options: NSCaseInsensitiveSearch].location != NSNotFound ||
                [ImageURLString rangeOfString: @".jpeg" options: NSCaseInsensitiveSearch].location != NSNotFound
                )
        {
            [UIImageJPEGRepresentation(image, 100) writeToFile: uniquePath atomically: YES];
        }
        
        else if ([[NSFileManager defaultManager] fileExistsAtPath: uniquePath]) {
            NSLog(@"Success!");
        }
    }
}


- (id) getImage: (NSString *) ImageURLString: (const float *)width: (const float *)height
{
    NSMutableString *tmpStr = [NSMutableString stringWithString:ImageURLString];
    [tmpStr replaceOccurrencesOfString:@"/" withString:@"-" options:1 range:NSMakeRange(0, [tmpStr length])];
    
    NSString *filename = [NSString stringWithFormat:@"%@",tmpStr];
    NSString *uniquePath = [TMP stringByAppendingPathComponent: filename];
    NSURL *pathURL = [NSURL URLWithString: uniquePath];

    UIImage *image;
    
    // Check for a cached version
    if([[NSFileManager defaultManager] fileExistsAtPath: uniquePath])
    {
        NSData *data = [[NSData alloc] initWithContentsOfFile:uniquePath];
        image = [[UIImage alloc] initWithData:data] ; // this is the cached image
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, *width, *height)];
        [imageView setImage:image];
        return imageView;
        
        
    }
    
    else
    {
        // get a new one
        [self cacheImage: ImageURLString];
        NSData *data = [[NSData alloc] initWithContentsOfURL:pathURL];
        image = [[UIImage alloc] initWithData:data];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, *width, *height)];
        [imageView setImageWithURL:[NSURL URLWithString:ImageURLString] placeholderImage:[UIImage imageNamed:@"abc.jpg"]];
        return imageView;
        
        
    
    }
            
}

@end