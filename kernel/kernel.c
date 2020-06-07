#include "../drivers/screen.h"

void main()
{
    //char* video_memory = (char*) 0xb8000;
    //*video_memory = 'H';
    clear_screen();
    //print_at("Hello, World!", 10, 5);
    print_at("H", 1, 1);
    print_at("e", 2, 1);
    print_at("l", 3, 1);
    print_at("l", 4, 1);
    print_at("0", 5, 1);
    print_at("!", 6, 1);
}
