//
//  Ingredience.h
//  MakeBread
//
//  Created by Mattias Hellman on 31/5/2013.
//  Copyright (c) 2013 Mattias Hellman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Component.h"


@interface Ingredience : Component

@property (nonatomic, retain) NSNumber * defaultQuantity;
@property (nonatomic, retain) id nutritionalValue;
@property (nonatomic, retain) NSString * unitOfMeasure;

@end
