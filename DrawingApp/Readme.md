# Creative Portion

An option to change the opacity of new shapes was added to the app. By changing the slider, the label will display the current opacity and both the solid and outline shapes will be drawn with the set opacity when the user clicks on the screen in the "Draw" functionality.
A slider and label objects were required to be added to the View and outlets to them added to the ViewController. The slider also requires an IBAction connected to the ViewController. An alpha attribute or property was added and instantiated in the Shape class for all objects to inherit. The draw functions for both SolidShape and OutlineShape were changed using Apple Developer Documentation to add parameters to fill() and stroke() respectively.
This feature adds allows users to be more creative and expands the functionality of the app. The drawing can become more complex with overlapping shapes that have different opacities and the user can experiment with what the color of the overlapped areas result in.

# Extra Credit

There are two additional options for what type of shape to draw, a solid shape or an outline of a shape. Both are subclasses of the Shape class and SolidShape objects have Rectangle, Circle, Triangle subclasses while OutlineShape objects have OutlineRectangle, OutlineCircle, and OutlineTriangle subclasses.

# Design Choices

The default color is the blue color of the middle circle.

The default shape is a rectangle.

The default action is to draw.

The default fill is a solid shape and the default opacity is 1 (completely opaque).

The default sizes of shapes allow the user to scale and rotate by clicking within the shape twice (it could, however require the clicks to be at the very opposite edges of the shape).

To change the sizes of the shapes or rotate them, the user must be in "Move". 
To scale or rotate a shape, the user should ctrl + click on a shape then click on the shape again and drag to the desired size or drag to rotate to the desired position. 
If the shapes are small, the user can ctrl+click(inside the shape)+drag(to outside the shape) in order to be able to click again inside the shape and allow the gestureRecognizers to register enough spacing between the two actions.

