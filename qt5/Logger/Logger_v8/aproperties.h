// ----------------------------------------------------------
/*!
	\headerfile AProperties
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/03/2021 at 13:21:12
	\endlist
*/
// ----------------------------------------------------------

#ifndef APROPERTIES_H
#define APROPERTIES_H

// System includes
#include <QObject>

// Application includes
#include <aloggerglobal.h>

// Constants and definitions

// Namespace
namespace ARB {

// Class definitions
class AProperties : public QObject {

	Q_OBJECT

	public:

		static AProperties& mInstance(void);

	private:

		explicit AProperties(QObject *parent = nullptr);
		virtual ~AProperties(void);
		Q_DISABLE_COPY(AProperties)
};

} // namespace ARB

#endif // APROPERTIES_H
