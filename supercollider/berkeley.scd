// == SERVER ==
s = Server.local; s.boot; // BOOT
s.quit;                   // QUIT (PANIC) C-c C-p q
s.recorder

// == SYNTHS ==
(
SynthDef(\decaySinEx, {|outBus = 0, effectBus, mix = 0.5, freq = 220|
    var src;
    src = Pan2.ar(Decay2.ar(Impulse.ar(Rand(0.3, 1), 0, 0.125), 0.3, 1,
        SinOsc.ar(SinOsc.kr(0.2, 0, 110, freq))), Rand(-1.0, 1.0));
    Out.ar(outBus, src * mix);
    Out.ar(effectBus, src * (1 - mix));
}).add;

SynthDef(\reverbEx, {|outBus = 0, inBus|
    var input;
    input = In.ar(inBus, 2);
    16.do({ input = AllpassC.ar(input, 0.04, Rand(0.001,0.04), 3)});
    Out.ar(outBus, input);
}).add;
)


// == SEQUENCER ==


// == RANDOM VOLTAGE ==


// == PULSER ==


// == MOD. OSC ==


// == COMPLEX OSC ==


// == DUAL LO PASS GATE ==


// == AUX IN ==


// == MIXER ==


// == REVERB ==




// == ROUTING ==
(
~sources = Group.new;
~effects = Group.after(~sources);     // make sure it's after
~bus = Bus.audio(s, 2);         // this will be our stereo effects bus
)


// == PERFORMANCE ==
(
x = Synth(\reverbEx, [\inBus, ~bus], ~effects);
y = Synth(\decaySinEx, [\effectBus, ~bus, \outBus, 0], ~sources);
z = Synth(\decaySinEx, [\effectBus, ~bus, \outBus, 0, \freq, 660], ~sources);
)

~sources.free; ~effects.free; // Turn off sources and effects
~bus.free;                    // Unplug the cables