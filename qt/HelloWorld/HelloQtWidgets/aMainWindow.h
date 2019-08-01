/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file is qt4project/mywidget.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created %DAY%/%MONTH%/%YEAR% at %DATE%
 * */// --------------------------------------------------------------

#ifndef AMAINWINDOW_H
#define AMAINWINDOW_H

// System includes
#include <QWidget>
#include <QLabel>

// Application includes

// Constants


class aMainWindow : public QWidget {

	Q_OBJECT

	public:
		aMainWindow(QWidget *parent = nullptr);
		virtual ~aMainWindow();
		QLabel* mCreateLabel(void);
};

#endif // AMAINWINDOW_H
