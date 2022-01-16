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
                guard let documents = snapshot?.documents else {
                      print("No documents")
                      return
                    }
                
//                self.offers = documents.map { snapshot -> Offer in
//
//                    let data = snapshot.data()
//                    let name = data["name"] as? String ?? ""
//                    let address = data["address"] as? String ?? ""
//                    let folding = data["folding"] as? Bool ?? false
//                    let drying = data["drying"] as? Bool ?? false
//                    let soapBrand = data["soapBrand"] as? String ?? ""
//                    let typeOfLoad = data["typeOfLoad"] as? String ?? ""
//
//                    return  Offer(name: name, address: address, folding: folding, drying: drying, soapBrand: soapBrand, typeOfLoad: typeOfLoad)
//
//
//                }
                self.offers = snapshot?.documents.compactMap { snapshot -> Offer? in try? snapshot.data(as: Offer.self)
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
    
    func update(_ offer: Offer) {
        guard let documentId = offer.id else { return }
        do {
            try store.collection(path)
                .document(documentId)
                .setData(from: offer)
        } catch {
            fatalError("Updating offer failed")
        }

    }
    
    func remove(_ offer: Offer) {
        guard let documentId = offer.id else { return }
        store.collection(path)
            .document(documentId).delete { error in
                if let error = error {
                    print("Unable to remove the offer: \(error.localizedDescription)")
                }
            }
    }
    
}
