import XCTest
@testable import Hangman

class CharacterExtensionTests: XCTestCase {
    
    func testLowercase_B_ShouldReturnLowerCaseB() {
        XCTAssertEqual(Character("B").lowercase, "b")
    }
    
    func testLowercase_2_ShouldReturn2() {
        XCTAssertEqual(Character("2").lowercase, "2")
    }
}
