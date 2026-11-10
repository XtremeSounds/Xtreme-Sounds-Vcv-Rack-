# Xtreme Sounds — VCV Rack Modules

Free/open-source VCV Rack 2 modules by **Xtreme Sounds / Chris DuPont**.

This repository builds one VCV plugin package named **XtremeSounds** containing multiple modules. New free Xtreme Sounds modules can be added to this collection later without changing the existing module slugs.

## Included modules

### S8 Quantizer

A 6HP polyphonic V/Oct quantizer with eight root/scale patterns, clock sequencing, theory-ranked harmony suggestions, intelligent fill, Auto-follow HOME, and four panel themes.

Full manual: [S8 manual](#source-docss8md) (consolidated below).

### Fire Host

An Akai Fire controller interface for standalone Rack with polyphonic V/OCT/GATE/velocity outputs, Fire pad modes, 16 selectable RGB pad colors, root/scale play settings, relative encoders, and 20 assignable CV outputs.

Full manual: [FireHost manual](#source-docsfirehostmd) (consolidated below).

## Plugin identity

- Plugin slug: `XtremeSounds`
- Plugin name / brand: `Xtreme Sounds`
- Author: `Chris DuPont`
- Module slugs: `S8`, `FireHost`
- License: `GPL-3.0-or-later`

Do not rename the plugin slug or module slugs after release; Rack patches identify modules by plugin/module identity.

### Pre-release migration note

Earlier standalone development builds used plugin slugs `S8` and `FireHost`. The combined Library release uses plugin slug `XtremeSounds`. Patches saved with those standalone pre-release plugin identities will not automatically resolve to the combined collection; replace/re-add the module once and resave the patch. After the first VCV Library release, keep `XtremeSounds`, `S8`, and `FireHost` unchanged.

## Build

Normal Rack build:

```text
make
make dist
```

The included GitHub Actions workflow performs a Windows x64 validation build using the official Rack SDK 2.6.6 and the standard VCV Rack `make` / `make dist` process.

Push the contents of this folder to the repository root, then run **Actions > Build Xtreme Sounds VCV Plugin > Run workflow**.

Expected validation package:

```text
XtremeSounds-2.2.14-win-x64.vcvplugin
```

## VCV Library submission

This collection is open-source GPL-3.0-or-later. For an initial VCV Library submission, create exactly one issue in the VCVRack/library issue tracker with the title equal to the plugin slug:

```text
XtremeSounds
```

Post the public source repository URL. For later updates, increment `plugin.json` version, push the release commit, and post the new version and exact commit hash in the same plugin thread.


## License

Licensed under GPL-3.0-or-later. The complete, unmodified GNU GPL v3 license is supplied in `LICENSE.txt`. Copyright, trademark, and third-party protocol notices are consolidated below.

## GitHub build validation

The included `.github/workflows/build-vcv.yml` performs a VCV Rack 2 Windows x64 validation build using the official Rack SDK 2.6.6 and the standard `make` / `make dist` plugin build. The VCV Library maintainer builds accepted open-source plugins for supported platforms from the submitted source repository; this repository does not need four independent native GitHub runner builds for Library submission.

---

## Consolidated Project Reference
Module documentation, release history, copyright notices, and third-party information are consolidated here.


### Release history

## 2.2.14
- Consolidated non-license release notes into README and synchronized build packaging and preflight requirements. No code or resource changes.

## 2.2.13
- Tightened FireHost and S8 jack asset transparency to remove the remaining raised/halo circle around CV inputs and outputs.

## 2.2.12
- Fix `make dist` by removing previously consolidated `THIRD_PARTY_NOTICES.txt` and `docs` paths from `DISTRIBUTABLES`.
- Keep consolidated documentation in `README.md` and correct links to moved sections.
- Retain all S8 panel-edge fixes from 2.2.11.

## 2.2.11
- Removed stray pixels along the top and bottom edges of all four S8 panel themes.

## 2.2.10
- Standardized S8 and FireHost module title size and top-header positioning so both titles match more closely across the collection.

## 2.2.9
- FireHost: removed remaining halo/discoloration around FIND, LINK, and DATA UI elements by tightening transparency in those overlay assets.
- FireHost: removed incorrect raised/bright square artifacts around CV input/output jack overlays by tightening the shared jack asset transparency.
- Documentation cleanup: merged markdown/text reference docs outside `src/` and `res/` into `README.md`; removed redundant standalone docs not required by the build workflow.

## 2.2.7
- Removed the vertical divider line between the FireHost LINK and DATA indicators on all panel themes.

## 2.2.6
- Fixed FireHost auto-connect so both MIDI input and output must be paired; missing output now repairs automatically.
- Removed redundant right-click Find/Reconnect and Maintenance/Refresh Pads entries.
- Cleaned FireHost FIND, LINK, and DATA overlays on all panel themes so no rectangular or circular halo artifacts remain.
- Removed legacy artwork remnants around the FireHost controls and above the lower logo.

## 2.2.5
- Removed "Moss-style" wording from the FireHost scale menu; functionality is unchanged.

## 2.2.4
- Fixed FireHost reconnect regression caused by sending the hardware shutdown sequence during normal MIDI output re-pairing.
- Fire shutdown now runs only during true module/application teardown.
- Removed leftover logo-move artifact pixels above the Xtreme Sounds logo on all S8 and FireHost panel themes.

## 2.2.3
- Refined Fire OLED modulation-meter spacing to match the hardware display more closely without changing the established text size.
- Added more breathing room between the percentage text and the 0–100% progress bar, with slightly larger side margins.

## 2.2.1

## 2.2.2
- Sanity-check fix: blank Fire OLED, pads, and button LEDs before MIDI output disconnect, improving shutdown reliability when VCV tears down MIDI ports before module destruction.

- FireHost now blanks the OLED and turns off pad/button LEDs when the module is destroyed, including normal VCV Rack shutdown.

## 2.2.0

- FireHost: unassigned Select encoder now cycles root note.
- FireHost: unassigned Grid Left / Grid Right buttons cycle scales backward / forward.
- Assigned Select / Grid controls remain modulation-only and do not change root or scale.
- Root/scale changes immediately refresh pad LEDs and OLED feedback.

# 2.1.9

- Fire Host: OLED text enlarged by 75%; long scale names use compact display labels so the larger type still fits the 128x64 screen.
- Fire Host: assigned encoder turns now drive a live 0-100% white progress bar, and touching an assigned encoder shows its current amount.
- Fire Host: assigned buttons display 100% while pressed and 0% on release with the same progress bar.
- Fire Host: removed residual screw-edge halo/sliver artifacts and cleaned panel perimeter color artifacts.
- Fire Host: removed stray dark-theme marks above the Xtreme Sounds footer logo.

# 2.1.7

- Fixed malformed FireHost OLED source insertion that embedded literal `\n` sequences and broke the C++ class during compilation.
- Retains the 2.1.6 FireHost OLED, root-note white, screw, and shared logo updates.

# 2.1.6

- Fire Host: optional white root-note pads in Play mode.
- Fire Host: Akai Fire OLED now shows active root/scale and temporary assigned-encoder modulation strength feedback.
- Fire Host: corrected corner screw artwork so no panel-colored halo surrounds the screws.
- S8 / Fire Host: standardized the Xtreme Sounds footer logo to a lower, slightly smaller shared placement.

## 2.1.5

- FireHost: added saved right-click Pad Color selection with 16 RGB choices using the Fire pad SysEx protocol.
- FireHost: added saved Moss-style Root Note and Scale settings for Play mode; Piano and Drum64 mappings are unchanged.
- FireHost: Play-mode pad mapping now follows the selected root/scale and highlights root pads at full brightness.
- FireHost: resized XTREME SOUNDS branding using the exact S8 logo geometry at the same physical Rack size.
- FireHost: darkened Smoke and Dark panel substrates to match the S8 theme family more closely.
- S8: retained the no-ring shared knob asset from 2.1.4.

## 2.1.4

- S8: removed the bright outer silver ring from the shared knob asset so Dark and Smoke transition directly from black knob hardware to panel color.
- FireHost: note-off now lowers gate without clearing the latched pitch/velocity, preventing release tails from jumping to 0V and sounding like a retrigger.
- FireHost: poly output channel count remains stable for allocated voice slots after release, avoiding downstream voice reassignment during envelope tails.
- FireHost: resized XTREME SOUNDS panel branding to the same physical size as S8 across Light, Silver, Smoke, and Dark themes.

## 2.1.3

- Fixed FireHost C++11 enum assignments for PanelTheme so the merged VCV Rack plugin compiles without invalid int-to-enum conversions.

# 2.1.2

- Replaced the multi-runner CI with a focused VCV Rack 2 Windows x64 validation build using the official Rack SDK 2.6.6 and standard `make` / `make dist`.
- Kept the merged XtremeSounds plugin identity and S8/FireHost module identities unchanged.
- Added build-log artifact upload for failed VCV Rack validation runs.

# Changelog

## 2.1.0

- Initial combined **Xtreme Sounds** VCV Rack plugin collection.
- Merged S8 Quantizer 2.9.15 and Fire Host 2.2.4 into one plugin package.
- Preserved module slugs `S8` and `FireHost`.
- Namespaced module resources under `res/S8/` and `res/FireHost/`.
- Registered both modules from one `XtremeSounds` plugin entry point.
- Standardized the combined collection on GPL-3.0-or-later for open-source VCV Library submission.
- Added four-platform GitHub Actions packaging for Windows x64, Linux x64, macOS x64, and macOS ARM64.

Historical module-specific development before this combined collection is documented in the source releases from which this repository was assembled: S8 2.9.15 and Fire Host 2.2.4.

### Copyright and trademark notice

Xtreme Sounds VCV Rack Plugin Collection
Copyright (c) 2026 Chris DuPont / Xtreme Sounds.

This repository and the S8 and Fire Host source code included in this combined
plugin distribution are licensed under GNU GPL v3 or later. See LICENSE.txt.

The Xtreme Sounds plugin is independently developed for VCV Rack and is not
affiliated with or endorsed by VCV, Akai Professional, or Image-Line.
VCV Rack, Akai, Fire, FL Studio, and other names/trademarks belong to their
respective owners.

### Third-party and protocol notice

THIRD-PARTY / PROTOCOL NOTICE

Fire Host controller behavior was informed by publicly available Akai Fire
controller documentation, protocol research, and open-source controller
implementations including DrivenByMoss. Fire Host is a separate VCV Rack
implementation and does not require DrivenByMoss at runtime.

The combined Xtreme Sounds plugin is distributed under GPL-3.0-or-later.
VCV Rack itself and any system resources loaded from Rack remain subject to
their respective licenses.


### Source: `docs/FireHost.md`

# Fire Host

Fire Host connects an **Akai Fire / FL Studio Fire** controller to standalone VCV Rack. It translates pads, relative encoders, buttons, and mode controls into Rack polyphonic note outputs and assignable CV outputs.

## Hardware connection

1. Connect the Akai Fire by USB.
2. Close other applications that may already hold the Fire MIDI ports.
3. Add **Xtreme Sounds > Fire Host**.
4. Use **Find / reconnect Akai Fire** from the module menu when needed.
5. LINK indicates a recognized Fire connection; DATA shows MIDI activity.

## Pad outputs

- **V/OCT** — translated polyphonic pitch.
- **GATE** — polyphonic note gates.
- **VEL** — polyphonic velocity CV.

Fire pad IDs are translated through the physical 4x16 pad layout before musical output.

### Pad modes

- **NOTE** cycles Fire Host note layouts.
- **DRUM** selects the 64-pad drum layout.

### Velocity response

Right-click **Pad velocity response**: Soft, Medium, Firm, or Raw.

### Pad color

Right-click **Pad color** to choose one of 16 Fire RGB lighting colors: Red, Orange, Amber, Yellow, Lime, Green, Mint, Cyan, Sky, Blue, Indigo, Purple, Magenta, Pink, White, or Ice. The selected color is saved with the patch and sent to the Fire immediately. In Play mode root notes are shown brighter than the other scale degrees. Enable **Root notes white** to display every root-note pad in white while the remaining scale degrees keep the selected pad color.

### Root note and scale

Fire Host mirrors the DrivenByMoss Play-mode concept with saved **Root note** and **Scale** settings in the right-click menu. These settings affect **Play mode only**; Piano and Drum64 retain their own mappings. The Akai Fire OLED normally shows the active root note and scale.

Root notes: C, C#/Db, D, D#/Eb, E, F, F#/Gb, G, G#/Ab, A, A#/Bb, B.

Scales: Major, Natural Minor, Dorian, Phrygian, Lydian, Mixolydian, Locrian, Harmonic Minor, Melodic Minor, Major Pentatonic, Minor Pentatonic, Blues, Whole Tone, Diminished Half-Whole, Diminished Whole-Half, and Chromatic.

## Assignable CV outputs

Fire Host provides 20 assignable outputs. Click an assignment label, or right-click its jack, to choose the Fire control that drives the slot.

Continuous encoder sources include Volume, Pan, Filter, Resonance, and Select. Relative encoder motion is accumulated to 0-127 and converted to 0-10 V. When an assigned encoder is touched or moved, the Fire OLED temporarily shows that encoder and its current modulation percentage, then returns to the root/scale display.

Button assignments support Momentary, Toggle, and Trigger behavior.

## Themes

Right-click **Panel theme** for Light, Silver, Smoke, or Dark. Dark and Smoke use the same darker substrate family as S8.

## Independence notice

Fire Host is not affiliated with or endorsed by Akai Professional. Akai, Fire, and FL Studio are trademarks of their respective owners.

## OLED feedback

The Akai Fire OLED normally shows the active root note and scale. When an assigned continuous encoder is touched or turned, the OLED temporarily shows that control and a 0–100% white progress bar matching its current modulation/CV amount. Assigned buttons use the same display: 100% while pressed and 0% on release, then the OLED returns to root/scale.


## Shutdown behavior

When VCV Rack closes or FireHost is removed, FireHost blanks the Fire OLED and turns off its pad/button LEDs before releasing the MIDI output.


### Source: `docs/S8.md`

# S8 Quantizer

S8 is a compact 6HP polyphonic V/Oct quantizer with eight independent root/scale patterns, clocked pattern sequencing, intelligent harmony suggestions, and four panel themes.

## Signal flow

Patch pitch CV into **V/OCT IN** and take the quantized result from **V/OCT OUT**. Polyphonic channel count is preserved and each channel is quantized independently. **OFFSET** is applied after quantization in whole semitones.

## Controls

- **PATTERN** — manually selects Pattern 1-8. Each pattern stores its own root and scale.
- **STEP LIMIT** — sets how many patterns CLOCK cycles through, 1-8.
- **OFFSET** — transposes the quantized output from -12 to +12 semitones.
- **CLOCK** — advances within STEP LIMIT.
- **RESET** — returns to Pattern 1; RESET wins if CLOCK and RESET occur together.
- **V/OCT IN / OUT** — polyphonic pitch input/output.

## Root, scale, and harmony

Right-click S8 to edit the active pattern Root and Scale. Pattern 1 is HOME.

Available pitch sets include Major, Natural Minor, the diatonic modes, Harmonic Minor, Melodic Minor, major/minor pentatonic, Blues, Whole Tone, both diminished collections, Chromatic, triads, Maj7, Min7, Dom7, and Sus4.

**Suggest next** ranks musically related choices for the next pattern.

**Intelligently fill patterns 2-8** is a one-shot progression generator that keeps Pattern 1 as HOME.

**Auto-follow HOME** is a saved toggle. When enabled, turning it on, changing Pattern 1 Root/Scale, or changing Harmony Style regenerates Patterns 2-8. When disabled, those edits do not overwrite Patterns 2-8.

Harmony Styles:
- Safe / Diatonic
- Modern
- Jazz / Advanced
- Ambient / Modal
- Adventurous

## Themes

Right-click **Panel color** for Light, Silver, Smoke, or Dark. The theme is saved with the patch.

## Reset

Rack Initialize/Reset restores the factory pattern bank, Modern Harmony Style, Auto-follow HOME off, Light panel, zero OFFSET, Pattern 1, and STEP LIMIT 8.


### Source: `docs/history/FireHost-before-collection.md`

# Changelog

## 2.2.4

- Prepared Fire Host for free/open-source VCV Rack distribution under GPL-3.0-or-later.
- Added `LICENSE.txt`.
- Reworked README into the user manual and build guide.
- Added complete plugin/module descriptions and improved VCV Library tags/keywords.
- Kept the stable `FireHost` plugin/module slugs and Xtreme Sounds brand identity.
- No controller/DSP behavior change from 2.2.3.

## 2.2.3

- Replaced theme-specific assignable-label image sets with one shared monochrome label background and dynamic text.
- Preserved selectable Light, Silver, Smoke, and Dark panel themes.
- Preserved relative Fire encoder accumulation, per-slot button modes, pad velocity response, Fire-specific pad translation, automatic Fire pairing, and dynamic assignable outputs.
- Removed obsolete development/reference graphics from runtime resources.


### Source: `docs/history/S8-before-collection.md`

# S8 Changelog

## 2.9.15

- Prepared S8 as an independently installable VCV Rack plugin with stable plugin slug `S8` and brand `Xtreme Sounds`.
- Added saved **Auto-follow HOME** harmony automation.
- Added release documentation, freeware license, platform notice, and VCV Library submission notes.
- Added release build automation for Windows x64, Linux x64, macOS x64, and macOS ARM64.
- Preserved existing S8 DSP, panel geometry, themes, and shared hardware assets.

## 2.9.14

- Converted S8 from the previous combined `XtremeSounds` plugin identity to independent plugin slug `S8`.

## 2.9.12

- Corrected residual panel/hardware edge artifacts on Smoke and Dark themes.

## 2.9.11

- Corrected Rack `DrawArgs` type qualification in the image drawing helper.
