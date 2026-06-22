/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file apch.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 22/06/2026 at 11:52:00
 * */// --------------------------------------------------------------

#ifndef MAIN_PCH_H
#define MAIN_PCH_H

#if defined __cplusplus

#pragma once

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Android includes
#if defined(Q_OS_ANDROID)
#include <QCoreApplication>
#include <QJniObject>
#endif


// Application includes

// Constants and defintions

// Namespace


#endif // defined __cplusplus

#endif // MAIN_PCH_H
