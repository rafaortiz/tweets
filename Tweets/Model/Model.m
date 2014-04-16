//
//  Model.m
//  Tweets
//
//  Created by Rafael Ortiz on 16/04/14.
//  Copyright (c) 2014 Rafal Ortiz. All rights reserved.
//

#import "Model.h"

@implementation Model

- (id) initWithDict:(NSDictionary*)dict
{
	if ([dict isKindOfClass:[NSNull class]]) return nil;
	
	if ([dict isKindOfClass:[NSArray class]]) dict = [(NSArray*)dict objectAtIndex:0];
	
	if (self = [super init])
	{
        [self setValuesForKeysWithDictionary:dict];
	}
	
	return self;
}

- (void) setValue:(id)value forUndefinedKey:(NSString *)key
{
	return;
}

#pragma mark - Getter and setters

- (NSString*) getParamBoolean:(NSString*)string
{
	if ([self valueForKey:string] != nil &&
		![[self valueForKey:string] isKindOfClass:[NSNull class]])
		return ([[self valueForKey:string] boolValue]) ? @"sim" : @"nao";
	else
		return @"";
}

- (NSString*) getString:(NSString*)string
{
	if ([self valueForKey:string] != nil &&
		![[self valueForKey:string] isKindOfClass:[NSNull class]] &&
		[[self valueForKey:string] isKindOfClass:[NSString class]])
		return [self valueForKey:string];
	else
		return @"";
}

- (int) getInt:(NSString*)string
{
	if ([self valueForKey:string] != nil &&
		![[self valueForKey:string] isKindOfClass:[NSNull class]])
		return [[self valueForKey:string] intValue];
	else
		return 0;
}

#pragma mark - NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)encoder
{
}

- (id)initWithCoder:(NSCoder *)decoder
{
	if ( ![super init] )
		return nil;
	
	
	return self;
}

@end
