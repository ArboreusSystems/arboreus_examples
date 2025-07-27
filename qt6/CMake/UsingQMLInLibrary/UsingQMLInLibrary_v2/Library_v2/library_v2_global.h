#ifndef LIBRARY_V2_GLOBAL_H
#define LIBRARY_V2_GLOBAL_H

#include <library_v2_pch.h>

#if defined(LIBRARY_V1_LIBRARY)
#  define LIBRARY_V1_EXPORT Q_DECL_EXPORT
#else
#  define LIBRARY_V1_EXPORT Q_DECL_IMPORT
#endif

#endif // LIBRARY_V2_GLOBAL_H
