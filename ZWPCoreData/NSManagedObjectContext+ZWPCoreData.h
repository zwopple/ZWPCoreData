#import <CoreData/CoreData.h>
#import <Availability.h>

@interface NSManagedObjectContext (ZWPCoreData)

- (void)insertObjects:(NSArray *)array;
- (void)deleteObjects:(NSArray *)array;

- (NSArray *)objectIdentifiersForObjects:(NSArray *)objects;
- (NSArray *)objectsForObjectIdentifiers:(NSArray *)identifiers;

@end
