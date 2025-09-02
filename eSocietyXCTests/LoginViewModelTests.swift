//
//  LoginViewModelTests.swift
//  eSociety
//
//  Created by Meheboob on 02/09/25.
//

import XCTest
@testable import eSociety


@MainActor
final class LoginViewModelTests: XCTestCase {
    private var viewModel: LoginViewModel!

    override func setUp() async throws {
        viewModel = LoginViewModel()
    }

    override func tearDown() async throws {
        viewModel = nil
    }

    // MARK: - Mutation Tests

    func testEmailMutation() {
        viewModel.email = "meheboob@example.com"
        XCTAssertEqual(viewModel.email, "meheboob@example.com")
    }

    func testPasswordMutation() {
        viewModel.password = "StrongPass123!"
        XCTAssertEqual(viewModel.password, "StrongPass123!")
    }

    // MARK: - Validation Tests

    func testValidEmail() {
        viewModel.email = "meheboob@example.com"
        XCTAssertTrue(viewModel.isEmailValid)
    }

    func testInvalidEmail() {
        viewModel.email = "invalid-email"
        XCTAssertFalse(viewModel.isEmailValid)
    }

    func testValidPassword() {
        viewModel.password = "Swift1234"
        XCTAssertTrue(viewModel.isPasswordValid)
    }

    func testInvalidPassword() {
        viewModel.password = "123"
        XCTAssertFalse(viewModel.isPasswordValid)
    }

    func testFormValid() {
        viewModel.email = "meheboob@example.com"
        viewModel.password = "Swift1234"
        XCTAssertTrue(viewModel.isFormValid)
    }

    func testFormInvalid() {
        viewModel.email = "bad"
        viewModel.password = "123"
        XCTAssertFalse(viewModel.isFormValid)
    }

}

