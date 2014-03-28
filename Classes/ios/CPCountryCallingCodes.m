//
//  CPCountryCallingCodes.m
//  Pods
//
//  Created by Mica Huynh on 28/03/2014.
//
//

#import "CPCountryCallingCodes.h"

@implementation CPCountryCallingCodes
+ (NSArray *)countryCallingCodes
{
    NSMutableArray *countryCallingCodeList = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < 239; i++) {
        [countryCallingCodeList addObject:@"foo"];
    }
    return countryCallingCodeList;
}
@end
