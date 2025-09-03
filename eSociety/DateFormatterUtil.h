//
//  DateFormatterUtil.h
//  eSociety
//
//  Created by Meheboob on 03/09/25.
//


// DateFormatterUtil.h
#import <Foundation/Foundation.h>

@interface DateFormatterUtil : NSObject

/// Convert ISO date string (e.g. "2025-09-03T10:30:00Z") into display format
+ (NSString *)formattedDateFromString:(NSString *)dateString;

/// Convert NSDate into string with given format
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;

@end
