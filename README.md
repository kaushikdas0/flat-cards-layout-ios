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
func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
        
        let pageWidth:Float = Float(self.view.frame.size.width - 40.0 + 10.0) // Your cell Width + Min Spacing for Lines

        let currentOffSet:Float = Float(scrollView.contentOffset.x)
        print(currentOffSet)
        let targetOffSet:Float = Float(targetContentOffset.pointee.x)

        print(targetOffSet)
        var newTargetOffset:Float = 0

        if(targetOffSet > currentOffSet) {
            newTargetOffset = ((currentOffSet / pageWidth).rounded(.up) * (pageWidth))
            print(ceilf(currentOffSet / pageWidth))
        } else if(targetOffSet < currentOffSet) {
            newTargetOffset = ((currentOffSet / pageWidth).rounded(.down) * (pageWidth))
            print(floorf(currentOffSet / pageWidth))
        } else {
            newTargetOffset = ((currentOffSet / pageWidth).rounded(.toNearestOrAwayFromZero) * (pageWidth))
        }

        if(newTargetOffset < 0){
            newTargetOffset = 0;
        }else if (newTargetOffset > Float(scrollView.contentSize.width)){
            newTargetOffset = Float(scrollView.contentSize.width)
        }

        targetContentOffset.pointee.x = CGFloat(currentOffSet)
        scrollView.setContentOffset(CGPoint(x: Int(newTargetOffset), y: 0), animated: true)

    }
```
Catch here though is the pageWidth calculation which should match to the viewcontroller image

Discuss about it here: http://classictutorials.com/2016/02/card-like-horizontal-scrolling-using-swift-2/
