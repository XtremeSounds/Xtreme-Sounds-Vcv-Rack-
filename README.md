# Xtreme Sounds for VCV Rack 2

**S8 Quantizer + Fire Host** · Free/open-source plugin · **Plugin slug:** `XtremeSounds`

Xtreme Sounds is a collection of two modules for VCV Rack 2:

- **S8 Quantizer:** polyphonic pitch quantization, eight musical patterns, clocked pattern switching, and optional harmony suggestions.
- **Fire Host:** a MIDI interface for the Akai Fire / FL Studio Fire hardware controller, with polyphonic note outputs, 20 assignable CV outputs, pad-light feedback, and OLED status.

Both modules are installed in the same plugin and appear under **Xtreme Sounds** in the Rack module browser. This README is the user manual for both modules.

## Installation and compatibility

1. Install the Xtreme Sounds `.vcvplugin` package using VCV Rack's plugin installation procedure. Restart Rack if prompted.
2. In the module browser, search for **Xtreme Sounds**, **S8**, or **Fire Host**.
3. Right-click either module to select its **Light**, **Silver**, **Smoke**, or **Dark** panel theme. The choice is saved with the patch.

S8 works without external hardware. Fire Host requires a connected **Akai Fire** with accessible MIDI input *and* output ports. The included GitHub Actions workflow builds a Windows x64 VCV Rack 2 plugin; other operating systems require corresponding builds.

## S8 Quantizer

S8 is a **6 HP polyphonic 1 V/oct pitch quantizer**. It converts incoming pitch CV to the nearest note in the selected scale, independently for each input channel, and preserves the polyphonic channel count.

### Quick start

1. Connect a sequencer or other pitch-CV source to **V/OCT IN**.
2. Connect **V/OCT OUT** to an oscillator's 1 V/oct pitch input.
3. Set **PATTERN** to 1. Right-click S8 and choose the pattern's **Root** and **Scale**, such as C / Major.
4. Play your source. The output is quantized to the selected musical notes.
5. To change scales rhythmically, configure additional patterns, connect a trigger/clock to **CLOCK**, and choose how many patterns to cycle with **STEP LIMIT**.

### Controls and connections

| Control or jack | Function |
| --- | --- |
| **ROOT / SCALE** | Shows the active pattern's root note and scale. |
| **Eight pattern LEDs** | Indicate the active pattern. |
| **PATTERN** | Selects one of eight saved root/scale patterns. |
| **STEP LIMIT** | Sets the number of patterns (1–8) visited when clocking. Manual selection can still reach any pattern. |
| **OFFSET** | Transposes the quantized output by −12 to +12 semitones. |
| **CLOCK** | Advances to the next pattern on a trigger, wrapping at STEP LIMIT. |
| **RESET** | Returns to Pattern 1; RESET takes priority if it occurs with CLOCK. |
| **V/OCT IN / OUT** | Polyphonic 1 V/oct input and quantized output. |

**Example:** Set Pattern 1 to C Major and Pattern 2 to G Major, set STEP LIMIT to 2, and send pulses to CLOCK. The quantizer alternates between the two scales.

### Editing patterns and harmony

Right-click S8 to configure the active pattern's **Root** and **Scale**, or use the **Pattern bank 1–8** controls to edit another stored pattern. S8 includes major/minor and modal scales, pentatonics, blues, chromatic and symmetrical scales, and chord-note sets.

Pattern 1 acts as the **HOME** pattern for harmony suggestions:

- **Suggest next: Pattern N:** offers ranked root/scale suggestions for a following pattern. Select a suggestion to apply it.
- **Intelligently fill patterns 2–8:** generates a musical progression while preserving Pattern 1.
- **Auto-follow HOME:** when enabled, automatically regenerates following patterns as HOME or the harmony style changes. Disable it to edit those patterns independently.
- **Harmony style:** chooses **Safe / Diatonic**, **Modern**, **Jazz / Advanced**, **Ambient / Modal**, or **Adventurous**.

The pattern bank, harmony settings, offset, and theme are saved with the Rack patch.

## Fire Host

Fire Host connects the physical **Akai Fire / FL Studio Fire** to VCV Rack. The Fire's pads provide musical note input, while its encoders and buttons can generate control voltage for other Rack modules. The **OLED and colored pads are on the physical controller**, not on the Rack panel.

### Connect your Fire

1. Connect the Akai Fire to USB. Close any other application using its MIDI ports.
2. Add **Xtreme Sounds → Fire Host** to the Rack patch.
3. Fire Host attempts to pair the Fire's **MIDI input and output** automatically. Press **FIND** on the panel if you need to search again.
4. **LINK** indicates a recognized connection; **DATA** shows incoming MIDI activity.
5. Click the **MIDI DEVICE** heading if you need to inspect the selected input and output names.

On normal module removal or Rack shutdown, Fire Host attempts to blank the Fire OLED and LEDs before releasing MIDI output.

### Note outputs

| Output | Signal | Typical destination |
| --- | --- | --- |
| **V/OCT** | Polyphonic pitch, 1 V/oct | Oscillator pitch input |
| **GATE** | Polyphonic 0/10 V note gates | Envelope gate input |
| **VEL** | Polyphonic 0–10 V velocity | Dynamics or velocity input |
| **20 assignable outputs** | Continuous or button-derived 0–10 V CV | Parameter modulation inputs |

Fire Host supports up to **16 polyphonic note voices**. After a note releases, its gate drops while the corresponding pitch/velocity can remain latched for the voice's release tail.

### Pad layouts, scales, and colors

- **NOTE** switches between **Play** (scale layout) and **Piano** note layouts.
- **DRUM** selects the 64-pad chromatic drum layout.
- In Play mode, set **Root note** and **Scale** from the Fire Host right-click menu.
- When **Select** is **unassigned**, turning the Select encoder cycles the root note.
- When **G-L** or **G-R** is **unassigned**, those buttons cycle to the previous or next scale.
- If any of these controls is assigned to a CV output, its assignment takes priority and scale navigation does not occur. To restore navigation, open its corresponding CV assignment menu and choose **Unassigned**.

The Fire OLED normally displays the active root and scale. Root pads are brighter than the other scale notes. Right-click **Root notes white** to display root pads in white, while the other notes use the selected pad color.

The right-click **Pad color** menu offers 16 colors: Red, Orange, Amber, Yellow, Lime, Green, Mint, Cyan, Sky, Blue, Indigo, Purple, Magenta, Pink, White, and Ice. **Pad velocity response** offers **Soft**, **Medium**, **Firm**, and **Raw**.

### Assign the Fire's encoders and buttons to CV

The five rows beneath **ASSIGNABLE OUTS** contain **20 CV outputs**. Each output can be mapped independently.

1. **Click the label above a CV output** or **right-click its jack**.
2. Choose a Fire source (for example, Volume, Pan, Filter, Resonance, Select, a button, or **Unassigned**).
3. If you assign an **encoder**, turn it on the Fire to change the output continuously from 0 to 10 V.
4. If you assign a **button**, choose its **Button behavior**: **Momentary gate**, **Toggle**, or **10 ms trigger**.
5. Connect the output to any compatible Rack CV input and set the receiving module's CV amount as needed.

You can assign the same hardware source to more than one CV output. The module menu offers **Restore default assignments** and **Clear all assignments**.

**OLED feedback:** Turning an assigned encoder shows its current 0–100% level and a white progress bar. An assigned button shows its press/release level (100%/0%) on the same display. After a brief interval, the OLED returns to the root/scale readout.

### Fire Host right-click menu

- **Panel theme:** Light / Silver / Smoke / Dark.
- **Pad velocity response:** Soft / Medium / Firm / Raw.
- **Pad color:** 16 choices.
- **Root notes white:** on/off.
- **Play scale → Root note / Scale:** selects the musical pad layout.
- **Akai Fire:** displays MIDI input/output names.
- **Assignable outputs:** restore or clear assignments.

For manual reconnection, use the panel's **FIND** button; there is no separate reconnect or refresh-pads menu command.

## Troubleshooting

| Symptom | Check |
| --- | --- |
| **S8 does not produce the expected notes** | Verify V/OCT IN and OUT connections, active Root/Scale, and OFFSET. |
| **S8 moves through patterns unexpectedly** | Check CLOCK/RESET pulses, STEP LIMIT, and Auto-follow HOME. |
| **Fire LINK is off** | Confirm the USB connection and both MIDI ports, close other software using the Fire, then press FIND. |
| **Fire pads make no sound** | Patch V/OCT and GATE to a synth voice and envelope. Confirm the controller's mode and MIDI connection. |
| **Select or G-L/G-R does not navigate root/scale** | That control may be assigned to a CV jack. Choose Unassigned to restore navigation. |
| **Assignable CV is not responding** | Check the source assigned to the jack and, for buttons, its behavior setting. |
| **Fire OLED does not show the progress bar** | Verify that MIDI output is paired and that the encoder/button has an active assignment. |
| **Modules do not appear in Rack** | Confirm the plugin is installed for Rack 2 and inspect Rack's `log.txt` for loading errors. |

## Build from source

Use the official VCV Rack 2 SDK and a compatible build toolchain:

```sh
make RACK_DIR=/path/to/Rack-SDK
make RACK_DIR=/path/to/Rack-SDK dist
```

`make dist` packages the plugin in `dist/`. The included GitHub Actions workflow builds a Windows x64 `.vcvplugin` against Rack SDK 2.6.6. No JUCE or CMake build is required.

The plugin slug is **`XtremeSounds`**, and the module slugs are **`S8`** and **`FireHost`**. These identities must remain stable for patch compatibility.

## License and acknowledgments

Copyright © 2026 **Chris DuPont / Xtreme Sounds**.

The Xtreme Sounds source code and plugin are distributed under **GNU GPL version 3 or later (`GPL-3.0-or-later`)**. The complete license is provided in the repository's **[`LICENSE.txt`](LICENSE.txt)**. That file remains separate to preserve the standard, unmodified legal text.

Fire Host communicates using Akai Fire MIDI messages and publicly documented controller protocols. Research on open-source controller implementations, including **DrivenByMoss**, informed the interface; DrivenByMoss is not needed at runtime.

**Independence and trademarks:** Xtreme Sounds is independently developed for VCV Rack and is not affiliated with or endorsed by VCV, Akai Professional, or Image-Line. VCV Rack, Akai, Fire, FL Studio, and other third-party names are the property of their respective owners. External dependencies and the Rack SDK are governed by their respective licenses.
