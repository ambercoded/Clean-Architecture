//
//  Interactors.swift
//  CleanArchitecture
//
//  Created by Adrian on 12.01.21.
//
/* a struct that groups all interactor protocols (not the concrete implementations).
interactors represent the business logic layer of the app. they are used by views and they can talk to the model.
interactors receive requests for performing work (e.g. compute something or load data from external source). locally-relevant results are treated differently from results with app-wide relevance.
 results with app-wide relevance are not returned directly to the view. they are sent to the AppState. results with local relevance (only a specific view needs them) are sent back to a binding to a property in that view. that local data doesn't have to pollute the AppState. */

import Foundation

struct Interactors {}
