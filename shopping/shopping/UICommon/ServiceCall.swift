//
//  ServiceCall.swift
//  shopping
//
//  Created by CHOI on 8/1/24.
//

import SwiftUI
import UIKit

class ServiceCall {
    
    // MARK: POST 요청
    class func post(
        parameter: NSDictionary, url: String, isToken: Bool = false,
        onSuccess: @escaping ( (_ response: AnyObject? ) -> () ),
        onFailure: @escaping ( (_ error: Error?) -> () )
    ) {
        DispatchQueue.global(qos: .userInitiated).async {
            var request = URLRequest(url: URL(string: url)!,timeoutInterval: 100)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            request.httpMethod = "POST"
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
            } catch {
                print("Error: \(error.localizedDescription)")
                return
            }

            let task = URLSession.shared.dataTask(with: request) { resData, response, error in
                
                if let error = error {
                    DispatchQueue.main.async {
                        onFailure(error)
                    }
                } else {
                    if let resData = resData {
                        do {
                            let resultDictionary = try JSONSerialization.jsonObject(with: resData, options: .mutableContainers) as? NSDictionary
                            
                            if let result = resultDictionary?.value(forKey: KKey.RESULT) as? NSDictionary {
                                if let data = result.value(forKey: KKey.DATA) as? NSDictionary {
                                    // MARK: 응답 반환
                                    DispatchQueue.main.async {
                                        onSuccess(data)
                                    }
                                } else {
                                    DispatchQueue.main.async {
                                        onFailure(error)
                                    }
                                }
                            } else {
                                DispatchQueue.main.async {
                                    onFailure(error)
                                }
                            }
                        } catch {
                            DispatchQueue.main.async {
                                onFailure(error)
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            onFailure(error)
                        }
                    }
                }
            }

            task.resume()
        }
    }
}
