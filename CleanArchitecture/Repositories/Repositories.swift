//
//  Repositories.swift
//  CleanArchitecture
//
//  Created by Adrian on 12.01.21.
//
/* structs that group all Repository protocols. (not the concrete implementations).
 Repositories represent the "Data access layer". Repositories provide the API to talk to a local database or the backend. They are used to perform CRUD operations on a database or on the backend. they do not mutate AppState and also don't contain business logic. Repositories can only be accessed and used by Interactors.
 */

import Foundation

struct WebRepositories {}

struct DatabaseRepositories {}
