//
//  CPChunkList.m
//  Pods
//
//  Created by Mica Huynh on 30/03/2014.
//
//

#import "CPChunkList.h"

@implementation CPChunkList
+ (NSDictionary *)chunklist:(NSArray *)list
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    for (NSString *item in list) {
        
        NSString *key = [item substringToIndex:1];
        NSArray *currentList = dictionary[key];
        if (!currentList) {
            
            [dictionary setObject:@[item] forKey:key];
        }
        else
        {
            [dictionary setObject:[currentList arrayByAddingObject:item] forKey:key];
        }
        
    }
    
    return [NSDictionary dictionaryWithDictionary:dictionary];
}
@end
