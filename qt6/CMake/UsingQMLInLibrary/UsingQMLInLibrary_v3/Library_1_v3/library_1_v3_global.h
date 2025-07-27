#ifndef LIBRARY_1_V3_GLOBAL_H
#define LIBRARY_1_V3_GLOBAL_H

#include <library_1_v3_pch.h>

#if defined(LIBRARY_1_V3_LIBRARY)
#  define LIBRARY_1_V3_EXPORT Q_DECL_EXPORT
#else
#  define LIBRARY_1_V3_EXPORT Q_DECL_IMPORT
#endif

#endif // LIBRARY_1_V3_GLOBAL_H
