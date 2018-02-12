project(
    'com.github.peteruithoven.subtitles-test',
    ['vala', 'c'],
    meson_version : '>= 0.43',
    license: 'GPL-3.0+'
)

executable(
    meson.project_name(),
    'src/Application.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('clutter-gtk-1.0'),
        dependency('clutter-gst-3.0')
    ],
    install : true
)
