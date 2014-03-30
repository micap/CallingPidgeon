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
    
    for (NSString *item in [CPCountryCallingCodes countryCallingCodesDict]) {
        [countryCallingCodeList addObject:[NSString stringWithFormat:@"%@ +%@", item, [CPCountryCallingCodes countryCallingCodesDict][item]]];
    }
    NSArray *sorted = [countryCallingCodeList sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
    
    return sorted;
}

+ (NSDictionary *)countryCallingCodesDict
{
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *filePath = [mainBundle pathForResource:@"countries" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    return dictionary;
}
@end
