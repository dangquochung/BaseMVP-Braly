//
//  RealmExtensions.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import RealmSwift

extension URL: FailableCustomPersistable {

    public typealias PersistedType = String
    // Construct an instance of the mapped type from the persisted type.
    // When reading from the database, this converts the persisted type to the mapped type.
    // This must be a failable initilizer when the conversion may fail.
    public init?(persistedValue: String) { self.init(string: persistedValue) }
    // Construct an instance of the persisted type from the mapped type.
    // When writing to the database, this converts the mapped type to a persistable type.
    public var persistableValue: String { self.absoluteString }

}
