// ----------------------------------------------------------
/*!
	\headerfile AModifier
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/09/2026 at 18:03:05
	\endlist
*/
// ----------------------------------------------------------
#ifndef AMODIFIER_H
#define AMODIFIER_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>

// Namesapces

// Constants and definitions

// Class definitions
class AModifier : public QObject {

	Q_OBJECT
	QML_ELEMENT
	Q_PROPERTY(bool mIsPasswordDefined READ mIsPasswordDefined NOTIFY sgPasswordChanged)

	public:

		explicit AModifier(QObject* parent = nullptr);
		virtual ~AModifier(void);

		bool mIsPasswordDefined() const;

		Q_INVOKABLE bool mPasswordSet(const QString& inPassword, const QByteArray& inSalt = QByteArray());
		Q_INVOKABLE QString mPasswordGet(void) const;
		Q_INVOKABLE void mMemoryClear(void);

	signals:

		void sgPasswordChanged();

	private:

		static constexpr size_t __KEY_SIZE = 32;
		static constexpr size_t __IV_SIZE = 12;
		static constexpr size_t __TAG_SIZE = 16;
		static constexpr int __PBKDF2_ITERATIONS = 600000;

		QByteArray pPasswordBuffer;
		QByteArray pDerivedKey;

		void mLockBuffer(void* inPointer, size_t inSize);
		void mUnlockAndClear(void* inPointer, size_t inSize);
};

#endif // AMODIFIER_H
