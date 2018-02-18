//
//  SuperHeroTablePresenterTest.swift
//  MVPExampleTests
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import XCTest
@testable import MVPExample

class SuperHeroTablePresenterTest: XCTestCase {

    var sut: SuperHeroTablePresenterMock! //Subject under test S.U.T
    var spy: SuperHeroTableViewProtocolSpy!

    override func setUp() {
        super.setUp()
        spy = SuperHeroTableViewProtocolSpy()
        sut = SuperHeroTablePresenterMock(view: spy)
    }

    override func tearDown() {
        sut = nil
        spy = nil
        super.tearDown()
    }

    func testInitAllProperly() {
        XCTAssertNotNil(spy)
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.view)
    }

    func testSuperHeroesReceivedWithNilNotSaveNil() {
        sut.superHeroesReceived(superHeroesArray: nil)

        XCTAssertEqual(SuperHeroData.superHeroEmpty, sut.superHeroesArray)
    }

    func testSuperHeroesReceivedWithSuperHeroArraySaveAndReloadTable() {
        sut.superHeroesReceived(superHeroesArray: SuperHeroData.superHeroArray)

        XCTAssertEqual(SuperHeroData.superHeroArray, sut.superHeroesArray)
        XCTAssertTrue(spy.loadTableCalled)
    }

    func testViewNeedsNumberOfSuperHeroesWithOneSuperHeroReturnOne() {
        sut.superHeroesArray = SuperHeroData.superHeroArray

        XCTAssertEqual(1,sut.viewNeedsNumberOfSuperHeroes())
    }

    func testViewNeedsNumberOfSuperHeroesWithEmptyArrayNotReturnOne() {
        sut.superHeroesArray = SuperHeroData.superHeroEmpty

        XCTAssertNotEqual(1,sut.viewNeedsNumberOfSuperHeroes())
    }

    func testViewIsReadyCallLoadSuperHeroes() {
        sut.viewIsReady()

        XCTAssertTrue(sut.loadSuperHeroCalled)
    }
}
