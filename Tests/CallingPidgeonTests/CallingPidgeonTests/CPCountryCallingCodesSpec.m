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
    
    it(@"returns a list of 239 countries", ^{
        [[@([CPCountryCallingCodes countryCallingCodes].count) should] equal:@(239)];
    });
    
});
SPEC_END