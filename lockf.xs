#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <unistd.h>
#ifdef __cplusplus
}
#endif


MODULE = File::lockf		PACKAGE = File::lockf


int
lock(file, size = 0)
     FILE * file
     long size
     CODE:
     {
       int error;
       if ((error = lockf(fileno(file), F_LOCK, size)) == -1)
	 RETVAL = errno;
       else
	 RETVAL = 0;
     }
     OUTPUT:
       RETVAL

int
tlock(file, size = 0)
     FILE * file
     long size
     CODE:
     {
       int error;
       if ((error = lockf(fileno(file), F_TLOCK, size)) == -1)
	 RETVAL = errno;
       else
	 RETVAL = 0;
     }
     OUTPUT:
       RETVAL

int
ulock(file, size = 0)
     FILE * file
     long size
     CODE:
     {
       int error;
       if ((error = lockf(fileno(file), F_ULOCK, size)) == -1)
	 RETVAL = errno;
       else
	 RETVAL = 0;
     }
     OUTPUT:
       RETVAL

int
test(file, size = 0)
     FILE * file
     long size
     CODE:
     {
       int error;
       if ((error = lockf(fileno(file), F_TEST, size)) == -1)
	 RETVAL = errno;
       else
	 RETVAL = 0;
     }
     OUTPUT:
       RETVAL
