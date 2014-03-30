//
//  CPCountryPickerViewControllerSpec.m
//  CallingPidgeonTests
//
//  Created by Mica Huynh on 30/03/2014.
//
//

#import <Kiwi/Kiwi.h>
#import <CallingPidgeon/CPCountryPickerViewController.h>

@interface CPCountryPickerViewController(Tests)
- (id)initWithCountryCodeList:(NSArray *)countryCodes;
@end


SPEC_BEGIN(CPCountryPickerViewControllerSpec)

describe(@"CPCountryPickerViewController displays a list countries to pick from", ^{
    beforeEach(^{
        NSBundle *testBundle = [NSBundle bundleForClass:self];
        [NSBundle stub:@selector(mainBundle) andReturn:testBundle];
    });
    
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
    
    context(@"CPCountryPickerViewController as a tableView datasource", ^{
        __block CPCountryPickerViewController *viewController;
        beforeEach(^{
            viewController = [[CPCountryPickerViewController alloc] initWithCountryCodeList:@[@"Australia", @"Angola", @"Bahamas"]];
        });
        
        it(@"number of sections is equal to the number grouping for the country list", ^{
            [[@([viewController numberOfSectionsInTableView:viewController.tableView]) should] equal:@(2)];
        });
        
        it(@"number of rows is equal to the number countries for that section", ^{
            [[@([viewController tableView:viewController.tableView numberOfRowsInSection:0]) should] equal:@(2)];
            [[@([viewController tableView:viewController.tableView numberOfRowsInSection:1]) should] equal:@(1)];
        });
        it(@"configures a UITableViewCell with the country and its calling code", ^{
            UITableViewCell *cell = [viewController tableView:viewController.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            [[cell.textLabel.text should] equal:@"Australia"];
        });
    });
});
SPEC_END