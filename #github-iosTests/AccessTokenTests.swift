//
//  AccessTokenTests.swift
//  #github-ios
//
//  Created by Artur on 09/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import XCTest

class AccessTokenTests: XCTestCase {
    
    // MARK: - Input params
    
    let params1 = ""
    let params2 = "&"
    let params3 = "&&"
    let params4 = "key1=val1=val2=val3&"
    let params5 = "access_token=val1=val2=val3&"
    let params6 = "access_token=&"
    let params7 = "&&&=&&&access_token=accesstokenvalue&==&&"
    let params8 = "access_token&accesstokenkvalue=scope&gists=token_type&bearer"
    let params9 = "scope=&token_type=bearer"
    let params10 = "access_token=fhsdfusdhf823498&scope=&token_type=bearer"

    // MARK: - Config
    
    override func setUp() {
        super.setUp()
    
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    // MARK: - Access token 1
    
    func testAccessTokenKey_OnEmptyString_ReturnNil() {
        let accessToken = AccessToken(withString: params1)
        XCTAssertNil(accessToken.accessTokenKey)
    }
    
    func testScope_OnEmptyString_ReturnNil() {
        let accessToken = AccessToken(withString: params1)
        XCTAssertNil(accessToken.scope)
    }
    
    func testTokenType_OnEmptyString_ReturnNil() {
        let accessToken = AccessToken(withString: params1)
        XCTAssertNil(accessToken.tokenType)
    }
    
    // MARK: - Access token 2
    
    func testAccessTokenKey_OnStringWithAndChar_ReturnNil() {
        let accessToken = AccessToken(withString: params2)
        XCTAssertNil(accessToken.accessTokenKey)
    }
    
    // MARK: - Access token 3
    
    func testAccessTokenKey_OnStringWithTwoAndChars_ReturnNil() {
        let accessToken = AccessToken(withString: params3)
        XCTAssertNil(accessToken.accessTokenKey)
    }
    
    // MARK: - Access token 4
    
    func testAccessTokenKey_OnStringWithMultipleEqualChars_ReturnNil() {
        let accessToken = AccessToken(withString: params4)
        XCTAssertNil(accessToken.accessTokenKey)
    }
    
    // MARK: - Access token 5
    
    func testAccessTokenKey_OnStringWithMultipleEqualCharsAndValidKey_ReturnNil() {
        let accessToken = AccessToken(withString: params5)
        XCTAssertNil(accessToken.accessTokenKey)
    }
    
    // MARK: - Access token 6
    
    func testAccessTokenKey_OnStringWithValidKey_ReturnEmptyString() {
        let accessToken = AccessToken(withString: params6)
        XCTAssertEqual(accessToken.accessTokenKey, "")
    }
    
    // MARK: - Access token 7
    
    func testAccessTokenKey_OnStringWithValidKeyAndMultipleAndChars_ReturnEqual() {
        let accessToken = AccessToken(withString: params7)
        XCTAssertEqual(accessToken.accessTokenKey, "accesstokenvalue")
    }
    
    // MARK: - Access token 8
    
    func testAccessTokenKey_OnStringWithReplacedAndWithEqualChars_ReturnNil() {
        let accessToken = AccessToken(withString: params8)
        XCTAssertNil(accessToken.accessTokenKey)
    }
    
    // MARK: - Access token 9
    
    func testAccessTokenKey_OnStringWithoutAccessToken_ReturnNil() {
        let accessToken = AccessToken(withString: params9)
        XCTAssertNil(accessToken.accessTokenKey)
    }
    
    func testScope_OnStringWithoutAccessToken_ReturnNotNil() {
        let accessToken = AccessToken(withString: params9)
        XCTAssertNotNil(accessToken.scope)
    }
    
    // MARK: - Access token 10
    
    func testAccessToken_OnValidString_ReturnNotNilValues() {
        let accessToken = AccessToken(withString: params10)

        XCTAssertNotNil(accessToken.accessTokenKey)
        XCTAssertNotNil(accessToken.scope)
        XCTAssertNotNil(accessToken.tokenType)
    }
    
    
}
