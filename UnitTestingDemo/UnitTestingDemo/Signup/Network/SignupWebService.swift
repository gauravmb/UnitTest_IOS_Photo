//
//  SignupWebService.swift
//  UnitTestingDemo
//
//  Created by M1092828 on 23/09/22.
//

import Foundation

class SignupWebService:SignupWebServiceProtocol{
    
    private var urlString:String;
    private var urlSession:URLSession
    
    init(urlString:String,urlSession:URLSession = .shared)
    {
        self.urlString=urlString;
        self.urlSession=urlSession;
    }
    
    func signup(withForm formModel:SignupRequestModel, completionHandler:@escaping (SignupResponseModel?,SignupError?)->Void){
        guard let url = URL(string: urlString) else{
            
            completionHandler(nil, SignupError.requestInvalidURLString)
            //TODO : Create a unit test to test invalid url string
            return
        }
        var request = URLRequest(url: url);
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let datatask = urlSession.dataTask(with: request) { data, response, error in
            //TODO : Write a new unit test to handle and error here
            if let error = error {
                completionHandler(nil,SignupError.failedRequest(description: error.localizedDescription))
            }
            
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data){
                completionHandler(signupResponseModel,nil)
            }else{
                completionHandler(nil,SignupError.responseModelParsingError)
                //TODO : Write a new unit test to handle and error here
            }
        }
        datatask.resume()
    }
    
}
