//
//  CPCountryCallingCodes.h
//  Pods
//
//  Created by Mica Huynh on 28/03/2014.
//
//

#import <Foundation/Foundation.h>

/**
 *  Holds the collection of country calling codes
 */
@interface CPCountryCallingCodes : NSObject
/**
 *  @return the list of countries with their calling codes, sorted alphabetically in ascending order.
 */
+ (NSArray *)countryCallingCodes;
/**
 *  @return the dictionary of countries with their calling codes
 */
+ (NSDictionary *)countryCallingCodesDict;
@end
