// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/06/2022 at 09:19:44
	\endlist
*/
// ----------------------------------------------------------
#ifndef ANOTIFICATIONSDATAMODELS_H
#define ANOTIFICATIONSDATAMODELS_H

// System includes
#include <QObject>
#include <QString>
#include <QVariant>
#include <QVariantMap>

// Application includes

// Constants and defintions

// Namespace

class ANotificationModel {

	public:
		
		QString ID = "NoIDDefined";
		QString Title = "NoTitleDefined";
		QString Subtitle = "NoSubtitleDefined";
		QString URL = "NoDefinedURL";
		bool Repeat = false;
		bool Delay = false;
		int DelayTime = 0;

		explicit ANotificationModel(void) {}
		virtual ~ANotificationModel(void) {}

		QVariantMap mToVariantMap(void) {

			QVariantMap oOutput;
			oOutput.insert("ID",ID);
			oOutput.insert("Title",Title);
			oOutput.insert("Subtitle",Subtitle);
			oOutput.insert("URL",URL);
			oOutput.insert("Repeat",Repeat);
			oOutput.insert("Delay",Delay);
			oOutput.insert("DelayTime",DelayTime);

			return oOutput;
		}

		void mFromVariantMap(QVariantMap inModel) {
			
			ID = qvariant_cast<QString>(inModel.value("ID"));
			Title = qvariant_cast<QString>(inModel.value("Title"));
			Subtitle = qvariant_cast<QString>(inModel.value("Subtitle"));
			URL = qvariant_cast<QString>(inModel.value("URL"));
			Repeat = qvariant_cast<bool>(inModel.value("Repeat"));
			Delay = qvariant_cast<bool>(inModel.value("Delay"));
			DelayTime = qvariant_cast<int>(inModel.value("DelayTime"));
		}
};

#endif // ANOTIFICATIONSDATAMODELS_H
