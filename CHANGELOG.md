# Changelog

All notable changes to the project will be documented in this file.

---

## Next

#### API breaking changes

N/A

#### Enhancements

N/A

#### Bugfixes

- Fix rounding when calculated font size has long decimals therefore rendering results with cutting off the last line (probably due to rounding up in UILabel rendering)

## [3.0.0](https://github.com/tbaranes/FittableFontLabel/releases/tag/3.0.0) (18-09-2018)

#### API breaking changes

- Swift 4.2 and Xcode 10 support

#### Enhancements

- Swift 4 and Xcode 9 support

## [2.0.0](https://github.com/tbaranes/FittableFontLabel/releases/tag/2.0.0) (10-11-2017)


#### Enhancements

- Swift 4 and Xcode 9 support

## [1.4.0](https://github.com/tbaranes/FittableFontLabel/releases/tag/1.4.0) (11-09-2016)

#### API breaking changes

- Swift 3 compatibility

#### Bugfixes

- Improved issue with long strings in small labels getting truncated

## [1.3.0](https://github.com/tbaranes/FittableFontLabel/releases/tag/1.3.0) (15/08/2016)

#### Enhancements

- Improving performance by using binary search instead of simple loop. That may prevent xcode freezing 

#### Bugfixes

- Fixed `fontSizeThatFits` when used with empty strings

## [1.2.0](https://github.com/tbaranes/FittableFontLabel/releases/tag/1.2.0) (01/08/2016)
 
#### Enhancements

- Improving default value of `fontSizeToFit` in `UILabelExtension`. Default value is now explicitly 100
- Added `fontSizeThatFits` method in `UILabelExtension` that returns a font size of the given text which can just fit the given `CGSize`.

## [1.1.0](https://github.com/tbaranes/FittableFontLabel/releases/tag/1.1.0) (25/04/2016)

#### API breaking changes

N/A
 
#### Enhancements

- `FittableFontLabel` now support `topInset`, `leftInset`, `bottomInset`, `rightInset`

#### Bugfixes

- Fixed interface builder freeze

## [1.0.1](https://github.com/tbaranes/FittableFontLabel/releases/tag/1.0.1) (29/03/2016)

#### Enhancements

- Renaming the extension class

#### Bugfixes

- Fixed inspectable attributes for `FittableFontLabel`

## [1.0.0](https://github.com/tbaranes/FittableFontLabel/releases/tag/1.0.0) (27/03/2016)

First version
