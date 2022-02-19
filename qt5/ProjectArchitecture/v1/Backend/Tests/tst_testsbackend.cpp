/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file is tst_src.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 21/08/2019 at 08:30:20
 * */// --------------------------------------------------------------

// System includes
#include <QtTest>

// Application includes
#include "../Backend/backend.h"


class TestsBackend : public QObject {

	Q_OBJECT

	public:
		explicit TestsBackend(void);
		virtual ~TestsBackend(void);

	private:
		Backend *pBackend;

	private slots:
		void mTestCaseTrue(void);
		void mTestCaseFalse(void);
		void mTestCaseNumber(void);
};

TestsBackend::TestsBackend(void) {

	pBackend = new Backend();
}

TestsBackend::~TestsBackend(void) {

}

void TestsBackend::mTestCaseTrue(void) {

	QVERIFY2(true,"mTestCaseTrue(void)");
}

void TestsBackend::mTestCaseFalse(void) {

	QVERIFY2(false,"mTestCaseFalse(void)");
}

void TestsBackend::mTestCaseNumber() {

	QVERIFY(pBackend->mTestUint() > 0);
	QVERIFY(pBackend->mTestUint() == 111);
	QVERIFY(pBackend->mTestUint() > 1);
	QVERIFY(pBackend->mTestUint() == 0);
}

QTEST_APPLESS_MAIN(TestsBackend)

#include "tst_testsbackend.moc"
