import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        
        var countArr = [String]()
        var repeatCount = ""
        var wordArr = [String]()
        var result = ""
        
        for element in message {
            if element.isNumber {
                repeatCount = "\(repeatCount)\(element)"
            }
            if element == "[" {
                if repeatCount == "" {
                    countArr.append("1")
                } else {
                    countArr.append(repeatCount)
                }
                repeatCount = ""
                wordArr.append(result)
                result = ""
            }
            if element == "]" {
                var tempString = ""
                if let counts = Int(countArr.popLast() ?? "1") {
                    for _ in 0..<counts {
                        tempString += result
                    }
                }
                result = wordArr.popLast()! + tempString
            } else if element.isLetter {
                result += String(element)
            }
        }
        
        return result
    }
}
