//
//  ViewController.m
//  Info Forest
//
//  Created by Becky Hogan on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "Request.h"
#import "ViewController.h"
#import "imgcache.h"
#import "ImageView.h"
#import "ThreeDViewController.h"

@class imgcache;
@class Request;
@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *buttonList;
@end

@implementation ViewController
@synthesize buttonList = _buttonList;
@synthesize scroll;
@synthesize textField;

-(IBAction)_3Dgo {
    ThreeDViewController *_3D = [[ThreeDViewController alloc] init];
    
    _3D.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:_3D animated:YES];
}

-(IBAction)image:(id)sender {
    
    
    ImageView *instanceOfView = [[ImageView alloc] init ];
    
    instanceOfView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentModalViewController:instanceOfView animated:YES];
    
    
}

- (void)buttonClicked:(UIButton*)button
{
    NSLog(@"Button %ld clicked.", (long int)[button tag]);
}

- (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame {
    NSString *embedHTML = @"\
    <html><head>\
    <style type=\"text/css\">\
    body {\
    background-color: transparent;\
    color: white;\
    }\
    </style>\
    </head>body style =\"margin:0\">\
    <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\"\
    width=\"%0.0f\" height=\"%0.0f\"></embed>\
    </body></html>";
    
    NSString *html = [NSString stringWithFormat:embedHTML, urlString, frame.size.width, frame.size.height];
    //NSLog(html);
    UIWebView *videoView = [[UIWebView alloc] initWithFrame:frame];
    [videoView loadHTMLString:html baseURL:nil];
    [self.view addSubview:videoView];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    
     int numberOfButtons = 6;
    _buttonList = [[NSMutableArray alloc] init];
    
    
    
    CGRect const screenSize =[[UIScreen mainScreen] bounds];
    int const buttonWidth= (screenSize.size.width/2);
    int const buttonHeight= (screenSize.size.height/9);
    

  
    for(int i = 1 ; i < numberOfButtons+1; i++)
    {
        UIButton *temp = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
        [temp setTitle:@"Hello" forState:UIControlStateNormal];
        
            if (UIInterfaceOrientationLandscapeRight){
                temp.frame = CGRectMake((screenSize.size.width/2)-(buttonWidth/2), i*(buttonHeight+(buttonHeight/4)), buttonWidth, buttonHeight
                                        );}
                [_buttonList addObject: temp];
        
        if ((numberOfButtons*buttonHeight*3/2)<=screenSize.size.height) {
            scroll.userInteractionEnabled = NO;
            [[self view]addSubview:temp];
        }
        
        else {
            [[self scroll]addSubview:temp];
        }
    }
     
    
    //ImageView *instanceOfView = [[ImageView alloc] init ];
    
    //instanceOfView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    //[self presentModalViewController:instanceOfView animated:YES];
    
    
    
    scroll.frame = CGRectMake(0, 0, screenSize.size.width, screenSize.size.height);
    [scroll setContentSize:CGSizeMake(screenSize.size.width, numberOfButtons*buttonHeight+screenSize.size.height)];
    [[self view] addSubview:scroll];  
    
   
    //Request *http=[[Request alloc] init];
    //[http httpRequest:@"http://dev.vis.uky.edu/if/iphone+highDef"];

    
   //Request *http=[[Request alloc] init];
    //[[self view]addSubview:[http imageRequest:@"http://whatscookingamerica.net/Desserts/PumpkinPie5.jpg":&screenSize.size.width:&screenSize.size.height]];
    
    
    Request *http=[[Request alloc] init];
    [http xmlRequest:@"http://legalindexes.indoff.com/sitemap.xml"];
    /*[http getXML:@"http://legalindexes.indoff.com/sitemap.xml"];
    
    [self embedYouTube:@"http://www.youtube.com/watch?v=SvGOYh9J6q4" frame:CGRectMake(20,20, 200,200)];
    */
    
       
/*    
    imgcache *cache=[[imgcache alloc] init];
   // [[self view] addSubview:[ [

    UIImageView *johnImage =[[UIImageView alloc] initWithImage:[cache cacheImage:@"http://whatscookingamerica.net/Desserts/PumpkinPie5.jpg"]];
    
    UIImageView *johnImage_2 = [[UIImageView alloc] initWithImage:[cache cacheImage:@"http://dev.vis.uky.edu/if/iphone+RGB+small+091"]];
    //UIImageView *mainImage = [[UIImageView alloc ] initWithFrame:&screenSize.size.width:&screenSize.size.height ];
    johnImage_2.frame= CGRectMake(0, 0, screenSize.size.width, screenSize.size.height);
    [[self view] addSubview:johnImage_2];
  */  
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationPortrait)
    {
        return YES;
    }
    if(interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        return YES;
    }
    return NO;
}

@end
