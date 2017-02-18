typealias Counter = UInt
typealias Word = [Letter]
typealias Letter = Character
typealias Letters = Set<Letter>

struct Hangman {
    enum Result {
        case no
        case yes(won: Bool)
    }
    
    let word: Word
    let tries:  Counter
    var guesses: Letters = []
    
    var wrongGuesses: Letters {
        return guesses.subtracting(word)
    }
    
    var triesLeft: Counter {
        return tries - UInt(wrongGuesses.count)
    }
    
    var gameOver: Result {
        if guesses.isSuperset(of: word) || triesLeft == 0 {
            return .yes(won: triesLeft != 0)
        }
        return .no
    }

    init(word: String, tries: Counter) {
        self.word = Array(word.lowercased().characters)
        self.tries = tries
    }

    mutating func guess(letter: Letter) {
        guesses.insert(letter.lowercase)
    }
}
