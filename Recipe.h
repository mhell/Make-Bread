//
//  Recipe.h
//  MakeBread
//
//  Created by Mattias Hellman on 31/5/2013.
//  Copyright (c) 2013 Mattias Hellman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ComponentInRecipie;

@interface Recipe : NSManagedObject

@property (nonatomic, retain) NSString * brief;
@property (nonatomic, retain) NSDate * created;
@property (nonatomic, retain) NSString * creator;
@property (nonatomic, retain) id image;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSSet *components;
@end

@interface Recipe (CoreDataGeneratedAccessors)

- (void)addComponentsObject:(ComponentInRecipie *)value;
- (void)removeComponentsObject:(ComponentInRecipie *)value;
- (void)addComponents:(NSSet *)values;
- (void)removeComponents:(NSSet *)values;

@end
