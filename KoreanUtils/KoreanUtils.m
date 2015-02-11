//
//  KoreanLetterUnit.m
//  KoreanLetterUnit
//
//  Created by donghyun on 2/11/15.
//  Copyright (c) 2015 donghyun. All rights reserved.
//

#import "KoreanUtils.h"

#define HANGUL_START_CODE   0xAC00
#define HANGUL_END_CODE     0xD79F

NSString *chosung[19] = {
    @"ㄱ",@"ㄲ",@"ㄴ",@"ㄷ",@"ㄸ",@"ㄹ",@"ㅁ",
    @"ㅂ",@"ㅃ",@"ㅅ",@"ㅆ",@"ㅇ",@"ㅈ",@"ㅉ",
    @"ㅊ",@"ㅋ",@"ㅌ",@"ㅍ",@"ㅎ"};

NSString *jungsung[21] = {
    @"ㅏ",@"ㅐ",@"ㅑ",@"ㅒ",@"ㅓ",@"ㅔ",
    @"ㅕ",@"ㅖ",@"ㅗ",@"ㅘ",@"ㅙ",@"ㅚ",
    @"ㅛ",@"ㅜ",@"ㅝ",@"ㅞ",@"ㅟ",@"ㅠ",
    @"ㅡ",@"ㅢ",@"ㅣ"
};

NSString *jongsung[28] = {
    @"",  @"ㄱ",@"ㄲ",@"ㄳ",@"ㄴ",@"ㄵ",@"ㄶ",
    @"ㄷ",@"ㄹ",@"ㄺ",@"ㄻ",@"ㄼ",@"ㄽ",@"ㄾ",
    @"ㄿ",@"ㅀ",@"ㅁ",@"ㅂ",@"ㅄ",@"ㅅ",@"ㅆ",
    @"ㅇ",@"ㅈ",@"ㅊ",@"ㅋ",@" ㅌ",@"ㅍ",@"ㅎ"
};

@implementation KoreanUtils

+ (NSString *)breakUp:(NSString *)text units:(KoreanLetterUnit)units
{
    NSMutableString *result = [NSMutableString string];
    int length = (int)text.length;
    int chosungStartIndex = 28 * 21;
    
    for (NSUInteger i = 0; i < length; i++) {
        unichar unicodeChar = [text characterAtIndex:i];
        
        // 한글인지 검색
        if ( HANGUL_START_CODE <= unicodeChar && unicodeChar <= HANGUL_END_CODE )
        {
            if(units & KoreanLetterUnitChosung)
            {
                NSInteger chosungIndex  = (NSInteger)((unicodeChar - HANGUL_START_CODE) / chosungStartIndex);
                [result appendFormat:@"%@", chosung[chosungIndex]];
            }
            
            if(units & KoreanLetterUnitJungsung)
            {
                NSInteger jungsungIndex = (NSInteger)((unicodeChar - HANGUL_START_CODE) % (28 * 21) / 28);
                [result appendFormat:@"%@", jungsung[jungsungIndex]];
            }
            
            if(units & KoreanLetterUnitJongsung)
            {
                NSInteger jongsungIndex = (NSInteger)((unicodeChar - HANGUL_START_CODE) % 28);
                [result appendFormat:@"%@", jongsung[jongsungIndex]];
            }
        }else{
            [result appendFormat:@"%@", [NSString stringWithFormat:@"%C", unicodeChar]];
        }
    }
    return result;
}
@end