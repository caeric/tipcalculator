//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Eric Hung on 1/6/14.
//  Copyright (c) 2014 Eric Hung. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipSegmentedControl;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDefaultTapChanged:(id)sender {
    NSLog(@"%d", self.defaultTipSegmentedControl.selectedSegmentIndex);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipSegmentedControl.selectedSegmentIndex forKey:@"DEFAULT_TIP_AMOUNT"];
    [defaults synchronize];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [self.defaultTipSegmentedControl setSelectedSegmentIndex: [defaults integerForKey:@"DEFAULT_TIP_AMOUNT"]]
    ;
}
@end
