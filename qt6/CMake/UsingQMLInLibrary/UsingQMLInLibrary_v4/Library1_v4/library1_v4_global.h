#ifndef LIBRARY1_V4_GLOBAL_H
#define LIBRARY1_V4_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(LIBRARY1_V4_LIBRARY)
#  define LIBRARY1_V4_EXPORT Q_DECL_EXPORT
#else
#  define LIBRARY1_V4_EXPORT Q_DECL_IMPORT
#endif

#endif // LIBRARY1_V4_GLOBAL_H
