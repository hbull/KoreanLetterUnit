//
//  KoreanLetterUnit.h
//  KoreanLetterUnit
//
//  Created by donghyun on 2/11/15.
//  Copyright (c) 2015 donghyun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, KoreanLetterUnit) {
    KoreanLetterUnitNone         = 0,
    KoreanLetterUnitChosung      = 1 << 0,
    KoreanLetterUnitJungsung     = 1 << 1,
    KoreanLetterUnitJongsung     = 1 << 2
};

@interface KoreanUtils : NSObject

+ (NSString *)breakUp:(NSString *)text units:(KoreanLetterUnit)units;

@end