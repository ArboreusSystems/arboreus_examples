#ifndef AGLOBAL_H
#define AGLOBAL_H

#include <QDateTime>
#include <QDebug>

#define A_DEFAULT_STRING "default string"
#define aLOG qDebug() << QDateTime::currentMSecsSinceEpoch()

#endif // AGLOBAL_H
