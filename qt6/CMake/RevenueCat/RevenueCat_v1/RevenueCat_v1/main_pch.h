/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file apch.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 26/10/2026 at 16:12:24
 * */// --------------------------------------------------------------

#ifndef MAIN_PCH_H
#define MAIN_PCH_H

#if defined __cplusplus

#pragma once

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQmlContext>
#include <QVariant>
#include <QVariantMap>
#include <QList>
#include <QVariantList>
#include <QQuickStyle>

// Android includes
#if defined(Q_OS_ANDROID)
#include <QJniObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#endif

// Application includes

// Constants and defintions

// Namespace


#endif // defined __cplusplus

#endif // MAIN_PCH_H
