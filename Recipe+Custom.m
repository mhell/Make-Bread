//
//  Recipe+Custom.m
//  MakeBread
//
//  Created by Mattias Hellman on 31/5/2013.
//  Copyright (c) 2013 Mattias Hellman. All rights reserved.
//

#import "Recipe+Custom.h"

@implementation Recipe (Custom)

+ (Recipe *)recipeWithName:(NSString *)name brief:(NSString *)brief inDocument:(UIManagedDocument *)document
{
    // Note: No unique checking (there can be two recipes with the same name)
    
    Recipe *recipe = [NSEntityDescription insertNewObjectForEntityForName:@"Recipe" inManagedObjectContext:document.managedObjectContext];
    recipe.name = name;
    recipe.brief = brief;
    
    return recipe;
}

@end
