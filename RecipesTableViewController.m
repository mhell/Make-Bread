//
//  RecipesTableViewController.m
//  MakeBread
//
//  Created by Mattias Hellman on 27/5/2013.
//  Copyright (c) 2013 Mattias Hellman. All rights reserved.
//

#import "RecipesTableViewController.h"
#import "Recipe+Custom.h"


@interface RecipesTableViewController ()
    // Declare private methods here (with comments)?
@end


@implementation RecipesTableViewController

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Waits with opening the document until the view will appear
    [self openDocument];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DocumentAccessor

- (ManagedDocumentError *)document
{
    return self.recipesDocument;
}

- (void)setDocument:(ManagedDocumentError *)document
{
    self.recipesDocument = document;
}

#pragma mark - Document handling

- (void) openDocument
{
    // Document does not exist on disc
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.recipesDocument.fileURL path]]) {
        NSString *documentName =[[self.recipesDocument.fileURL path] lastPathComponent];
        NSURL *preloadURL = [[[NSBundle mainBundle] bundleURL] URLByAppendingPathComponent:documentName];
        
        // Preloadable document (with same name as initiated document) found in boundle
        if ([[NSFileManager defaultManager] fileExistsAtPath:[preloadURL path]]) {
            NSError *error = nil;
            
            //Copies the preload Document
            if([[NSFileManager defaultManager] copyItemAtPath:[preloadURL path] toPath:[self.recipesDocument.fileURL path]  error:&error]) {
                // Opens it
                [self.recipesDocument openWithCompletionHandler:^(BOOL success) {
                    [self fetchAndReload:nil];
                }];
            } else {
                NSLog(@"%@", error);
            }
        // No preloadable document found, creates a new document
        } else {
            NSLog(@"Preload not found");
            [self.recipesDocument saveToURL:self.recipesDocument.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:nil];
        }
    // Document exists on disk
    } else if (self.recipesDocument.documentState == UIDocumentStateClosed) {
        // Opens it
        [self.recipesDocument openWithCompletionHandler:^(BOOL success) {
            [self fetchAndReload:nil];
        }];
    // Document is already open and ready to use
    } else if (self.recipesDocument.documentState == UIDocumentStateNormal) {
        
    }
}

- (void)saveDocument
{
    [self.recipesDocument saveToURL:self.recipesDocument.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:^(BOOL success) {
        if (!success) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             */
            NSLog(@"Save fail");
            abort();
        }
    }];
}

#pragma mark - AWCoreDataTableViewController

- (NSFetchedResultsController *)fetchedResultsController {
    if (__fetchedResultsController != nil) {
        return __fetchedResultsController;
    }
    
    // Create a fetch request
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Recipe"];
    
    // Set batch size
    [fetchRequest setFetchBatchSize:20];
    
    // Create sort descriptor(s)
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Create a NSFetchedResultsController with cache and a delegate
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.recipesDocument.managedObjectContext sectionNameKeyPath:nil cacheName:@"recipes"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self fetchAndReload:&error]) {
        
        //Replace this implementation with code to handle the error appropriately.
        
        //abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return __fetchedResultsController;
}

- (void)configureCell:(UITableViewCell *)cell forManagedObject:(NSManagedObject *)managedObject {
    Recipe *recipe = (Recipe *)managedObject;
    
    cell.textLabel.text = recipe.name;
    cell.detailTextLabel.text = recipe.brief;
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the managed object for the given index path
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        [self saveDocument];
    }
}

@end

