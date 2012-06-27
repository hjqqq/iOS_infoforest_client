//
//  ViewController.h
//  Info Forest
//
//  Created by Becky Hogan on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController {
    UIScrollView *scroll;
    NSMutableArray *buttonList;
    UITextField *textField;
    MPMoviePlayerController *movieController;
}

@property (retain,nonatomic) IBOutlet UIScrollView *scroll;
@property (retain,nonatomic) IBOutlet UITextField *textField;

-(void)embedYouTube:(NSString *)urlString frame:(CGRect)frame;
@end

