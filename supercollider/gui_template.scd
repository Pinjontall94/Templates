(
Window.closeAll;
w = Window("gui", Rect(850, 50, 400, 400))
.front
.alwaysOnTop_(True);

w.view.decorator_(FlowLayout(w.bounds, Point(15,15), 7@7));
)

(
// Remove & Reset GUI elements
w.view.children.collect(_.remove);
w.view.decorator.reset;
)

//64.do{Knob(w, 40@40)};
//w.view.children[0].value_(rrand(0.0,1.0));  // reference single element

k = Array.fill(64, {Knob(w,40@40)});
k[0].value_(rrand(0.0,1.0));