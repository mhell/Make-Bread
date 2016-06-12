//
//  Recipe+Custom.h
//  MakeBread
//
//  Created by Mattias Hellman on 31/5/2013.
//  Copyright (c) 2013 Mattias Hellman. All rights reserved.
//

#import "Recipe.h"

@interface Recipe (Custom)

/**  
  Creates and returns a recipe
  @param 
  @returns 
 */
+ (Recipe *)recipeWithName:(NSString *)name brief:(NSString *)brief inDocument:(UIManagedDocument *)document;

@end
