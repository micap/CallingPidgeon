//
//  CPViewController.m
//  CPDemoApp
//
//  Created by Mica Huynh on 28/03/2014.
//  Copyright (c) 2014 Mica Huynh. All rights reserved.
//

#import "CPViewController.h"
#import <CallingPidgeon/CPCountryPickerViewController.h>

@interface CPViewController ()

@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender
{
    CPCountryPickerViewController *countryPickerViewController = [CPCountryPickerViewController new];
    [self.navigationController pushViewController:countryPickerViewController animated:YES];
}
@end
