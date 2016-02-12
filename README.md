# Cards layout with horizontal scrolling
Display a set of cards and user can swap horizontally to use it.

# Screencast 
![Screen cast](http://classictutorials.com/blog/wp-content/uploads/2016/02/gify.gif)

# How to use - Option 1
* Download the Swift Code folder on you Mac
* Open Cards_Layout.xcodeproj 
* Run it

# How to use - Option 2
* Suppose you already have a project
* Copy the ViewController, elements from Story board and supporting files
* Put it in your project and done.

# Specification
This sample is only for iphone. Can be extended for any IOS device.

#Secret Sauce
So if you see the code its pretty simple.
* We take a CollectionViewController
* Change its property to scroll horizontally.
* Remove the scroll bars
* Resize the cell to fill the screen
* Next to give the card swap like feature check the code in scrollViewWillEndDragging where i am recalculating the cell to display based on the amount of drag.

```
func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageWidth:Float = 310 + 25;
        
        let currentOffSet:Float = Float(scrollView.contentOffset.x)
        
        print(currentOffSet)
        let targetOffSet:Float = Float(targetContentOffset.memory.x)
        
        print(targetOffSet)
        var newTargetOffset:Float = 0
        
        if(targetOffSet > currentOffSet){
            newTargetOffset = ceilf(currentOffSet / pageWidth) * pageWidth
        }else{
            newTargetOffset = floorf(currentOffSet / pageWidth) * pageWidth
        }
        
        if(newTargetOffset < 0){
            newTargetOffset = 0;
        }else if (newTargetOffset > Float(scrollView.contentSize.width)){
            newTargetOffset = Float(scrollView.contentSize.width)
        }
        
        targetContentOffset.memory.x = CGFloat(currentOffSet)
        scrollView.setContentOffset(CGPointMake(CGFloat(newTargetOffset), 0), animated: true)
        
    }
```
Catch here though is the pageWidth calculation which should match to the viewcontroller image

Discuss about it here: http://classictutorials.com/2016/02/card-like-horizontal-scrolling-using-swift-2/
