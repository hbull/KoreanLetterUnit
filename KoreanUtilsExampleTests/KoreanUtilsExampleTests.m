//
//  KoreanUtilsExampleTests.m
//  KoreanUtilsExampleTests
//
//  Created by donghyun on 2/11/15.
//  Copyright (c) 2015 donghyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "KoreanUtils.h"
@interface KoreanUtilsExampleTests : XCTestCase

@end

@implementation KoreanUtilsExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testbreakUp
{
    NSString *name = @"황동희";
    NSString *none = [KoreanUtils breakUp:name units:KoreanLetterUnitNone];
    XCTAssertTrue([none isEqualToString:@""]);
    
    NSString *chosung = [KoreanUtils breakUp:name units:KoreanLetterUnitChosung];
    XCTAssertTrue([chosung isEqualToString:@"ㅎㄷㅎ"]);
    
    NSString *jungsung = [KoreanUtils breakUp:name units:KoreanLetterUnitJungsung];
    XCTAssertTrue([jungsung isEqualToString:@"ㅘㅗㅢ"]);
    
    NSString *chosungAndJungsung = [KoreanUtils breakUp:name units:KoreanLetterUnitJungsung|KoreanLetterUnitChosung];
    XCTAssertTrue([chosungAndJungsung isEqualToString:@"ㅎㅘㄷㅗㅎㅢ"]);
    
    NSString *jongsung = [KoreanUtils breakUp:name units:KoreanLetterUnitJongsung];
    XCTAssertTrue([jongsung isEqualToString:@"ㅇㅇ"]);
    
    NSString *all = [KoreanUtils breakUp:name units:KoreanLetterUnitChosung | KoreanLetterUnitJongsung | KoreanLetterUnitJungsung];
    XCTAssertTrue([all isEqualToString:@"ㅎㅘㅇㄷㅗㅇㅎㅢ"]);
}

@end
