## 标签视图(Swift)

[GitHub链接](https://github.com/Jonhory/JHTagViewSwift)`(https://github.com/Jonhory/JHTagViewSwift)`

### V1.0演示

![](http://ww1.sinaimg.cn/large/c6a1cfeagy1ff95yr3jtij209y0i9q3n.jpg)

* 等宽

![](http://ww1.sinaimg.cn/large/c6a1cfeagy1ff9606vfp1j20a90idt9c.jpg)

### 使用

* 将`JHTagView`文件夹拖入项目
* 创建`JHTagModel`,配置必要的属性`text`、`font`。配置标签样式,

```
    /// 快速配置样式
    ///
    /// - Parameters:
    ///   - cornerRadius: 圆角
    ///   - borderWidth: 边线宽
    ///   - normalBorderColor: 普通状态边线颜色
    ///   - normalTitleColor: 普通状态文字颜色
    ///   - normalBackgroundColor: 普通状态背景颜色
    ///   - selectTitleColor: 选中状态文字颜色
    ///   - selectBackgroundColor: 选中状态背景颜色
    public func config(cornerRadius: CGFloat, 
					    borderWidth: CGFloat, 
					    normalBorderColor: UIColor, 
					    normalTitleColor: UIColor, 
					    normalBackgroundColor: UIColor, 
					    selectTitleColor: UIColor, 
					    selectBackgroundColor: UIColor)    
```

* 创建`JHTagView`,

```
let f = CGRect(x: 0, y: 0, width: SCREEN.width - 100, height: 0)
tagView = JHTagView(frame: f)
```

配置必要的数据

```
    /// 快速配置
    ///
    /// - Parameters:
    ///   - maxWidth: 视图最大宽度
    ///   - horizontalMargin: 标签水平间距
    ///   - verticalMargin: 标签垂直间距
    public func config(maxWidth: CGFloat, 
					    horizontalMargin: CGFloat, 
					    verticalMargin: CGFloat) 

```

```
	// 1.计算高度
	let height = tagView?.getMaxHeightWith(models: tagModels)
	// 2.赋值
	tagView?.tagModels = tagModels
	// 3. 重置高度
	tagView?.frame = CGRect(x: 0, y: 0, width: SCREEN.width - 100, height: height!)
        
```

### 其他

* `OC`版本,[GitHub链接](https://github.com/Jonhory/JHTagView)`(https://github.com/Jonhory/JHTagView)`
* 如果在使用过程中遇到问题，或者想要与我分享／吐槽／建议／意见<jonhory@163.com>


