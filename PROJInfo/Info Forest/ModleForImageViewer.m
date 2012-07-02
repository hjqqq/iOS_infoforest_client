//
//  ModleForImageViewer.m
//  Info Forest
//
//  Created by Becky Hogan on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModleForImageViewer.h"
#import "imgcache.h"



@interface ModleForImageViewer ()
@property (strong, nonatomic) imgcache *cache;
@property InfoForestUrl currentUrl;
@end

@implementation ModleForImageViewer
@synthesize cache = _cache;
//@synthesize page = _page;
@synthesize currentUrl = _currentUrl;
//@synthesize IfUrl = _IfUrl;


-(id)init
{
    if(self = [super init])
    {
       // _page = [[NSNumber alloc] initWithInt:1];
        _currentUrl.Base = @"http://dev.vis.uky.edu/if/";
        _currentUrl.device= @"iphone+";
        _currentUrl.dataType = @"RGB+";
        _currentUrl.extra = @"normal+";
       // _currentUrl.pageNumber =1;

        _cache = [[imgcache alloc] init];
        
    }
    
    return self;
}


-(NSString*)setUrl
{
    NSLog(@"NOT written yet");
return (@"sorry");
}

-(UIImage*)nextImage
{
    _currentUrl.pageNumber++;
    NSLog(@"NEXT");
    return [_cache cacheImage:[self helper]]; 
}

-(UIImage*)startImage {
   // sleep(1);
    _currentUrl.pageNumber = 1;
    NSLog(@"Loaded Up Page 1");
    return [_cache cacheImage:[self helper] ];
}

-(UIImage*)pervImage
{
    _currentUrl.pageNumber--;
    return [_cache cacheImage:[self helper]];
}



-(NSString*)helper
{
    InfoForestUrl data = _currentUrl;  //Simple locking for multi threaded stuff
    
    //Util test [data.Base+ data.device + data.dataType + data.extra + [_page stringValue];
    //NSstring* tmpString = [NSString alloc] init]
    //tmpString  = [tmpString stringByAppendingString:data.Base]
    NSString * pageString = [NSString stringWithFormat:@"%d",data.pageNumber];

    
    NSMutableString *tmpString = [[NSMutableString alloc] initWithFormat:data.Base ];
    //[tmpString appendString:data.Base];
    [tmpString appendString:data.device];
    [tmpString appendString:data.dataType];
    [tmpString appendString:data.extra];
    [tmpString appendString:pageString];
    //NSLog(tmpString);
    return tmpString;
    //[[[[tmpString appendString: data->device] 
     //  appendString:data->dataType] appendString: data->extra] appendString: [_page stringValue]];
    

}

@end
