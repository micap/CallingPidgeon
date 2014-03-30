//
//  CPChunkList.h
//  Pods
//
//  Created by Mica Huynh on 30/03/2014.
//
//

#import <Foundation/Foundation.h>
/**
 *  Class used to seperate arrays into logical groupings
 */
@interface CPChunkList : NSObject
/**
 *  Separates the list into groups based on the first letter of the item in the array
 *
 *  @param list the list to be chunked
 *
 *  @return the dictionary of the grouped items `@{@"A":@[@"Apples",@"Anchovies"], @"B":@[@"Bananas", @"Berries"]}`
 */
+ (NSDictionary *)chunklist:(NSArray *)list;
@end
