//
//  HDStringHandle.m
//  HDFrameCoreShow
//
//  Created by apple on 2017/12/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HDStringHandle.h"
#import "NSString+Handle.h"

@implementation HDStringHandle
{
    unichar * _chars;
    NSInteger _length;
    NSInteger _maxLength;
    
    
    // _maxlength 最少都比+length大1
}
-(instancetype)init{
    if (self = [super init]) {
       
        _chars = (unichar *) malloc(sizeof(unichar) * 16);
        _length = 0;
        _maxLength = 16;
    }
    return self;
}

-(void)setString:(NSString *)string{
     _length = string.length;
    if (_maxLength < string.length + 1) {
        _maxLength = [self doubleInt:_maxLength MoreThan:string.length + 1];

        free(_chars);
        _chars = (unichar *) malloc(sizeof(unichar) * _maxLength);
        
        
        [string toUTF8_Chars:_chars];
        
    }else{
        for (NSInteger index = 0; index < string.length; index += 1) {
            _chars[index] = [string characterAtIndex:index];
        }
        _chars[string.length] = 0;
        
    }

    
   
}

-(NSInteger) doubleInt:(NSInteger)one MoreThan:(NSInteger) two{
    
    while (one < two) {
        one *= 2;
    }
    return one;
}

-(NSString *)getString{
    if(_chars != nil){
        return [NSString stringWithCharacters:_chars length:_length];
    }
    return nil;
}

-(NSString *)stringWithIndex:(NSInteger)index{
    if (index >=_length) {
        return nil;
    }
    return [NSString stringWithUTF8Chars:_chars index:index];
}
-(void)setLength:(NSInteger)length{
    if (length <= _maxLength) {
        return;
    }
    unichar * chars = _chars;
    
    
    _chars = (unichar *) malloc(sizeof(unichar) * length);
    

    NSInteger index;
    for (index = 0; index < _length; index += 1) {
        _chars[index] = chars[index];
    }
    _chars[_length] = 0;
 
    _maxLength = length;
    free(chars);
}
-(BOOL)setChar:(NSString *)oneChar index:(NSInteger)index{
    if (oneChar != nil && ![oneChar isEqualToString:@""] && index < _length) {
       _chars[index] = [oneChar characterAtIndex:0];
        return true;
    }
    return false;
}

-(void)addString:(NSString *)string{
    if (_length + string.length < _maxLength) {
        for (NSInteger index = 0; index < string.length; index += 1) {
            _chars[index + _length] = [string characterAtIndex:index];
        }
        _chars[string.length + _length] = 0;
        
    }else{
        _maxLength = [self doubleInt:_maxLength MoreThan:string.length + _length + 1];
        
        unichar * chars = _chars;
        
        _chars = (unichar *) malloc(sizeof(unichar) * _maxLength);
    
        for (NSInteger index = 0; index < _length; index += 1) {
            _chars[index] = chars[index];
        }
        for (NSInteger index = 0; index < string.length; index += 1) {
            _chars[index + _length] = [string characterAtIndex:index];
        }
        free(chars);
    }
    _length = string.length + _length;
    
    
}
-(void)dealloc{
    free(_chars);
}
@end
