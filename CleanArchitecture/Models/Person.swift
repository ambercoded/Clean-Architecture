//
//  Person.swift
//  CleanArchitecture
//
//  Created by Adrian on 12.01.21.
//
/* a model that represents a single contact. */

import Foundation

struct Person: Identifiable {
    var id = UUID()
    var name: String
    var phoneNumber: String
    var priority: Int
    var dateLastCalled: Date
}
