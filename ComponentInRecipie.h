//
//  ComponentInRecipie.h
//  MakeBread
//
//  Created by Mattias Hellman on 31/5/2013.
//  Copyright (c) 2013 Mattias Hellman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Component, Recipe;

@interface ComponentInRecipie : NSManagedObject

@property (nonatomic, retain) NSNumber * ingredienceAmount;
@property (nonatomic, retain) Component *component;
@property (nonatomic, retain) Recipe *recipe;

@end
