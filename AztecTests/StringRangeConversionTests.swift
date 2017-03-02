import XCTest
@testable import Aztec

class StringRangeConversionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConversion() {
        // test simple word
        var nsString: NSString = "Hello World!"
        var string: String = nsString as String

        var wordToCapture = "World"
        var nsRange = nsString.range(of: wordToCapture)
        var range = string.rangeFromNSRange(nsRange)

        var wordCaptured = string.substring(with: range!)

        XCTAssertEqual(wordToCapture, wordCaptured)

        // test with emoji size 2
        nsString = "Hello 🌍!"
        string = nsString as String

        wordToCapture = "🌍"
        nsRange = nsString.range(of: wordToCapture)
        range = string.rangeFromNSRange(nsRange)

        wordCaptured = string.substring(with: range!)

        XCTAssertEqual(wordToCapture, wordCaptured)

        // test with emoji size 4
        nsString = "Hello 🇮🇳!"
        string = nsString as String

        wordToCapture = "🇮🇳"
        nsRange = nsString.range(of: wordToCapture)
        range = string.rangeFromNSRange(nsRange)

        wordCaptured = string.substring(with: range!)

        XCTAssertEqual(wordToCapture, wordCaptured)

        // test with two emojis
        nsString = "Hello 🇮🇳 🌍!"
        string = nsString as String

        wordToCapture = "🌍"
        nsRange = nsString.range(of: wordToCapture)
        range = string.rangeFromNSRange(nsRange)

        wordCaptured = string.substring(with: range!)

        XCTAssertEqual(wordToCapture, wordCaptured)
    }

    
}
