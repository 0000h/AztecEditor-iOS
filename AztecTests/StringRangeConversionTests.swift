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

    func testRangeConversion1() {
        let nsString: NSString = "Hello World!"
        let string: String = nsString as String

        let wordToCapture = "World"
        let nsRange = nsString.range(of: wordToCapture)
        let range = string.range(from: nsRange)

        let wordCaptured = string.substring(with: range!)

        XCTAssertEqual(wordToCapture, wordCaptured)
    }

    func testRangeConversion2() {
        let nsString: NSString = "Hello 🌍!"
        let string: String = nsString as String

        let wordToCapture = "🌍"
        let nsRange = nsString.range(of: wordToCapture)
        let range = string.range(from: nsRange)

        let wordCaptured = string.substring(with: range!)

        XCTAssertEqual(wordToCapture, wordCaptured)
    }

    func testRangeConversion3() {
        let nsString: NSString = "Hello 🇮🇳!"
        let string: String = nsString as String

        let wordToCapture = "🇮🇳"
        let nsRange = nsString.range(of: wordToCapture)
        let range = string.range(from: nsRange)

        let wordCaptured = string.substring(with: range!)

        XCTAssertEqual(wordToCapture, wordCaptured)
    }

    func testRangeConversion4() {
        let nsString: NSString = "Hello 🇮🇳 🌍!"
        let string: String = nsString as String

        let wordToCapture = "🌍"
        let nsRange = nsString.range(of: wordToCapture)
        let range = string.range(from: nsRange)

        let wordCaptured = string.substring(with: range!)

        XCTAssertEqual(wordToCapture, wordCaptured)
    }

    func testLocationConversion1() {
        // test simple word
        let nsString: NSString = "Hello World!"
        let string: String = nsString as String

        let wordToCapture = "World"
        let nsRange = nsString.range(of: wordToCapture)
        let index = string.indexFromLocation(nsRange.location)!

        let wordCaptured = string.substring(to: index)

        XCTAssertEqual("Hello ", wordCaptured)
    }

    func testLocationConversion2() {
        let nsString: NSString = "Hello 🌍!"
        let string: String = nsString as String

        let wordToCapture = "🌍"
        let nsRange = nsString.range(of: wordToCapture)
        let index = string.indexFromLocation(nsRange.location)!

        let wordCaptured = string.substring(to: index)

        XCTAssertEqual("Hello ", wordCaptured)
    }

    func testLocationConversion3() {
        let nsString: NSString = "Hello 🇮🇳!"
        let string: String = nsString as String

        let wordToCapture = "🇮🇳"
        let nsRange = nsString.range(of: wordToCapture)
        let index = string.indexFromLocation(nsRange.location)!

        let wordCaptured = string.substring(to: index)

        XCTAssertEqual("Hello ", wordCaptured)
    }

    func testLocationConversion4() {
        let nsString: NSString = "Hello 🇮🇳 🌍!"
        let string: String = nsString as String

        let wordToCapture = "🌍"
        let nsRange = nsString.range(of: wordToCapture)
        let index = string.indexFromLocation(nsRange.location)!

        let wordCaptured = string.substring(to: index)

        XCTAssertEqual("Hello 🇮🇳 ", wordCaptured)
    }

    func testLocationBefore1() {
        let nsString: NSString = "Hello World!"
        let string: String = nsString as String

        let wordToCapture = "World"
        let nsRange = nsString.range(of: wordToCapture)
        let location = string.location(before: nsRange.location)!
        let index = string.indexFromLocation(location)!
        let wordCaptured = string.substring(to: index)

        XCTAssertEqual("Hello", wordCaptured)
    }

    func testLocationBefore2() {
        let nsString: NSString = "Hello 🌍!"
        let string: String = nsString as String

        let wordToCapture = "🌍"
        let nsRange = nsString.range(of: wordToCapture)
        let location = string.location(before: nsRange.endLocation)!
        let index = string.indexFromLocation(location)!
        let wordCaptured = string.substring(to: index)

        XCTAssertEqual("Hello ", wordCaptured)
    }

    func testLocationBeforeAtLimits() {
        // test at start of string
        let string = ""
        let nonExistentLocation = string.location(before: 0)
        XCTAssertNil(nonExistentLocation)
    }

    func testLocationAfterAtLimits() {
        // test at start of string
        let string = ""
        let nonExistentLocation = string.location(after: 0)
        XCTAssertNil(nonExistentLocation)
    }

    /// Tests that converting a range back and forth works.
    ///
    /// Input:
    ///     - String is: "Hello world!"
    ///     - NSRange is: range of "Hello"
    ///
    /// Expected Output:
    ///     - The range will be converted to a range and back, the final NSRange should stay the
    ///         same.
    ///
    func testNSRangeFromRange1() {
        let string = "Hello world!"
        let nsRange = (string as NSString).range(of: "Hello")

        guard let range = string.range(from: nsRange) else {
            XCTFail("Range conversion failed!")
            return
        }

        let finalNSRange = string.nsRange(from: range)

        XCTAssertEqual(nsRange, finalNSRange)
    }

    /// Tests that converting a range back and forth works.
    ///
    /// Input:
    ///     - String is: "Hello 😬 world!"
    ///     - NSRange is: (loc: 5, len: 3)
    ///
    /// Expected Output:
    ///     - The range will be converted to a range and back, the final NSRange should stay the
    ///         same.
    ///
    func testNSRangeFromRange2() {
        let nsRange = NSRange(location: 5, length: 3)
        let string = "Hello world!"

        guard let range = string.range(from: nsRange) else {
            XCTFail("Range conversion failed!")
            return
        }

        let finalNSRange = string.nsRange(from: range)

        XCTAssertEqual(nsRange, finalNSRange)
    }

    /// Tests that converting a range back and forth works.
    ///
    /// Input:
    ///     - String is: "Hello 😬 world!"
    ///     - NSRange is: (loc: 5, len: 3)
    ///
    /// Expected Output:
    ///     - The range will be converted to a range and back, the final NSRange should stay the
    ///         same.
    ///
    func testNSRangeFromRange3() {
        let string = "Hello 🌎!"
        let nsRange = (string as NSString).range(of: "🌎")

        guard let range = string.range(from: nsRange) else {
            XCTFail("Range conversion failed!")
            return
        }

        let finalNSRange = string.nsRange(from: range)

        XCTAssertEqual(nsRange, finalNSRange)
    }
    
}
