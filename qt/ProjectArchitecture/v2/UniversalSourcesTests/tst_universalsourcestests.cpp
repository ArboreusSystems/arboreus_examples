/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file is tst_src.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 03/09/2019 at 20:18:26
 * */// --------------------------------------------------------------

// System includes
#include <QtTest>

// Application includes
#include "../UniversalSources/Global/aglobal.h"
#include "../UniversalSources/TestClass/atestclass.h"


class UniversalSourcesTests : public QObject {

	Q_OBJECT

	public:
		explicit UniversalSourcesTests(void);
		virtual ~UniversalSourcesTests(void);

	private slots:
		void test_case1(void);
};


// -----------
/*!
	\fn

	Doc.
*/

UniversalSourcesTests::UniversalSourcesTests() {

}


// -----------
/*!
	\fn

	Doc.
*/

UniversalSourcesTests::~UniversalSourcesTests() {

}


// -----------
/*!
	\fn

	Doc.
*/

void UniversalSourcesTests::test_case1() {

	aTestClass *oTestClass = new aTestClass();
	QVERIFY2(oTestClass,"FAIL >> aTestClass");
	QVERIFY2(oTestClass->mTest() == 5,"FAIL >> oTestClass->mTest()");
	QVERIFY2(oTestClass->mTest() == 6,"FAIL >> oTestClass->mTest()");
}

QTEST_APPLESS_MAIN(UniversalSourcesTests)

#include "tst_universalsourcestests.moc"
