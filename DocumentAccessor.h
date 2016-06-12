//
//  DocumentViewController.h
//  MakeBread
//
//  Created by Mattias Hellman on 29/5/2013.
//  Copyright (c) 2013 Mattias Hellman. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DocumentAccessor <NSObject>

@property (nonatomic, strong) UIManagedDocument *document;

@end
