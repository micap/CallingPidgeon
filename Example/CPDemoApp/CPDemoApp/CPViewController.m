//
//  CPViewController.m
//  CPDemoApp
//
//  Created by Mica Huynh on 28/03/2014.
//  Copyright (c) 2014 Mica Huynh. All rights reserved.
//

#import "CPViewController.h"
#import <CallingPidgeon/CPCountryPickerViewController.h>

@interface CPViewController () <CPCountryPickerViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *selectedLabel;

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
    countryPickerViewController.delegate = self;
    [self.navigationController pushViewController:countryPickerViewController animated:YES];
}

#pragma mark - CPCountryPickerViewControllerDelegate
- (void)countryPickerViewController:(CPCountryPickerViewController*)cpViewController didSelectCountry:(NSString *)selectedCountry
{
    self.selectedLabel.text = cpViewController.selectedCountry;
    [self.navigationController popViewControllerAnimated:YES];
}
@end
