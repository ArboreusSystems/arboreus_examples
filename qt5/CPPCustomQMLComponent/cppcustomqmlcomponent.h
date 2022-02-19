/* -------------------------------------------------------------------
 *  @doc The Custom QML Component Class headers
 *  @notice Template file classes/file.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 27/02/2019 at 10:36:11
 * */// --------------------------------------------------------------

#ifndef CPPCUSTOMQMLCOMPONENT_H
#define CPPCUSTOMQMLCOMPONENT_H

#include <QObject>

class CPPCustomQMLComponent : public QObject {

	Q_OBJECT
	Q_PROPERTY(QString customText READ ConstantText CONSTANT)
	Q_PROPERTY(QString changableText READ ChangableText WRITE SetChagableText NOTIFY ChangedText)

	public:
		explicit CPPCustomQMLComponent(QObject *parent = nullptr);
		virtual ~CPPCustomQMLComponent();


	signals:
		void ChangedText();

	public slots:

	private:
		QString vConstantText;
		QString ConstantText();
		QString vChangableText;
		QString ChangableText();
		void SetChagableText(QString String);
};

#endif // CPPCUSTOMQMLCOMPONENT_H
