(
Window.closeAll;
w = Window("Knob Grid", Rect(0, 0, 400, 400))
.front
.alwaysOnTop_(True);

w.view.decorator_(FlowLayout(w.bounds, 15@15, 7@7));
k = Array.fill(64, {Knob(w,40@40).mode_(\vert)});
)

(
// Remove & Reset GUI elements
w.view.children.collect(_.remove);
w.view.decorator.reset;
)


k[0].action_({ |knob| x.set(\freq, knob.value); });
k[1].action_({ |knob| x.set(\detune, knob.value); });
k[2].action_({ |knob| x.set(\pw, knob.value); });

SynthDef(\sqr, {
	|freq=200, detune=0, pw=0| var sig, env;
	sig = Pulse.ar(
		[freq, freq + (0.001 * detune)],
		0.5 + (pw * 0.5),
		0.2
	) * 0.5;
	Out.ar(0,sig)
}).add;

x = Synth(\sqr, [\freq, 400, \detune, 100]);
x.free;