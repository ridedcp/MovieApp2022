//
//  File.swift
//
//
//  Created by Daniel Cano Platero on 21/6/22.
//
import XCTest

@testable import Domain
@testable import Data

final class SeriesRepositoryTest: XCTestCase {
    var netWorking: NetworkingInterface!
    var sut: SeriesRepositoryImpl!
    var session: URLSession!
    
    override func setUp() {
        netWorking = Networking()
        session = URLSession(configuration: .default)
        sut = SeriesRepositoryImpl(networking: networking, session: session)
    }
    
    override func tearDown() {
        netWorking = .none
        session = .none
        sut = .none
        super.tearDown()
    }
    
    func test_should_get_shows_from_api() {
        let shows = [
            Show(id: 0, name: "", image: ShowImage(medium: "", original: "")),
            Show(id: 0, name: "", image: ShowImage(medium: "", original: ""))
        ]
        
        // given
        sut.getShows.result = .success(shows)
        
        // when
        let captor = CompletionResultCaptor<[Show]>(testCase: self)
        sut.getShows(page: 1, completion: captor.capture())
        let result = captor.waitAndGet()
        
        // then
        XCTAssertNil(captor.error())
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.count, shows.count)
    
    }
}
