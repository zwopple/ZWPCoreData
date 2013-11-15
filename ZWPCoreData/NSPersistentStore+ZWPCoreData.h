#import <CoreData/CoreData.h>

@interface NSPersistentStore (ZWPCoreData)

- (void)setMetadataObject:(id)object forKey:(NSString *)key;
- (void)removeObjectFromMetadataForKey:(NSString *)key;

@end
