/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file apch.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 20/07/2026 at 21:55:37
 * */// --------------------------------------------------------------

#ifndef MAIN_PCH_H
#define MAIN_PCH_H

#if defined __cplusplus

#pragma once

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QString>
#include <QMetaObject>
#include <QTimer>
#include <QQmlContext>

// Android includes
#ifdef Q_OS_ANDROID
#include <QJniObject>
#include <jni.h>
#endif

// Application includes

// Constants and defintions

// Namespace


#endif // defined __cplusplus

#endif // MAIN_PCH_H
