[![Platform](https://img.shields.io/cocoapods/p/NSMutableNumber.svg?style=flat)](http://cocoapods.org/pods/NSMutableNumber)
[![Version](https://img.shields.io/cocoapods/v/NSMutableNumber.svg?style=flat)](http://cocoapods.org/pods/NSMutableNumber)
[![License](https://img.shields.io/cocoapods/l/NSMutableNumber.svg?style=flat)](http://cocoapods.org/pods/NSMutableNumber)
[![Build Status](https://travis-ci.org/OlehKulykov/NSMutableNumber.svg?branch=master)](https://travis-ci.org/OlehKulykov/NSMutableNumber)
[![OnlineDocumentation Status](https://img.shields.io/badge/online%20documentation-generated-brightgreen.svg)](http://cocoadocs.org/docsets/NSMutableNumber)


# NSMutableNumber 1.2.3 (August 2025)
NSMutableNumber - full thread safe mutable NSNumber implementation with NSNumber extensions.


### Installation with CocoaPods
#### Podfile
```ruby
pod 'NSMutableNumber'
```

### Features
- This class inherits all **NSNumber** protocols and overrides required methods for duplicate **NSNumber** read functionality.
```objc
	NSNumber * number = (NSNumber *)[[NSMutableNumber alloc] initWithInt:0];
	// use actual number NSMutableNumber class as NSNumber, of course read only
```
- All getters are thread safe. Can be used for cross-thread synchronization. Used recursive mutex for get/set values.
- Same hash method as on **NSNumber** object - required for using as key with key/value coding classes.
- Detected as kind of **NSNumber** or **NSValue** class.
```objc
	NSMutableNumber * mutableNumber = [[NSMutableNumber alloc] init];
	[mutableNumber isKindOfClass:[NSValue class]]; // YES, is kind of class
	[mutableNumber isKindOfClass:[NSNumber class]]; // YES, is kind of class
	[mutableNumber isKindOfClass:[NSMutableNumber class]]; // YES, is kind of class
```
- Can be compared with self(eg. **NSMutableNumber**) or **NSNumber** class.
 Comparation checks both numbers for real, signed and unsigned value and selects required method for comparing between values.
```objc
	[[NSMutableNumber numberWithBool:NO] isEqual:[NSNumber numberWithBool:NO]]; // YES, equal
	[[NSMutableNumber numberWithBool:YES] isEqual:[NSNumber numberWithFloat:1]]; // YES, equal
	[[NSMutableNumber numberWithDouble:DBL_MAX] isEqual:[NSNumber numberWithDouble:DBL_MAX]]; // YES, equal
	[[NSMutableNumber numberWithChar:CHAR_MIN] isEqual:[NSNumber numberWithInteger:CHAR_MIN]]; // YES, equal
	[[NSMutableNumber numberWithUnsignedShort:USHRT_MAX] isEqual:[NSNumber numberWithInt:USHRT_MAX]]; // YES, equal
```
- Works with maximum and minimum type value ranges.
```objc
	[[NSMutableNumber numberWithInt:INT_MIN] isEqual:[NSNumber numberWithInt:INT_MIN]]; // YES, equal
	[[NSMutableNumber numberWithInteger:NSIntegerMin] isEqual:[NSNumber numberWithInteger:NSIntegerMin]]; // YES, equal
	[[NSMutableNumber numberWithUnsignedInteger:NSUIntegerMax] isEqual:[NSNumber numberWithUnsignedInteger:NSUIntegerMax]]; // YES, equal
	[[NSMutableNumber numberWithUnsignedLongLong:ULONG_LONG_MAX] isEqual:[NSNumber numberWithUnsignedLongLong:ULONG_LONG_MAX]]; // YES, equal
```
- "compare:" compatible with **NSNumber**, including special cases like NAN and -0.0.
- Internal logic implemented with C++. Same performance as standard **NSNumber** (see time tests) and minimum amount of memory for storing values(used union's).
- **NSNumber** can be compared with this class via additional number comparator method **isEqualToNumber:**
- Category of the **NSNumber** with method **mutableCopy** which return **NSMutableNumber** class.
- Adds NSMutableCopying to NSNumber for converting a NSNumber to a NSMutableNumber. 
- Class numbers zero, negativeZero, one, notANumber, infinity, and minusInfinity for NSNumber and NSMutableNumber.
- isNegativeOne, isZero, isPositiveZero, isNegativeZero, isOne, isTwo, isThree, isFour, isFive, isNotANumber, isInfinity, and isNegativeInfinity properties to NSNumber and NSMutableNumber.
- "unicharValue" as a unit type for NSNumber and NSMutableNumber, and associated init and class methods.
- bitNot property in NSNumber and NSMutableNumber for a bitwise NOT on the bits (of an integer).
- bitNotValue property in NSNumber and NSMutableNumber for a bitwise NOT on the bits (of an integer); returns an unsigned long long.
- plusOne and subtractOne property in NSNumber or NSMutableNumber for incrementing or decrementing.
- addOne and minusOne within NSMutableNumber for incrementing or decrementing.
- Enables support for NSSecureCoding and backward compatible with non-keyed coding (on older OS versions)
- Lots of unit tests to ensure proper functionality.

# License
---------

The MIT License (MIT)

Copyright (c) 2015 - 2016 Kulykov Oleh <info@resident.name>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
