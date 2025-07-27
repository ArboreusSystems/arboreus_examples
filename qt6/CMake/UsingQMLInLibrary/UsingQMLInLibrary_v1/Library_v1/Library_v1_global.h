#ifndef LIBRARY_V1_GLOBAL_H
#define LIBRARY_V1_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(LIBRARY_V1_LIBRARY)
#  define LIBRARY_V1_EXPORT Q_DECL_EXPORT
#else
#  define LIBRARY_V1_EXPORT Q_DECL_IMPORT
#endif

#endif // LIBRARY_V1_GLOBAL_H
