#ifdef __APPLE__
#define ALLEGRO_NO_MAGIC_MAIN
#endif

#include <allegro.h>
#include <unistd.h>

#define APP_WIDTH 1200
#define APP_HEIGHT 800

volatile int close_button_pressed = FALSE;

static BITMAP *load_background(char* path){
    BITMAP *bmp = load_bitmap(path, NULL);
    return bmp;
}

static int background_exists(char* path)
{
    return exists(path);
}

void close_button_handler(void){
    close_button_pressed = TRUE;
}
END_OF_FUNCTION(close_button_handler);


int main(void){
    float pos = 0;
    char* path = "assets/bgs/bg1.bmp";
    BITMAP *background;
    BITMAP *background_scaled;
    BITMAP *buffer;

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

    background = load_background(path);
    if (!background) {
        char cwd[1024];
        cwd[0] = '\0';
        getcwd(cwd, sizeof(cwd));
        allegro_message("Unable to load image from %s\ncwd: %s\nexists: %s\n%s\n",
                        path,
                        cwd[0] ? cwd : "(unknown)",
                        background_exists(path) ? "yes" : "no",
                        allegro_error);
        return 1;
    }

    background_scaled = create_bitmap(APP_WIDTH, APP_HEIGHT);
    buffer = create_bitmap(APP_WIDTH, APP_HEIGHT);
    if (!background_scaled || !buffer) {
        allegro_message("Unable to create render buffers.\n%s\n", allegro_error);
        return 1;
    }

    stretch_blit(background, background_scaled, 0, 0, background->w, background->h,
                 0, 0, APP_WIDTH, APP_HEIGHT);


    while (!close_button_pressed) {
        blit(background_scaled, buffer, 0, 0, 0, 0, APP_WIDTH, APP_HEIGHT);

        pos = (pos + 0.01);
        if (pos > 1) {
            pos = 0;
        }

        circlefill(buffer, APP_WIDTH * pos, APP_HEIGHT * pos, 10, makecol(255, 255, 255));
        vsync();
        blit(buffer, screen, 0, 0, 0, 0, APP_WIDTH, APP_HEIGHT);
        show_mouse(screen);

        if (key[KEY_DEL_PAD] || key[KEY_DEL]) {
            close_button_pressed = 1;
        }
        rest(8);
    }

    destroy_bitmap(buffer);
    destroy_bitmap(background_scaled);
    destroy_bitmap(background);

    return 0;
}

END_OF_MAIN()
