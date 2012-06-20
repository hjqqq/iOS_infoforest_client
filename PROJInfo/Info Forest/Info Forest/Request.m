//
//  Request.m
//  Info Forest
//
//  Created by Becky Hogan on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Request.h"
#import "ViewController.h"
#import "AFHTTPRequestOperation.h"
#import "AFXMLRequestOperation.h"
#import "AFImageRequestOperation.h"
#import "UIImageView+AFNetworking.h"
#import "AFKissXMLRequestOperation.h"



@implementation Request


- (id)httpRequest:(NSString *)httpurl
{
    NSURL *url = [NSURL URLWithString:httpurl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[[AFHTTPRequestOperation alloc] initWithRequest:request]autorelease];


    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    
        NSLog(@"operation hasAcceptableStatusCode: %d", [operation.response statusCode]);
        NSLog(@"response string: %@ ", operation.responseString);
    
    }
 
                                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                     NSLog(@"error: %@", operation.responseString);   
                                 }];
    [operation start];
    return operation;

    
}



 -(id)xmlRequest:(NSString *)xmlurl
{
    AFKissXMLRequestOperation *operation = [AFKissXMLRequestOperation XMLDocumentRequestOperationWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://legalindexes.indoff.com/sitemap.xml"]] success:^(NSURLRequest *request, NSHTTPURLResponse *response, DDXMLDocument *XMLDocument) {
        NSLog(@"XMLDocument: %@", XMLDocument);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, DDXMLDocument *XMLDocument) {
        NSLog(@"Failure!");
    }];
    
    [operation start];              

    return  operation;
    
}


-(id)imageRequest:(NSString *)imageurl :(const float *)width :(const float *)height
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, *width, *height)];
    [imageView setImageWithURL:[NSURL URLWithString:imageurl] placeholderImage:[UIImage imageNamed:@"abc.jpg"]];
    return imageView;
}


@end