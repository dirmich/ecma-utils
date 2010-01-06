#import <Foundation/Foundation.h>
#import "SoapEntityProto.h"

@class XMLWriter;

@interface SoapEnveloper : NSCoder {
	XMLWriter* writer;
	
	BOOL hasHeader;
	BOOL hasBody;
	int state;
	id contextObject;
}

@property(readonly) NSString* message;

+(SoapEnveloper*)soapEnveloper;

-(void)encodeHeaderObject: (id<SoapEntityProto>)objv;
-(void)encodeHeaderObject: (id<SoapEntityProto>)objv forKey: (NSString*)key;

-(void)encodeBodyObject: (id<SoapEntityProto>)objv;
-(void)encodeBodyObject: (id<SoapEntityProto>)objv forKey: (NSString*)key;

// protected

- (void)encodeString:(NSString*)str forKey:(NSString *)key attributes: (NSDictionary*)attrs;

@end
