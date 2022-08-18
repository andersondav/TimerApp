//
//  Exercise.swift
//  timer
//
//  Created by Anderson David on 8/17/22.
//

import Foundation

public class Exercise: NSObject, NSSecureCoding {
    public static let placeholder = Exercise(creationDate: Date(), name: "", desc: nil)
    
    public static var supportsSecureCoding: Bool = true
    
    public func encode(with coder: NSCoder) {
        coder.encode(creationDate, forKey: keys.creationDate.rawValue)
        coder.encode(name, forKey: keys.name.rawValue)
        
        if (desc != nil) {
            coder.encode(desc, forKey: keys.desc.rawValue)
        }
    }
    
    public required convenience init?(coder: NSCoder) {
        var decodedCreationDate: Date = Date()
        if let decodedNSDate = coder.decodeObject(of: NSDate.self, forKey: keys.creationDate.rawValue) {
            decodedCreationDate = decodedNSDate as Date
        }
        
        let decodedName: String = coder.decodeObject(forKey: keys.name.rawValue) as? String ?? ""
        
        var decodedDesc: String? = nil
        if (coder.containsValue(forKey: keys.desc.rawValue)) {
            decodedDesc = coder.decodeObject(forKey: keys.desc.rawValue) as? String ?? ""
        }
        
        self.init(creationDate: decodedCreationDate, name: decodedName, desc: decodedDesc)
    }
    
    enum keys: String {
        case creationDate = "creationDate"
        case name = "name"
        case desc = "desc"
    }
    
    public var creationDate: Date
    public var name: String
    public var desc: String?
    
    public init(creationDate: Date, name: String, desc: String? = nil) {
        self.creationDate = creationDate
        self.name = name
        self.desc = desc
    }
}
