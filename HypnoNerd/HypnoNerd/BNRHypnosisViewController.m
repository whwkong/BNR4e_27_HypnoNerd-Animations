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
    NSLog(@"%@", textField);
    
    textField.text = @"";
    [textField resignFirstResponder];
    
    return YES;
}


@end
