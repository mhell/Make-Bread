//
//  ManagedDocumentError.m
//  MakeBread
//
//  Created by Mattias Hellman on 2/6/2013.
//  Copyright (c) 2013 Mattias Hellman. All rights reserved.
//

#import "ManagedDocumentError.h"
#import <CoreData/CoreData.h>

@implementation ManagedDocumentError

- (id)contentsForType:(NSString *)typeName error:(NSError *__autoreleasing *)outError
{
    NSLog(@"Auto-Saving Document");
    return [super contentsForType:typeName error:outError];
}

- (void)handleError:(NSError *)error userInteractionPermitted:(BOOL)userInteractionPermitted
{
    NSLog(@"UIManagedDocument error: %@", error.localizedDescription);
    NSArray* errors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
    if(errors != nil && errors.count > 0) {
        for (NSError *error in errors) {
            NSLog(@"  Error: %@", error.userInfo);
        }
    } else {
        NSLog(@"  %@", error.userInfo);
    }
}

@end
