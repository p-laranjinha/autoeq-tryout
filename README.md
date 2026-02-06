# Another try

My last try with the normal AutoEq target didn't sound quite right either, felt like it removed
depth from the sound, maybe because it was because the EQ was so different from the headphones'
normal sound signature.

Anyways, I found [a link to a Reddit post on the head(amame) discord with an EQ](https://www.reddit.com/r/VectorFinesse/comments/14etgeh/comment/jv9jpos/)
that made the mids and highs sound a bit clearer without really changing the "depth".

This Reddit post didn't specify the quality values, so I just left them at the EasyEffects' default.

I also learned that the preamp is important and I shouldn't remove it just to keep the volume the
same.

[Here's the file with to the EQ (reddit.txt)](./reddit.txt) to put into an equalizer like EasyEffects.

I'm not sure I'll find much better than this, so if I want a better sound signature I'll have to do
[the Capra tuning of using velour ear pads and sticking a micropore tape on the driver.](https://github.com/CapraAudio/Headamame-Capra-Tuning/wiki)

# Wasn't very good

[EQing into the Capra tuning](#using-autoeq-to-try-out-a-different-headset) didn't sound very good, but I've found I enjoy the [Online AutoEq](https://www.autoeq.app)'s
"crinacle EARS + 711 Harman over-ear 2018" target with some small modifications, I changed the
5th filter from "-10.6 dB" to "-1.0 dB" (basically just increased bass an abritrary amount until it
felt good) and reset the preamp to 0dB so that it's around the same volume as no EQ, just in case I
decided to blow my ears out by forgetting to enable it.

[Here's the file with the original AutoEq's EQ (crinacle-harman.txt).](./crinacle-harman.txt)

[Here's the file with the modified EQ (crinacle-harman-mod.txt).](./crinacle-harman-mod.txt)

# Using autoeq to "try out" a different headset

I know this isn't accurate but I want to try EQing my Head(amame) into the one with Capra tuning,
to figure out if I should do the tuning to my set.

My version is the V2 Open Back with 40 mm BDNC (Precision) drivers.

[Github link to do the Capra tuning on Head(amame) devices.](https://github.com/CapraAudio/Headamame-Capra-Tuning/wiki)

[squig.link instance with measurements for Head(amame) and the Capra tuning.](https://capraaudio.squig.link/Headphones/?share=Headamame_V2_Open_40mm_BDNC_Solid_leather_pads,Headamame_V2_Open_40mm_BDNC_Capra_Tuned)

[The exported Capra tuning squig CSV (headamame-capra-tuning.csv).](./headamame-capra-tuning.csv)

[The exported default with solid leather pads squig CSV (headamame.csv).](./headamame.csv)

[Post explaining the command to use to turn a headset into another.](https://www.superbestaudiofriends.org/index.php?threads/simulating-other-headphones-with-autoeq.11991/#post-441660)

My version of the command:

```bash
python -m autoeq \
--parametric-eq \
--fs=48000 \
--bit-depth=32 \
--input-file="./headamame.csv" \
--target="./headamame-capra-tuning.csv" \
--output-dir="./out"
```

I'll then put the output of this command into an equalizer like EasyEffects.
