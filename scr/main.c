#ifdef __APPLE__
#define ALLEGRO_NO_MAGIC_MAIN
#endif

#include <allegro.h>

int main(void){
    int running = 1;

    allegro_init();
    install_keyboard();
    install_timer();

    set_color_depth(32);
    if (set_gfx_mode(GFX_AUTODETECT_WINDOWED, 640, 480, 0, 0) != 0) {
        allegro_message("Unable to create a window:\n%s\n", allegro_error);
        return 1;
    }

    clear_to_color(screen, makecol(24, 28, 36));
    rectfill(screen, 40, 40, 600, 440, makecol(42, 49, 61));
    rect(screen, 40, 40, 600, 440, makecol(112, 181, 255));
    textout_centre_ex(screen, font, "Allegro 4 test app", SCREEN_W / 2, 140,
                      makecol(255, 255, 255), -1);
    textout_centre_ex(screen, font, "If you can read this, graphics work.",
                      SCREEN_W / 2, 220, makecol(200, 220, 255), -1);
    textout_centre_ex(screen, font, "Press ESC to quit.", SCREEN_W / 2, 300,
                      makecol(255, 214, 102), -1);

    while (running) {
        if (key[KEY_ESC]) {
            running = 0;
        }

        rest(16);
    }

    return 0;
}
END_OF_MAIN()
