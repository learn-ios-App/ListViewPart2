import SwiftUI

class Animal: Identifiable {
    let id = UUID()
    var name: String
    var check: Bool
    
    init(name: String, check: Bool) {
        self.name = name
        self.check = check
    }
}
