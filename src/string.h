#ifndef STRING_H
#define STRING_H

#include "types.h"

size_t
strlen(const char* str) {
	register const char *s;

	for (s = str; *s; ++s);
	return(s - str);
}

/* Copy SRC to DEST.  */
char *
strcpy (char *dest, const char *src)
{
  return memcpy (dest, src, strlen (src) + 1);
}

char *
strcat (char *dest, const char *src)
{
  strcpy (dest + strlen (dest), src);
  return dest;
}

#endif // STRING_H
