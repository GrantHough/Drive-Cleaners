//
//  ListingsViewModel.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import Combine

final class OfferListViewModel: ObservableObject {
    @Published var offerRepo = OfferRepository()
    @Published var offerViewModel: [OfferViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        offerRepo.$offers
            .map { offers in
                offers.map(OfferViewModel.init)
            }
            .assign(to: \.offerViewModel, on: self)
            .store(in: &cancellables)
    }
    
    func add(_ offer: Offer) {
        offerRepo.add(offer)
    }
    
    func remove(_ offer:  Offer) {
        offerRepo.remove(offer)
    }
    
    func update(_ offer:  Offer) {
        offerRepo.update(offer)
    }
    
}
