#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NSManagedObject (ZWPCoreData)

#pragma mark - Metadata / Creation

+ (NSString *)entityNameInContext:(NSManagedObjectContext *)context;
+ (NSEntityDescription *)entityDescriptionInContext:(NSManagedObjectContext *)context;
+ (instancetype)createWithContext:(NSManagedObjectContext *)context;

#pragma mark - Requesting

+ (NSFetchRequest *)requestFirstInContext:(NSManagedObjectContext *)context;
+ (NSFetchRequest *)requestFirstInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortOn:(NSString *)sortOn ascending:(BOOL)ascending;
+ (NSFetchRequest *)requestFirstInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors;

+ (NSFetchRequest *)requestAllInContext:(NSManagedObjectContext *)context;
+ (NSFetchRequest *)requestAllInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortOn:(NSString *)sortOn ascending:(BOOL)ascending;
+ (NSFetchRequest *)requestAllInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors;

+ (NSFetchRequest *)requestCountInContext:(NSManagedObjectContext *)context;
+ (NSFetchRequest *)requestCountInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate;

#pragma mark - Counting

+ (NSUInteger)countInContext:(NSManagedObjectContext *)context error:(__autoreleasing NSError **)outError;
+ (NSUInteger)countInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate error:(__autoreleasing NSError **)outError;

#pragma mark - Fetching

+ (instancetype)fetchFirstInContext:(NSManagedObjectContext *)context error:(__autoreleasing NSError **)outError;
+ (instancetype)fetchFirstInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortOn:(NSString *)sortOn ascending:(BOOL)ascending error:(__autoreleasing NSError **)outError;
+ (instancetype)fetchFirstInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors error:(__autoreleasing NSError **)outError;

+ (NSArray *)fetchAllInContext:(NSManagedObjectContext *)context error:(__autoreleasing NSError **)outError;
+ (NSArray *)fetchAllInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortOn:(NSString *)sortOn ascending:(BOOL)ascending error:(__autoreleasing NSError **)outError;
+ (NSArray *)fetchAllInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors error:(__autoreleasing NSError **)outError;

#pragma mark - Deleting

+ (BOOL)deleteAllInContext:(NSManagedObjectContext *)context error:(__autoreleasing NSError **)outError;
+ (BOOL)deleteAllInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate error:(__autoreleasing NSError **)outError;

@end