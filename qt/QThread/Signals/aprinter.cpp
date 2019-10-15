#include "aprinter.h"

APrinter::APrinter(QObject *inParent) : QObject(inParent) {

	aLOG << "APrinter created";
}

APrinter::~APrinter(void) {

	aLOG << "APrinter deleted";
}

void APrinter::slPrint(int inValue) {

	aLOG << "Value from thread:" << inValue;
}
