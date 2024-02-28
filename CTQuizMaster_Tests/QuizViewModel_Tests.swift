//
//  QuizViewModel_Tests.swift
//  CTQuizMaster_Tests
//
//  Created by Zachary on 28/2/24.
//

import XCTest
@testable import CTQuizMaster

final class QuizViewModel_Tests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @MainActor
    func test_QuizViewModel_fetchQuizes_returnsData() {
        // given
        let difficulty = "easy"
        let vm = QuizViewModel(difficulty: difficulty, tasks: [])
        
        // when
        vm.fetchQuizes()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // then
            XCTAssertNotNil(vm.quiz)
            
        }
        
    }
    
}
