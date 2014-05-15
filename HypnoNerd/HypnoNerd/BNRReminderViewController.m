//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by William Kong on 2014-05-11.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker* datePicker;
@end


@implementation BNRReminderViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        NSLog(@"RVC initWithNibName: %@, %p", nibNameOrNil, self.view);
        
        // set the tab bar item's title
        self.tabBarItem.title = @"Reminder";
        
        // Create UIImage from file
        // Hypno@2x.png automatically loaded on retina displays
        UIImage *img = [UIImage imageNamed:@"Time"];
        
        // put image on tab bar item
        self.tabBarItem.image = img;
    }
    
    return self;
}

- (IBAction) addReminderButtonPressed:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}


-(void) viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"RVC viewDidLoad");
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"RVC viewWillAppear:");
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end

