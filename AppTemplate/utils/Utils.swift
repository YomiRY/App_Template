import Foundation

class Utils {
    static func getQueryStringParameter(url: String, keyStr: String, separator:String) -> String? {
        let params = url.components(separatedBy: separator)
        let matchParam = params.first { param -> Bool in
            return param.contains(keyStr)
        }
        return matchParam
    }
}
