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
@property (weak, nonatomic) IBOutlet UIButton *countryPickerButton;

@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(styleViews)
		   name:UIContentSizeCategoryDidChangeNotification
     object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self styleViews];
}
- (void)styleViews
{
    self.selectedLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    NSAttributedString *attributedButtonTitle = [[NSAttributedString alloc] initWithString:@"Select country" attributes:@{NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]}];
    [self.countryPickerButton setAttributedTitle:attributedButtonTitle forState:UIControlStateNormal];
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
