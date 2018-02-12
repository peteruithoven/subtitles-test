# Subtitles test

Experiment to debug issue [#32](https://github.com/elementary/videos/issues/32) of the [elementary OS](https://elementary.io) Videos app.

## Prepare

Download Elephants Dream movie and subtitles:
- [ed_hd_512kb.mp4](https://archive.org/download/ElephantsDream/ed_hd_512kb.mp4)
- [English subtitles](https://subscene.com/subtitles/elephants-dream/english/1714236)

## Building and running

1. Install dependencies:

  * meson >= 0.43.0
  * valac
  * clutter-gtk-1.0'
  * clutter-gst-3.0

1. Prepare:
```
$ meson build --prefix=/usr
$ cd build
```
2. Adapt code to point to movie and subtitle files.
3. Build and run:
```
$ ninja
$ ./com.github.peteruithoven.suubtitles-test
```
