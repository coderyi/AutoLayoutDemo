//
//  Header.h
//  AutoLayoutDemo
//
//  Created by coderyi on 15/6/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#ifndef AutoLayoutDemo_Header_h
#define AutoLayoutDemo_Header_h
#define isIOS7GE    ([[UIDevice currentDevice].systemVersion floatValue] >= 7.f)
#define IPHONE_NAVIGATIONBAR_HEIGHT (isIOS7GE ? 64 : 44)
#define SCREEN_WIDTH         ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT        ([[UIScreen mainScreen] bounds].size.height)
#endif
