import Foundation

public protocol Moat {
    var filterArray: [String] { get }
    var filterDict: [String:String] { get }
}

public func filtering(string: String, filterArray: Array<String>,
                      filterDict: Dictionary<String, String>,
                      replacingString: String = "", recursive: Int = 1) -> String {
    var cleanInput = string
    for _ in 0..<recursive {
        for (key, value) in filterDict where cleanInput.lowercased().contains(key)  {
            cleanInput = cleanInput.replacingOccurrences(of: key, with: value,
                                                         options: .caseInsensitive)
        }
        for item in filterArray where cleanInput.lowercased().contains(item)  {
            if replacingString == "*" {
                let censoredString = String(repeatElement("*", count: item.count))
                cleanInput = cleanInput.replacingOccurrences(of: item, with: censoredString, options: .caseInsensitive)
            } else {
                cleanInput = cleanInput.replacingOccurrences(of: item, with: replacingString, options: .caseInsensitive)
            }
        }
    }
    return cleanInput
}

extension String {
    public func xssFilter() -> String {
        let xss = XSSFilter()
        let cleanInput = filtering(string: self, filterArray: xss.filterArray, filterDict: xss.filterDict, recursive: 3)
        return cleanInput
    }
    
    public func profanityFilter() -> String {
        let profanity = ProtanityFilter()
        let cleanInput = filtering(string: self, filterArray: profanity.filterArray,
                                   filterDict: profanity.filterDict, replacingString: "*")
        return cleanInput
    }
    
    public func srcFilter() -> String {
        let src = SrcFilter()
        let cleanInput = filtering(string: self, filterArray: src.filterArray, filterDict: src.filterDict, recursive: 3)
        return cleanInput
    }
    
    public func htmlEncode() -> String {
        let htmlEncode = HtmlEncodeFilter()
        let cleanInput = filtering(string: self, filterArray: htmlEncode.filterArray, filterDict: htmlEncode.filterDict)
        return cleanInput
    }
}



