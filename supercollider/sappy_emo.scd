// C-c C-p b to BOOT
// C-c C-p q to QUIT
// C-c C-s to STOP
(
//sappy emo electronica example...
//TempoClock(120/60); // 120 bpm
SynthDef("patternefx_Ex", { arg out, in;
    var audio, efx;
    audio = In.ar([20,21],2);
    efx=CombN.ar(audio, 0.5, [0.24,0.4], 2, 1);
    Out.ar([0,1], audio+efx);
    }).add;

Synth.new("patternefx_Ex");

SynthDef("pattern_Ex", { arg out, freq = 1000, gate = 1, pan = 0, cut = 4000, rez = 0.8, amp = 1;
    Out.ar(out,
        Pan2.ar(
            RLPF.ar(
                Pulse.ar(freq,0.05),
            cut, rez),
        pan) * EnvGen.kr(Env.linen(0.01, 1, 0.3), gate, amp, doneAction: Done.freeSelf);
    )
    }).add;

SynthDef("bass_Ex", { arg out, freq = 1000, gate = 1, pan = 0, cut = 4000, rez = 0.8, amp = 1;
    Out.ar(out,
        Pan2.ar(
            RLPF.ar(
                SinOsc.ar(freq,0.05),
            cut, rez),
        pan) * EnvGen.kr(Env.linen(0.01, 1, 0.3), gate, amp, doneAction: Done.freeSelf);
    )
    }).add;

//SynthDescLib.global.read;


Pseq([

Ptpar([
0,Pbind(\instrument,\pattern_Ex, \out, 20, \dur,Pseq([2],16), \root,[-24,-17], \degree,Pseq([0,3,5,7,9,11,5,1],2),     \pan,1,\cut,Pxrand([1000,500,2000,300],16), \rez,Pfunc({0.7.rand +0.3}), \amp,0.12),

0.5,Pbind(\instrument,\pattern_Ex, \out, 20, \dur,Pseq([Pseq([2],15),1.5],1), \root,-12, \degree,Pseq([0,3,5,7,9,11,5,1],2), \pan,-1,\cut,2000, \rez,0.6, \amp,0.1);
]),

Ptpar([
0,Pbind(\instrument,\pattern_Ex, \out, 20, \dur,2, \root,[-24,-17], \degree,Pseq([0,3,5,7,9,11,5,1],inf),     \pan,1,\cut,Pxrand([1000,500,2000,300],inf), \rez,Pfunc({0.7.rand +0.3}), \amp,0.12),

0,Pbind(\instrument,\bass_Ex, \dur,1, \root,-24, \degree,Pseq([0],inf), \pan,0, \cut,128, \rez,0.1, \amp,0.3),

0.5,Pbind(\instrument,\pattern_Ex, \out, 20, \dur,2, \root,-12, \degree,Pseq([0,3,5,7,9,11,5,1],inf), \pan,-1,\cut,2000, \rez,0.6, \amp,0.1);
]);


]).play;

)
