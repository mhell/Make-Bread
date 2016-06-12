//
//  Component.h
//  MakeBread
//
//  Created by Mattias Hellman on 31/5/2013.
//  Copyright (c) 2013 Mattias Hellman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ComponentInRecipie, Step;

@interface Component : NSManagedObject

@property (nonatomic, retain) NSString * brief;
@property (nonatomic, retain) NSDate * created;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) id optionValues;
@property (nonatomic, retain) NSString * specificInstruction;
@property (nonatomic, retain) Step *belongToStep;
@property (nonatomic, retain) NSSet *recipiesThatUses;
@end

@interface Component (CoreDataGeneratedAccessors)

- (void)addRecipiesThatUsesObject:(ComponentInRecipie *)value;
- (void)removeRecipiesThatUsesObject:(ComponentInRecipie *)value;
- (void)addRecipiesThatUses:(NSSet *)values;
- (void)removeRecipiesThatUses:(NSSet *)values;

@end
