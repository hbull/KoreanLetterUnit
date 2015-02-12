# KoreanLetterUnit
한글 문자열에 관련된 유틸리티 함수

제공 기능

* 한글 초성, 중성, 종성 분리

초성 변환 사용 예제
---------
```objc
[KoreanUtils breakUp:@"황동희" units:KoreanLetterUnitNone]; // ""
[KoreanUtils breakUp:@"황동희" units:KoreanLetterUnitChosung];   // "ㅎㄷㅎ"
[KoreanUtils breakUp:@"황동희" units:KoreanLetterUnitJungsung|KoreanLetterUnitChosung];  // "ㅎㅘㄷㅗㅎㅢ
[KoreanUtils breakUp:@"황동희" units:KoreanLetterUnitChosung | KoreanLetterUnitJongsung | KoreanLetterUnitJungsung]; // "ㅎㅘㅇㄷㅗㅇㅎㅢ
```

```swift
KoreanUtils.breakUp("황동희", units: KoreanLetterUnit.Chosung) // "ㅎㄷㅎ"
KoreanUtils.breakUp("황동희", units: KoreanLetterUnit.Chosung | KoreanLetterUnit.Jungsung) // "ㅎㅘㄷㅗㅎㅢ
KoreanUtils.breakUp("황동희", units: KoreanLetterUnit.Chosung | KoreanLetterUnit.Jongsung | KoreanLetterUnit.Jongsung) // "ㅎㅘㅇㄷㅗㅇㅎㅢ
```
