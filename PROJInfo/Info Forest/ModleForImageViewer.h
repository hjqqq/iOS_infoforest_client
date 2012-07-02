//
//  ModleForImageViewer.h
//  Info Forest
//
//  Created by Becky Hogan on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModleForImageViewer : NSObject
typedef struct 
{ NSString *Base;
    NSString *device; 
    NSString *dataType; 
    NSString *extra;
    int pageNumber;
}InfoForestUrl;

//@property (strong, nonatomic) NSString *IfUrl;


-(id)init;
//-(void)setIfUrl:(NSString *)IfUrl;
-(UIImage*)nextImage;
-(UIImage*)pervImage;
-(UIImage*)startImage;
-(NSString*)setUrl;
-(NSString*)helper; 



@end
