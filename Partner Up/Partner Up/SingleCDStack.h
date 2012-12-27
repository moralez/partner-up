//
//  SingleCDStack.h
//  NewQuickWords
//
//  Created by Logen Watkins on 9/20/12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

// Fetch sizes
#define NO_FETCH_LIMIT 0
#define FETCH_SINGLE 1

@interface SingleCDStack : NSObject
{
    NSManagedObjectContext *singleContext;
}

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (id)sharedInstance;
+ (NSManagedObjectContext *)getContext;

+ (void)saveChanges;
+ (void)saveChangesInContext:(NSManagedObjectContext *)context;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory; 

@end
