#import "NSManagedObjectContext+ZWPCoreData.h"

@implementation NSManagedObjectContext (ZWPCoreData)

- (void)insertObjects:(NSArray *)array {
    for(NSManagedObject *object in array) {
        [self insertObject:object];
    }
}

- (void)deleteObjects:(NSArray *)array {
    for(NSManagedObject *object in array) {
        [self deleteObject:object];
    }
}

- (NSArray *)objectIdentifiersForObjects:(NSArray *)objects {
    NSMutableArray *identifiers = [NSMutableArray arrayWithCapacity:[objects count]];
    for(NSManagedObject *object in objects) {
        [identifiers addObject:[object objectID]];
    }
    return identifiers;
}

- (NSArray *)objectsForObjectIdentifiers:(NSArray *)identifiers {
    NSMutableArray *objects = [NSMutableArray arrayWithCapacity:[identifiers count]];
    for(NSManagedObjectID *identifier in identifiers) {
        NSManagedObject *object = [self objectWithID:identifier];
        if(object != nil) {
            [objects addObject:object];
        }
    }
    return objects;
}

@end
