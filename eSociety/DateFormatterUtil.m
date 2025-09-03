//
//  DateFormatterUtil.m
//  eSociety
//
//  Created by Meheboob on 03/09/25.
//

// DateFormatterUtil.m
#import "DateFormatterUtil.h"

@implementation DateFormatterUtil

+ (NSString *)formattedDateFromString:(NSString *)dateString {
    if (!dateString) return @"";
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    inputFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    inputFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    
    NSDate *date = [inputFormatter dateFromString:dateString];
    if (!date) return dateString;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    outputFormatter.dateStyle = NSDateFormatterMediumStyle;
    outputFormatter.timeStyle = NSDateFormatterShortStyle;
    
    return [outputFormatter stringFromDate:date];
}

+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format {
    if (!date) return @"";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:date];
}

@end
