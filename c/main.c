#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

char *str_alloc(const char *format, ...) __attribute__((format(printf, 1, 2)));

// NOTE: This is not a compatible signature with vasprintf.

int main() {
  char *name = str_alloc("%s:%d:%d", "Peter Sheehan", 9, 2);
  printf("%s", name);
  free(name);
  return 0;
}

char *str_alloc(const char *format, ...) {
  va_list args;
  va_start(args, format);

  va_list args2;
  va_copy(args2, args);

  int size = vsnprintf(NULL, 0, format, args);
  va_end(args);

  if (size < 0) {
    va_end(args2);
    return NULL;
  }

  char *buf = malloc((size_t)size + 1);
  if (!buf) {
    va_end(args2);
    return NULL;
  }

  vsnprintf(buf, (size_t)size + 1, format, args2);
  va_end(args2);

  return buf;
}

// char *str_alloc(const char *format, ...) {
//   size_t size = snprintf(NULL, 0, format) + 1;
//   char *s = malloc(size);
//   snprintf(s, size, format);
//   return s;
// }
