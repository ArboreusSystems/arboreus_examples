#ifndef AENUMTEMPLATE_H
#define AENUMTEMPLATE_H

#include <type_traits>

template <typename Enum>
constexpr typename std::underlying_type<Enum>::type operator+(Enum inEnum) {

	return static_cast<typename std::underlying_type<Enum>::type>(inEnum);
}

#endif // AENUMTEMPLATE_H
