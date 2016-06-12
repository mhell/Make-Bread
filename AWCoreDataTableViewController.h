//
//  AWCoreDataTableViewController.h
//
//  Created by Alek Åström on 2012-03-04.
//  Copyright (c) 2012 Apps and Wonders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AWCoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
    NSFetchedResultsController *__fetchedResultsController;
}

@property (strong, nonatomic) UIManagedDocument *document;

// Getter must be overridden to provide a lazily loaded fetchedResultsController 
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

// This method should be overridden to provide table view cells with data
- (void)configureCell:(UITableViewCell *)cell forManagedObject:(NSManagedObject *)managedObject;

// Executes fetchedResultsController's fetch request and Reloads the rows and sections of the tableView
- (BOOL)fetchAndReload:(NSError **)error;

@end