//
//  CPChunkListSpec.m
//  CallingPidgeonTests
//
//  Created by Mica Huynh on 30/03/2014.
//
//

#import <Kiwi/Kiwi.h>
#import <CallingPidgeon/CPChunkList.h>

SPEC_BEGIN(CPChunkListSpec)
describe(@"CPChunkListSpec", ^{
    it(@"breaks up an array into groups based on the first letter of the items", ^{
        NSArray *data = @[@"Apples", @"Anchovies", @"Bananas", @"Berries"];
        NSDictionary *dictionary = [CPChunkList chunklist:data];
        
        [[dictionary should] equal:@{@"A":@[@"Apples",@"Anchovies"], @"B":@[@"Bananas", @"Berries"]}];
    });
});
SPEC_END