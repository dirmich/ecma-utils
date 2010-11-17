#import <UIKit/UIKit.h>
#import <sqlite3.h>

#import "DBObject.h"

#define kDBErrorDomain @"DBErrorDomain"
extern const NSUInteger kFailedToOpenDB;

@interface DB : NSObject {
	NSString *dbName;
	sqlite3 *impl;
}

+ (DB*)createDB:(NSString*)dbName error:(NSError**)error;
+ (DB*)dbNamed:(NSString*)dbName;

- (id)initWithDBName:(NSString*)db error:(NSError**)error;

- (NSArray*)select:(Class)klass conditions:(NSString*)criteria, ...;
- (NSArray*)select:(Class)klass conditions:(NSString*)criteria params:(NSArray*)params;
- (DBObject*)selectOne:(Class)klass offset:(NSInteger)offset conditions:(NSString*)criteria, ...;
- (DBObject*)selectOne:(Class)klass offset:(NSInteger)offset conditions:(NSString*)criteria params:(NSArray*)params;
- (id)select:(Class)klass wherePk:(long long)pk;

- (sqlite3_stmt*)prepareStmt:(NSString*)sql arguments:(id)arg1, ...;
- (sqlite3_stmt*)prepareStmt:(NSString*)sql params:(NSArray*)params;

- (long long)executeNumber:(NSString *)query, ...;
- (long long)executeNumber:(NSString *)query params:(NSArray*)params;

- (void)reload:(DBObject*)o;
- (void)update:(DBObject*)o;
- (void)insert:(DBObject*)o;
- (void)save:(DBObject*)o; // insert or update based on pk value
- (void)delete:(Class)klass conditions:(NSString*)criteria, ...;
- (void)delete:(Class)klass conditions:(NSString*)criteria params:(NSArray*)params;

- (void)beginTransaction;
- (void)commit;
- (void)rollback;
@end
