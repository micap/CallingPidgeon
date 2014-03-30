//
//  CPCountryPickerViewControllerSpec.m
//  CallingPidgeonTests
//
//  Created by Mica Huynh on 30/03/2014.
//
//

#import <Kiwi/Kiwi.h>
#import <CallingPidgeon/CPCountryPickerViewController.h>

SPEC_BEGIN(CPCountryPickerViewControllerSpec)

describe(@"CPCountryPickerViewController displays a list countries to pick from", ^{
    it(@"has a default title of 'Select a country'", ^{
        CPCountryPickerViewController *viewController = [[CPCountryPickerViewController alloc] init];
        [viewController viewDidLoad];
        [[viewController.title should] equal:@"Select a country"];
    });
    
    it(@"can have a different title set on it", ^{
        NSString *expectedTitle = @"Foo";
        
        CPCountryPickerViewController *viewController = [[CPCountryPickerViewController alloc] init];
        viewController.title = expectedTitle;
        [viewController viewDidLoad];
        [[viewController.title should] equal:expectedTitle];
    });
});
SPEC_END