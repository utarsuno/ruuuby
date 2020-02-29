
### Warnings
```
// see: https://croisant.net/ruby-c-extension-cheat-sheet/
rb_warn
rb_warning (only print warning if $VERBOSE is true)
```

### MacOS C Support
```

// to fix missing header: sys/statfs.h

brew cask install osxfuse
// (kinda, header still missing but adding the following 2 works)
#include <sys/param.h>
#include <sys/mount.h>

* http://macappstore.org/osxfuse/
* https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man2/statfs.2.html

```


### Source Code Snippets

```
//rb_enc_set_default_external(rb_enc_from_encoding(rb_utf8_encoding()));
//rb_enc_set_default_internal(rb_enc_from_encoding(rb_utf8_encoding()));

/* locale insensitive functions */

static inline int rb_isascii(int c){ return '\0' <= c && c <= '\x7f'; }
static inline int rb_isupper(int c){ return 'A' <= c && c <= 'Z'; }
static inline int rb_islower(int c){ return 'a' <= c && c <= 'z'; }
static inline int rb_isalpha(int c){ return rb_isupper(c) || rb_islower(c); }
static inline int rb_isdigit(int c){ return '0' <= c && c <= '9'; }
static inline int rb_isalnum(int c){ return rb_isalpha(c) || rb_isdigit(c); }
static inline int rb_isxdigit(int c){ return rb_isdigit(c) || ('A' <= c && c <= 'F') || ('a' <= c && c <= 'f'); }
static inline int rb_isblank(int c){ return c == ' ' || c == '\t'; }
static inline int rb_isspace(int c){ return c == ' ' || ('\t' <= c && c <= '\r'); }
static inline int rb_iscntrl(int c){ return ('\0' <= c && c < ' ') || c == '\x7f'; }
static inline int rb_isprint(int c){ return ' ' <= c && c <= '\x7e'; }
static inline int rb_ispunct(int c){ return !rb_isalnum(c); }
static inline int rb_isgraph(int c){ return '!' <= c && c <= '\x7e'; }
static inline int rb_tolower(int c) { return rb_isupper(c) ? (c|0x20) : c; }
static inline int rb_toupper(int c) { return rb_islower(c) ? (c&0x5f) : c; }

```

### WIP :P

```c

#define MYFILE "FILE_PATH_=)"
int m_file_get_last_n_bytes();
int m_file_get_last_n_bytes() {
    //int fd;

    FILE *fp;
    //char buf[BUFSIZ] = "Garbage";
    char buf[BUFSIZ] = {0};

    //ssize_t read_byte;
    //char c[4097];

    //c_file_read(fd, MYFILE)
    //if (fd == -1) {
    //    printf("Error opening file{/Users/utarsuno/ruby_code/ruuuby/ext/ruby_class_mods/hello_world.test}\n");
    //    return -1;
    //}

    //////
    //struct statfs fsInfo = {0};
    //long optimal_size;
    //long optimal_transfer;
    //if (fstatfs(fd, &fsInfo) == -1) {
    //    optimal_size = 4096; // 4 * 1024 * 1024
    //    optimal_transfer = -1337L;
    //} else {
    //    optimal_size = fsInfo.f_bsize;
    //    optimal_transfer = fsInfo.f_iosize;
    //}
    //////


    //lseek(fd, -4096L, SEEK_END);
    //read_byte = read(fd, c, 4096L); // Read 1024 bytes
    //c[read_byte] = '\0';

    int i;
    if ((fp = fopen(MYFILE, "r")) == NULL) {
        perror (MYFILE);
        return (EXIT_FAILURE);
    }
    i = 0;
    while (fgets(buf, sizeof(buf), fp) != NULL) {
        printf ("Line %4d: %s", i, buf);
        i++;
    }
    printf ("AAAAAA Line %4d: %s\n", i, buf);
    fclose(fp);
    //return(0);

    //printf("OPTIMIAL SIZE {%lu}\n", optimal_size);
    //printf("OPTIMIAL TRANSFER SIZE {%lu}\n", optimal_transfer);
    //printf("%s\n", c);
    //c_file_close(fd)

    return 0;
}

//#define c_file_read(file_descriptor, path) file_descriptor = open(path, O_RDONLY);
#define c_file_read(file_descriptor, path) file_descriptor = open(path, O_RDONLY);
#define c_file_close(file_descriptor) fclose(file_descriptor);


```
