/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model object representing the content of the Document.
*/

import Foundation
import Cocoa

private extension PlistKeys {
    
    static let prefix = PlistKey<String>("IDECodeSnippetCompletionPrefix")
    static let scopes = PlistKey<[Any]>("IDECodeSnippetCompletionScopes")
    static let contents = PlistKey<String>("IDECodeSnippetContents")
    static let identifier = PlistKey<String>("IDECodeSnippetIdentifier")
    static let language = PlistKey<String>("IDECodeSnippetLanguage")
    static let summary = PlistKey<String>("IDECodeSnippetSummary")
    static let title = PlistKey<String>("IDECodeSnippetTitle")
    static let userSnippet = PlistKey<Bool>("IDECodeSnippetUserSnippet")
    static let version = PlistKey<Int>("IDECodeSnippetVersion")
}

class Content: NSObject {
    @objc dynamic var contentString = ""
    
    public init(contentString: String) {
        self.contentString = contentString
    }
    
}

extension Content {
    
    func read(from url: URL) {
        let loader = JFPlistLoader(plistPath: url.relativePath)!
        let pre = loader.get(PlistKeys.prefix)
        let test = loader.get(PlistKeys.title)
        print(test)
    }
    
    func data() -> Data? {
        return contentString.data(using: .utf8)
    }
    
}
