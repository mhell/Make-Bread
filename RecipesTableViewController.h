//
//  RecipesTableViewController.h
//  MakeBread
//
//  Created by Mattias Hellman on 27/5/2013.
//  Copyright (c) 2013 Mattias Hellman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWCoreDataTableViewController.h"
#import "ManagedDocumentError.h"

@interface RecipesTableViewController : AWCoreDataTableViewController

@property (nonatomic, strong) ManagedDocumentError *recipesDocument;

@end
