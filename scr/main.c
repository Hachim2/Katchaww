#ifdef __APPLE__
#define ALLEGRO_NO_MAGIC_MAIN
#endif

#include <allegro.h>

#define APP_WIDTH 1200
#define APP_HEIGHT 800

volatile int close_button_pressed = FALSE;

void close_button_handler(void){
    close_button_pressed = TRUE;
}
END_OF_FUNCTION(close_button_handler);


int main(void){
    float pos = 0;

    allegro_init();

    LOCK_FUNCTION(close_button_handler);
    set_close_button_callback(close_button_handler);

    install_keyboard();
    install_mouse();
    install_timer();

    set_color_depth(32);

    if (set_gfx_mode(GFX_AUTODETECT_WINDOWED, APP_WIDTH, APP_HEIGHT, 0, 0) != 0) {
        allegro_message("Unable to create a window:\n%s\n", allegro_error);
        return 1;
    }

    clear_to_color(screen, makecol(24, 28, 36));
    textout_centre_ex(screen, font, "Allegro 4 test app", APP_WIDTH / 2, 140,
                      makecol(255, 255, 255), -1);
    textout_centre_ex(screen, font, "If you can read this, graphics work.",
                      APP_WIDTH / 2, 220, makecol(200, 220, 255), -1);
    textout_centre_ex(screen, font, "Using a fixed 800x600 window.",
                      APP_WIDTH / 2, 260, makecol(180, 200, 235), -1);
    textout_centre_ex(screen, font, "Press ESC to quit.", APP_WIDTH / 2, 320,
                      makecol(255, 214, 102), -1);
    show_mouse(screen);

    while (!close_button_pressed) {
        clear_to_color(screen, makecol(24, 28, 36));

        pos = (pos + 0.01);
        if (pos > 1) {
            pos = 0;
        }

        show_mouse(screen);
        circlefill(screen, APP_WIDTH * pos, APP_HEIGHT * pos, 10, makecol(255, 255, 255));
        if (key[KEY_DEL_PAD] || key[KEY_DEL]) {
            close_button_pressed = 1;
        }
        rest(16);
    }

    return 0;
}

END_OF_MAIN()
