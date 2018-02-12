namespace Test {
    public class Application : Gtk.Application {

        public GtkClutter.Embed clutter;
        private Clutter.Actor video_actor;
        private Clutter.Stage stage;
        private ClutterGst.Playback playback;

        public Application () {
            Object (
                application_id: "com.github.peteruithoven.subtitles-test",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void activate () {

            var main_window = new Gtk.ApplicationWindow (this);
            main_window.default_height = 400;
            main_window.default_width = 500;
            main_window.title = "Hello World";

            playback = new ClutterGst.Playback ();
            playback.set_seek_flags (ClutterGst.SeekFlags.ACCURATE);
            clutter = new GtkClutter.Embed ();
            stage = (Clutter.Stage)clutter.get_stage ();
            stage.background_color = {0, 0, 0, 0};

            video_actor = new Clutter.Actor ();
            #if VALA_0_34
                        var aspect_ratio = new ClutterGst.Aspectratio ();
            #else
                        var aspect_ratio = ClutterGst.Aspectratio.@new ();
            #endif
            ((ClutterGst.Aspectratio) aspect_ratio).paint_borders = false;
            ((ClutterGst.Content) aspect_ratio).player = playback;
            video_actor.content = aspect_ratio;

            video_actor.add_constraint (new Clutter.BindConstraint (stage, Clutter.BindCoordinate.WIDTH, 0));
            video_actor.add_constraint (new Clutter.BindConstraint (stage, Clutter.BindCoordinate.HEIGHT, 0));

            stage.add_child (video_actor);
            main_window.add (clutter);
            main_window.show_all ();

            playback.notify["subtitle-uri"].connect (() => {
                stdout.printf ("playback.notify subtitle-uri: %s\n", playback.subtitle_uri);
            });

            play_file ("file:///home/peteruithoven/Videos/ed_hd_512kb.mp4");

            GLib.Timeout.add (2000, () => {
                // set_subtitle ("file:///home/peteruithoven/Videos/ed.srt"); // doesn't work
                // set_subtitle ("file:///home/peteruithoven/Videos/ed_hd_512kb.srt"); // works
                return false;
            });
        }

        private void play_file (string uri) {
            stdout.printf ("Playing %s\n", uri);
            playback.uri = uri;
            // playback.set_subtitle_uri ("file:///home/peteruithoven/Videos/ed.srt"); // doesn't work
            set_subtitle ("file:///home/peteruithoven/Videos/ed_hd_512kb.srt"); // works
            playback.progress = 0.02; //0.03
            playback.playing = true;
        }
        private void set_subtitle (string uri) {
            stdout.printf ("set_subtitle %s\n", uri);
            playback.set_subtitle_uri (uri);
        }

        public static int main (string[] args) {

            var err = GtkClutter.init (ref args);
            if (err != Clutter.InitError.SUCCESS) {
                error ("Could not initalize clutter! "+err.to_string ());
            }

            Gst.init (ref args);

            var app = new Application ();
            return app.run (args);
        }
    }
}
