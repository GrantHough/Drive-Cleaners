//
//  Offer.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Offer: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var address: String
    var folding: Bool =  false
}
