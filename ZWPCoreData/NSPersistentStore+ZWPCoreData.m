#import "NSPersistentStore+ZWPCoreData.h"

@implementation NSPersistentStore (ZWPCoreData)

- (void)setMetadataObject:(id)object forKey:(NSString *)key {
    NSMutableDictionary *metadata = [self.metadata mutableCopy];
    [metadata setObject:object forKey:key];
    [self setMetadata:metadata];
}

- (void)removeObjectFromMetadataForKey:(NSString *)key {
    NSMutableDictionary *metadata = [self.metadata mutableCopy];
    [metadata removeObjectForKey:key];
    [self setMetadata:metadata];
}

@end
