//
//  TipViewController.m
//  tipcalculator
//
//  Created by Eric Hung on 1/2/14.
//  Copyright (c) 2014 Eric Hung. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;

@property (strong, nonatomic) IBOutlet UISegmentedControl *tipAmountSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
- (void) updateValue;
- (IBAction)onTap:(id)sender;
@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValue];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// files owner is just the uiviewcontroller

- (void) updateValue {
    float billAmount = [self.billTextField.text floatValue];
    // @(x) boxes x into nsnumber
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipAmountSegmentedControl.selectedSegmentIndex]floatValue];
    float totalAmount = tipAmount +  billAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];

    
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValue];
}
@end