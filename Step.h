//
//  Step.h
//  MakeBread
//
//  Created by Mattias Hellman on 31/5/2013.
//  Copyright (c) 2013 Mattias Hellman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Component;

@interface Step : NSManagedObject

@property (nonatomic, retain) NSNumber * allowMany;
@property (nonatomic, retain) NSString * brief;
@property (nonatomic, retain) NSNumber * haveSpecificInstruction;
@property (nonatomic, retain) NSNumber * ingredienceStep;
@property (nonatomic, retain) NSString * instruction;
@property (nonatomic, retain) NSNumber * name;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) id optionNames;
@property (nonatomic, retain) NSSet *componentsBelongingTo;
@end

@interface Step (CoreDataGeneratedAccessors)

- (void)addComponentsBelongingToObject:(Component *)value;
- (void)removeComponentsBelongingToObject:(Component *)value;
- (void)addComponentsBelongingTo:(NSSet *)values;
- (void)removeComponentsBelongingTo:(NSSet *)values;

@end
