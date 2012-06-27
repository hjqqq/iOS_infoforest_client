//
//  imgcache.h
//  Info Forest
//
//  Created by Becky Hogan on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imgcache : NSObject {
    
}

- (void) cacheImage: (NSString *) ImageURLString;
- (id) getImage: (NSString *) ImageURLString: (const float *)width: (const float *)height;

@end


