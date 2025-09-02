//
//  LoginViewUITests.swift
//  eSociety
//
//  Created by Meheboob on 02/09/25.
//

import XCTest

final class LoginViewUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testLoginFlow_successfulLogin_showsToast() throws {
        // Access email and password fields
        let emailField = app.textFields["Email ID"] // Replace with localized string if needed
        let passwordField = app.secureTextFields["Password"] // Replace with localized string if needed

        // Enter valid credentials
        emailField.tap()
        emailField.typeText("codecat15@gmail.com")

        passwordField.tap()
        passwordField.typeText("StrongPass123")

        // Accept terms if needed
        let acceptTermsSwitch = app.switches["AcceptTerms"] // Add accessibilityIdentifier in your SwiftUI view
        if acceptTermsSwitch.exists {
            acceptTermsSwitch.tap()
        }

        // Tap login button
        let loginButton = app.buttons["Login"] // Replace with localized string if needed
        loginButton.tap()

        // Wait for toast or alert
        let toastMessage = app.staticTexts["✅ Login successful: codecat15"]
        let exists = toastMessage.waitForExistence(timeout: 5)
        XCTAssertTrue(exists, "Toast message should appear after successful login")
    }

    func testLoginFlow_invalidCredentials_showsAlert() throws {
        let emailField = app.textFields["Email ID"]
        let passwordField = app.secureTextFields["Password"]

        emailField.tap()
        emailField.typeText("wrong@example.com")

        passwordField.tap()
        passwordField.typeText("StrongPass123")

        let loginButton = app.buttons["Login"]
        loginButton.tap()

        let alert = app.alerts["Login Failed"]
        let exists = alert.waitForExistence(timeout: 5)
        XCTAssertTrue(exists, "Alert should appear for failed login")
    }
}
