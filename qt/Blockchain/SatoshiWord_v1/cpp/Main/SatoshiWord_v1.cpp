/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 12/12/2020 at 12:23:06
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Application includes
#include "alogger.h"
#include "../Bitcoin/abitcoin.h"

// Namespace


int main(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(inCounter,inArguments);
	QQmlApplicationEngine oEngine;
	QQmlContext *oContext = oEngine.rootContext();

	ABitcoin* oBitcoin = new ABitcoin();
	oContext->setContextProperty("ABitcoin",oBitcoin);

//	settings oSettings = settings(config::settings::mainnet);
//	std::cout << "max_money()" << oSettings.max_money() << std::endl;
//	std::cout << "initial_subsidy()" << oSettings.initial_subsidy() << std::endl;
//	std::cout << "bitcoin_to_satoshi(134)" << oSettings.bitcoin_to_satoshi(134) << std::endl;

//	std::cout << "retargeting_factor" << oSettings.retargeting_factor << std::endl;
//	std::cout << "retargeting_interval_seconds" << oSettings.retargeting_interval_seconds << std::endl;
//	std::cout << "block_spacing_seconds" << oSettings.block_spacing_seconds << std::endl;
//	std::cout << "timestamp_limit_seconds" << oSettings.timestamp_limit_seconds << std::endl;

//	const chain::block block = oSettings.genesis_block;
//	const auto& coinbase = block.transactions().front();
//	const auto& input = coinbase.inputs().front();
//	std::cout << coinbase.inputs().front().sequence() << std::endl;
//	BITCOIN_ASSERT_MSG(input.script().size() > 2u, "unexpected genesis");

//	const auto headline = input.script()[2].data();
//	std::string message(headline.begin(), headline.end());
//	std::cout << message << std::endl;

	const QUrl oURL(QStringLiteral("qrc:/qml/Main/SatoshiWord_v1.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [oURL](QObject *obj, const QUrl &objUrl) {
			if (!obj && oURL == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine.load(oURL);

	return oApplication.exec();
}
