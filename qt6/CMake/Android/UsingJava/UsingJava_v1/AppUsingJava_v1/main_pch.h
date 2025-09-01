/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file apch.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 30/08/2025 at 19:09:05
 * */// --------------------------------------------------------------

#ifndef MAIN_PCH_H
#define MAIN_PCH_H

#if defined __cplusplus

#pragma once

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QObject>
#include <QString>

// Android system includes
#ifdef Q_OS_ANDROID
#include <QJniObject>
#include <QJniEnvironment>
#endif

// Application includes
#include <aloggerglobal.h>

// Constants and defintions

// Namespace


#endif // defined __cplusplus

#endif // MAIN_PCH_H
