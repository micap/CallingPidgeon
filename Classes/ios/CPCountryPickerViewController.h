//
//  CPCountryPickerViewController.h
//  Pods
//
//  Created by Mica Huynh on 30/03/2014.
//
//

#import <UIKit/UIKit.h>

@class CPCountryPickerViewController;
/**
 *  Delegate on CPCountryViewController
 */
@protocol CPCountryPickerViewControllerDelegate <NSObject>
/**
 *  Called when a country is selected
 */
- (void)countryPickerViewController:(CPCountryPickerViewController*)cpViewController didSelectCountry:(NSString *)selectedCountry;
@end

/**
 *  A tableview controller that display a table of selectable countries
 */
@interface CPCountryPickerViewController : UITableViewController
@property (nonatomic, weak) id<CPCountryPickerViewControllerDelegate> delegate;
/**
 *  The selected country and its country code e.g. @"Autralia +61"
 */
@property (nonatomic, copy) NSString *selectedCountry;
@end

