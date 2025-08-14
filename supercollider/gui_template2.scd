(
Window.closeAll;
w = Window("Controller", Rect(0, 0, 400, 400))
.front
.alwaysOnTop_(True);

w.view.decorator_(FlowLayout(w.bounds, Point(15,15), 7@7));  //
)

(
// Remove & Reset GUI elements
w.view.children.collect(_.remove);
w.view.decorator.reset;
)
w.close;

(
c = Array.fill(32, {
	|view|
	view = CompositeView(w,40@80)
	.background_(Color.rand);

	view.decorator_(FlowLayout(view.bounds, 5@5, 5@5));
});
)


(
32.do{
	|i|
	Knob(c[i],30@30)
	.mode_(\vert)
	.action_({ |knb| knb.value.postln; });

	Button(c[i], 30@30)
        .states_([
            ["", Color.white, Color.white],
            ["", Color.white, Color.white],
        ])
        .action_({ |btn| btn.value.postln; });
};
)
c.collect(_.remove);
