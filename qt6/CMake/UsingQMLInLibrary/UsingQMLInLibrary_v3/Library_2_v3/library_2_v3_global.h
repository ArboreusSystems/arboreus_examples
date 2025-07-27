#ifndef LIBRARY_2_V3_GLOBAL_H
#define LIBRARY_2_V3_GLOBAL_H

#include <library_2_v3_pch.h>

#if defined(LIBRARY_2_V3_LIBRARY)
#  define LIBRARY_2_V3_EXPORT Q_DECL_EXPORT
#else
#  define LIBRARY_2_V3_EXPORT Q_DECL_IMPORT
#endif

#endif // LIBRARY_2_V3_GLOBAL_H
