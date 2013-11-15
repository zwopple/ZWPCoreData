#import "NSManagedObject+ZWPCoreData.h"

@implementation NSManagedObject (ZWPCoreData)

#pragma mark - Metadata / Creation

+ (NSString *)entityNameInContext:(NSManagedObjectContext *)context {
    return NSStringFromClass([self class]);
}

+ (NSEntityDescription *)entityDescriptionInContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription entityForName:[self entityNameInContext:context] inManagedObjectContext:context];
}

+ (instancetype)createWithContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityNameInContext:context] inManagedObjectContext:context];
}

#pragma mark - Requesting

+ (NSFetchRequest *)requestFirstInContext:(NSManagedObjectContext *)context {
    return [self requestFirstInContext:context predicate:nil sortDescriptors:nil];
}

+ (NSFetchRequest *)requestFirstInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortOn:(NSString *)sortOn ascending:(BOOL)ascending {
    NSArray *sortDescriptors = (sortOn) ? @[[NSSortDescriptor sortDescriptorWithKey:sortOn ascending:ascending]] : nil;
    return [self requestFirstInContext:context predicate:predicate sortDescriptors:sortDescriptors];
}

+ (NSFetchRequest *)requestFirstInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[self entityNameInContext:context]];
    request.predicate = predicate;
    request.sortDescriptors = sortDescriptors;
    request.fetchLimit = 1;
    return request;
}

+ (NSFetchRequest *)requestAllInContext:(NSManagedObjectContext *)context {
    return [self requestAllInContext:context predicate:nil sortDescriptors:nil];
}

+ (NSFetchRequest *)requestAllInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortOn:(NSString *)sortOn ascending:(BOOL)ascending {
    NSArray *sortDescriptors = (sortOn) ? @[[NSSortDescriptor sortDescriptorWithKey:sortOn ascending:ascending]] : nil;
    return [self requestAllInContext:context predicate:predicate sortDescriptors:sortDescriptors];
}

+ (NSFetchRequest *)requestAllInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[self entityNameInContext:context]];
    request.predicate = predicate;
    request.sortDescriptors = sortDescriptors;
    return request;
}

+ (NSFetchRequest *)requestCountInContext:(NSManagedObjectContext *)context {
    return [self requestCountInContext:context predicate:nil];
}

+ (NSFetchRequest *)requestCountInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[self entityNameInContext:context]];
    request.predicate = predicate;
    [request setResultType:NSCountResultType];
    return request;
}

#pragma mark - Counting

+ (NSUInteger)countInContext:(NSManagedObjectContext *)context error:(__autoreleasing NSError **)outError {
    return [context countForFetchRequest:[self requestCountInContext:context] error:outError];
}

+ (NSUInteger)countInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate error:(__autoreleasing NSError **)outError {
    return [context countForFetchRequest:[self requestCountInContext:context predicate:predicate] error:outError];
}

#pragma mark - Fetching

+ (instancetype)fetchFirstInContext:(NSManagedObjectContext *)context error:(__autoreleasing NSError **)outError {
    NSArray *results = [context executeFetchRequest:[self requestFirstInContext:context] error:outError];
    return (results.count > 0) ? results[0] : nil;
}

+ (instancetype)fetchFirstInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortOn:(NSString *)sortOn ascending:(BOOL)ascending error:(__autoreleasing NSError **)outError {
    NSArray *results = [context executeFetchRequest:[self requestFirstInContext:context predicate:predicate sortOn:sortOn ascending:ascending] error:outError];
    return (results.count > 0) ? results[0] : nil;
}

+ (instancetype)fetchFirstInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors error:(__autoreleasing NSError **)outError {
    NSArray *results = [context executeFetchRequest:[self requestFirstInContext:context predicate:predicate sortDescriptors:sortDescriptors] error:outError];
    return (results.count > 0) ? results[0] : nil;
}

+ (NSArray *)fetchAllInContext:(NSManagedObjectContext *)context error:(__autoreleasing NSError **)outError {
    return [context executeFetchRequest:[self requestAllInContext:context] error:outError];
}

+ (NSArray *)fetchAllInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortOn:(NSString *)sortOn ascending:(BOOL)ascending error:(__autoreleasing NSError **)outError {
    return [context executeFetchRequest:[self requestAllInContext:context predicate:predicate sortOn:sortOn ascending:ascending] error:outError];
}

+ (NSArray *)fetchAllInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors error:(__autoreleasing NSError **)outError {
    return [context executeFetchRequest:[self requestAllInContext:context predicate:predicate sortDescriptors:sortDescriptors] error:outError];
}

#pragma mark - Deleting

+ (BOOL)deleteAllInContext:(NSManagedObjectContext *)context error:(__autoreleasing NSError **)outError {
    return [self deleteAllInContext:context predicate:nil error:outError];
}

+ (BOOL)deleteAllInContext:(NSManagedObjectContext *)context predicate:(NSPredicate *)predicate error:(__autoreleasing NSError **)outError {
    NSError *error = nil;
    NSArray *objects = [self fetchAllInContext:context predicate:predicate sortDescriptors:nil error:&error];
    if(error) {
        if(outError) {
            *outError = error;
        }
        return NO;
    }

    for(id object in objects) {
        [context deleteObject:object];
    }
    return YES;
}

@end