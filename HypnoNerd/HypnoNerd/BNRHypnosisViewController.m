//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by William Kong on 2014-05-09.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

@end



@implementation BNRHypnosisViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        NSLog(@"HVC initWithNibName: %@, %p", nibNameOrNil, self.view);
        
        // Create UIImage from file
        // Hypno@2x.png automatically loaded on retina displays
        UIImage *img = [UIImage imageNamed:@"Hypno"];
        
        // set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        // put image on tab bar item
        self.tabBarItem.image = img;
    }
    
    return self;
}

-(void) loadView
{
    NSLog(@"HVC loadView");
    
    // Create a view
    BNRHypnosisView *hypnosisView = [[BNRHypnosisView alloc] init];
    
        // Add a textField
        CGRect textFieldRect = CGRectMake(40,70,240,30);
        UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
        // Setting the border style on the text field will allow us to see it more easily
        textField.borderStyle = UITextBorderStyleRoundedRect;
    
        textField.placeholder = @"Hypnotize me";
        textField.returnKeyType = UIReturnKeyDone;
    
        textField.keyboardType = UIKeyboardTypeASCIICapable;
    
        [hypnosisView addSubview:textField];
    
        textField.delegate = self;
    
    self.view = hypnosisView;
}

// Creates 20 UILabels on the screen at random positions
-(void) drawHypnoticMessage:(NSString*) message
{
    for (int i=0; i<20; ++i) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        // Configure the label's colors and text
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        // resizes the label, relative to the text its displaying
        [messageLabel sizeToFit];
        
        // get a random x value that fits within the hypnosis view's width
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        // get a random y value that fits within the hypnosis view's height
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        // Update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x,y);
        messageLabel.frame = frame;
        
        // Add the label to hierarchy
        [self.view addSubview:messageLabel];
        
        // Add motion effects for iOS 7 devices
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
    }
}


-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"HVC viewWillAppear:");
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"HVC viewDidLoad");
}


- (BOOL)textFieldShouldReturn:(UITextField *) textField
{
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    
    return YES;
}


@end
