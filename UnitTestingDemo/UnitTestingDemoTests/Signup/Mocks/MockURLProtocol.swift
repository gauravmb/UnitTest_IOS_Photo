//
//  MockURLProtocol.swift
//  UnitTestingDemoTests
//
//  Created by M1092828 on 23/09/22.
//

import Foundation

class MockURLProtocol:URLProtocol{
    
    static var stubResponseData:Data?
    static var error:Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        if let error = MockURLProtocol.error {
            self.client?.urlProtocol(self, didFailWithError: error)
        }
        else{
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        self.client?.urlProtocolDidFinishLoading(self)

    }
    
    override func stopLoading() {
        
    }
    
}
        
