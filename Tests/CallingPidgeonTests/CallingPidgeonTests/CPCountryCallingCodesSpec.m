//
//  CPCountryCallingCodesSpec.m
//  CallingPidgeonTests
//
//  Created by Mica Huynh on 28/03/2014.
//
//

#import <Kiwi/Kiwi.h>
#import <CallingPidgeon/CPCountryCallingCodes.h>

SPEC_BEGIN(CPCountryCallingCodesSpec)

describe(@"CPCountryCallingCodes returns the collection of country calling codes", ^{
    
    beforeAll(^{
        NSBundle *testBundle = [NSBundle bundleForClass:self];
        [NSBundle stub:@selector(mainBundle) andReturn:testBundle];
    });
    
    context(@"create the country calling codes list from json file", ^{
        
        it(@"returns a list of 239 countries", ^{
            [[@([CPCountryCallingCodes countryCallingCodes].count) should] equal:@(239)];
        });
    });

    context(@"formatted list of country calling codes", ^{
        beforeEach(^{
            NSDictionary *stubDict = @{@"Australia":@"61",
                                       @"Bahamas":@"1242"};
            [CPCountryCallingCodes stub:@selector(countryCallingCodesDict) andReturn:stubDict];
        });
        
        it(@"country item is formatted as \"Australia +61\"", ^{
            NSString *australia = [[CPCountryCallingCodes countryCallingCodes] firstObject];
            [[australia should] equal:@"Australia +61"];
        });
        
        it(@"list is sorted alphabetically in ascending order", ^{
            NSString *firstCountry = [[CPCountryCallingCodes countryCallingCodes] firstObject];
            NSString *secondCountry = [[CPCountryCallingCodes countryCallingCodes] objectAtIndex:1];
            
            [[firstCountry should] equal:@"Australia +61"];
            [[secondCountry should] equal:@"Bahamas +1242"];
        });
    });
    
});
SPEC_END