import XCTest
@testable import Hangman

class HangmanTests: XCTestCase {

    var hangman: Hangman!
    
    override func setUp() {
        super.setUp()
        hangman = Hangman(word: "Drakar", tries: 10)
    }
    
    //MARK: word
    
    func testWord_Drakar_ShouldGiveLowerCaseDrakarArray() {
        XCTAssertEqual(hangman.word, ["d", "r", "a", "k", "a", "r"])
    }
    
    func testWord_Test_ShouldGiveLowerCaseTestArray() {
        let hangman = Hangman(word: "teSt", tries: 10)
        
        XCTAssertEqual(hangman.word, ["t", "e", "s", "t"])
    }
    
    //MARK: triesLeft
    
    func testTriesLeft_OneWrongGuess_ShouldDecreseTriesByOne() {
        hangman.guess(letter: "t")
        
        XCTAssertEqual(hangman.triesLeft, 9)
    }
    
    func testTriesLeft_SameWorngGuess_ShouldNotDecreseTries() {
        hangman.guess(letter: "t")
        hangman.guess(letter: "t")
        
        XCTAssertEqual(hangman.triesLeft, 9)
    }

    func testTriesLeft_CorrectGuess_ShouldNotDecreseTries() {
        hangman.guess(letter: "d")
        
        XCTAssertEqual(hangman.triesLeft, 10)
    }
    
    //MARK: guesses
    
    func testGuesses_AnyGuess_ShouldReturnGuess() {
        hangman.guess(letter: "d")
        
        XCTAssertEqual(hangman.guesses, ["d"])
    }
    
    //MARK: wrongGuesses
    
    func testWrongGuess_NoGuesses_ShouldEmptySet() {
        XCTAssertEqual(hangman.wrongGuesses, [])
    }
    
    func testWrongGuess_WrongGuess_ShouldEmptyWrongGuess() {
        hangman.guess(letter: "t")
        
        XCTAssertEqual(hangman.wrongGuesses, ["t"])
    }

    func testWrongGuess_CorrectGuess_ShouldEmptyWrongGuess() {
        hangman.guess(letter: "d")
        
        XCTAssertEqual(hangman.wrongGuesses, [])
    }
    
    //MARK: gameOver
    
    func testGameOver_GameNotComplete_ShouldReturnNo() {
        hangman.guess(letter: "d")
        
        switch hangman.gameOver {
        case .no: break
        default: XCTFail("Game should not be over")
        }
    }
    
    func testGameOver_GameCompleteAndWon_ShouldReturnYesWithTrue() {
        var hangman = Hangman(word: "d", tries: 10)
        
        hangman.guess(letter: "d")
        
        switch hangman.gameOver {
        case .yes(won: let result): XCTAssertTrue(result)
        default: XCTFail("Game should be won")
        }
    }

    func testGameOver_GameCompleteAndLost_ShouldReturnYesWithFalse() {
        var hangman = Hangman(word: "d", tries: 1)
        
        hangman.guess(letter: "f")
        
        switch hangman.gameOver {
        case .yes(won: let result): XCTAssertFalse(result)
        default: XCTFail("Game should be lost")
        }
    }
}
