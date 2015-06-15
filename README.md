# AutoLayoutDemo
AutoLayout的基本使用，包括NSLayoutConstraint创建一个约束，VFL（Visual format language　）创建一组约束以及使用Autolayout实现UITableView的Cell动态布局和高度动态改变

####NSLayoutConstraint创建一个约束
参考链接：[   http://www.mgenware.com/blog/?p=490](   http://www.mgenware.com/blog/?p=490)

ConstraintViewController类是这个内容演示类，主要通过NSLayoutConstraint来约束两个不同View之间的关系。

 NSLayoutConstraint *constraint = [NSLayoutConstraint
 constraintWithItem:
 attribute:
 relatedBy:
 toItem:
 attribute:
 multiplier:
 constant:];
 
 创建一个约束，参数说明:
 
 第一个参数:指定约束左边的视图view1
 
 第二个参数:指定view1的属性attr1，具体见上面的 NSLayoutAttribute。
 
 第三个参数:指定左右两边的视图的关系relation，具体见上面的 NSLayoutRelation。
 
 第四个参数:指定约束右边的视图view2
 
 第五个参数:指定view2的属性attr2，具体见上面的 NSLayoutAttribute。
 
 第六个参数:指定一个与view2属性相乘的乘数multiplier
 
 第七个参数:指定一个与view2属性相加的浮点数constant
 

这个函数的对照公式为: view1.attr1 = view2.attr2 * multiplier + constant

如果你想设置的约束里不需要第二个view，要将第四个参数设为nil，第五个参数设为NSLayoutAttributeNotAnAttribute

上面关于NSLayoutConstraint说明的参考链接：
[http://rainbownight.blog.51cto.com/1336585/1316181](http://rainbownight.blog.51cto.com/1336585/1316181)



####VFL创建一组约束
参考链接：[ 使用Auto Layout中的VFL(Visual format language)——代码实现自动布局]( http://www.cnblogs.com/wupei/p/4150626.html)
可以使用可视化格式化语言Visual Format Language来创建一组约束

使用VFL创建一组约束，参数说明:

 第一个参数：使用VFL格式化的字符串，具体语法参考下面的官方链接
 
 第二个参数：指定VFL中所有对象的布局属性和方向。比如2个视图使用V布局，可以使用 NSLayoutFormatAlignAllLeft 让他们对齐
 
 第三个参数：度量、指标的字典，字典里面的key可以写在第一个参数中。编译器解析时，自动替换为metrics字典中的value
 
 第四个参数：指定约束的一个或多个视图
 
 NSArray *constrtArr = [NSLayoutConstraint
 constraintsWithVisualFormat:
 options:
 metrics:
 views:];

可视化格式化语言Visual Format Language

[Visual Format Language官方文档](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage/VisualFormatLanguage.html#//apple_ref/doc/uid/TP40010853-CH3-SW1)


 语法总结：
 
 1、"H" 表示水平方向，"V" 表示垂直方向
 
 2、"|" 表示superview的边界
 
 3、"[]" 表示view，"()"表示尺寸数，可以多个条件组合，中间使用逗号分隔，如 view(>=70,<=100)
 
 4、"＠" 表示优先级。如V:|-50@750-[view(55)]，或者写到metrics里面更好


上面的说明参考链接：[https://github.com/jaywhj/AutoLayout](https://github.com/jaywhj/AutoLayout)


####使用Autolayout实现UITableView的Cell动态布局和高度动态改变
参考链接：[ IOS 6.0+ Autolayout — UITableViewCell 高度调整](http://my.oschina.net/carson6931/blog/363234)

效果可以参考下图，


![AutoLayoutDemo](http://7u2k5i.com1.z0.glb.clouddn.com/github_autolayoutdemo1.png?imageMogr2/thumbnail/!50p) 

