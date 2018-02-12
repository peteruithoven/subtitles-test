project(
    'com.github.peteruithoven.subtitles-test',
    ['vala', 'c'],
    meson_version : '>= 0.43',
    license: 'GPL-3.0+'
)

# add_global_arguments('-DGETTEXT_PACKAGE="com.github.peteruithoven.subtitles-test"', language:'c')

executable(
    meson.project_name(),
    'src/Application.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('clutter-gtk-1.0'),
        # dependency('gstreamer-1.0'),
        # dependency('gstreamer-pbutils-1.0'),
        # dependency('gstreamer-video-1.0'),
        # dependency('gstreamer-tag-1.0'),
        dependency('clutter-gst-3.0')
    ],
    install : true
)
