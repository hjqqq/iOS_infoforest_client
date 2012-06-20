//
//  Request.h
//  Info Forest
//
//  Created by Becky Hogan on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface Request : NSObject <NSXMLParserDelegate> 


-(id)httpRequest:(NSString *)httpurl;
-(id)xmlRequest:(NSString *)xmlurl;
-(id)imageRequest:(NSString *)imageurl: (const float *)width: (const float *)height;



@end
