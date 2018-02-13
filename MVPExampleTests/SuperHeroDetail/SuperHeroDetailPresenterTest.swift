//
//  SuperHeroDetailPresenterTest.swift
//  MVPExampleTests
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import XCTest
@testable import MVPExample

class SuperHeroDetailPresenterTest: XCTestCase {

    var sut: SuperHeroDetailPresenter!
    var spy: SuperHeroDetailViewProtocolSpy!

    override func setUp() {
        super.setUp()
        spy = SuperHeroDetailViewProtocolSpy()
        sut = SuperHeroDetailPresenter(view: spy, superHero: SuperHeroData.superHeroData)
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
        XCTAssertEqual(SuperHeroData.superHeroData, sut.superHero)
    }

    func testGetImageReturnSuperHeroImage() {
        spy.getImage(imageURL: sut.superHero.getPhoto())

        XCTAssertEqual(SuperHeroData.superHeroData.getPhoto(), spy.getImageString)
    }

    func testGetNameReturnSuperHeroName() {
        spy.getName(name: sut.superHero.getName())

        XCTAssertEqual(SuperHeroData.superHeroData.getName(), spy.getNameString)
    }

    func testGetRealNameReturnSuperHeroRealName() {
        spy.getRealName(realName: sut.superHero.getRealName())

        XCTAssertEqual(SuperHeroData.superHeroData.getRealName(), spy.getRealNameString)
    }

    func testGetHeightReturnSuperHeroHeight() {
        spy.getHeight(height: sut.superHero.getHeight())

        XCTAssertEqual(SuperHeroData.superHeroData.getHeight(), spy.getHeightString)
    }

    func testGetPowetReturnSuperHeroPower() {
        spy.getPower(power: sut.superHero.getPower())

        XCTAssertEqual(SuperHeroData.superHeroData.getPower(), spy.getPowerString)
    }

    func testGetAbilitiesReturnSuperHeroAbilities() {
        spy.getAbilities(abilities: sut.superHero.getAbilities())

        XCTAssertEqual(SuperHeroData.superHeroData.getAbilities(), spy.getAbilitiesString)
    }

    func testGetGroupsReturnSuperHeroGroups() {
        spy.getGroups(groups: sut.superHero.getGroups())

        XCTAssertEqual(SuperHeroData.superHeroData.getGroups(), spy.getGroupsString)
    }

}
