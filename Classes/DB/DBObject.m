#import "DBObject.h"
#import <objc/runtime.h>
#import "NSObject+Utils.h"
#import "DB.h"

@implementation DBObject

@synthesize pk;

+ (NSString*)tableName {
	return NSStringFromClass([self class]);
}


- (NSString*)tableName {
	return [[self class] tableName];
}


+ (NSString*)pkColumn {
	return @"pk";
}


- (NSString*)pkColumn {
	return [[self class] pkColumn];
}


+ (NSString*)insertConflictClause {
	return @"";
}


- (NSString*)insertConflictClause {
	return [[self class] insertConflictClause];
}


- (id)init {
	if(self = [super init]) {
		pk = DBOBJECT_NO_ID;
	}
	return self;
}


- (BOOL)isNewRecord {
	return pk == DBOBJECT_NO_ID;
}


- (void)afterLoad {
}


- (void)beforeSave {
}


- (void)beforeInsert {
}


- (void)beforeUpdate {
}


- (void)afterInsert {
}


- (void)afterUpdate {
}


- (void)afterSave {
}


- (void)bindToParam:(NSUInteger)i inStatement:(sqlite3_stmt*)statement {
	sqlite3_bind_int64(statement, i, self.pk);
}


- (void)setValue:(id)value forUndefinedKey:(NSString*)key {
	if([key isEqual:[self pkColumn]]) {
		return [self setValue:value forKey:@"pk"];
	}
	
	return [super setValue:value forUndefinedKey:key];
}


- (id)valueForUndefinedKey:(NSString*)key {
	if([key isEqual:[self pkColumn]]) {
		return [self valueForKey:@"pk"];
	}
	
	return [super valueForUndefinedKey:key];
}

@end
