//
//  Repository.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class OfferRepository: ObservableObject {
    private let path = "offers"
    private let store = Firestore.firestore()
    @Published var offers: [Offer] = []
    
    init() {
        getInfo()
    }
    
    func getInfo() {
        store.collection(path)
            .addSnapshotListener { (snapshot, error) in
                if let error = error {
                    print(error)
                    return
                }
                self.offers = snapshot?.documents.compactMap {
                    try? $0.data(as: Offer.self)
                } ?? []
            }
    }
    
    func add(_ offer: Offer) {
        do {
            _ = try store.collection(path)
                .addDocument(from: offer)
        } catch {
            fatalError("Creating and offer failed")
        }
    }
    
}
