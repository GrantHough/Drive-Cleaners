//
//  ListingsViewModel.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import Combine

final class OfferListViewModel: ObservableObject {
    @Published var offerRepo = OfferRepository()
    @Published var offers: [Offer] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        offerRepo.$offers
            .assign(to: \.offers, on: self)
            .store(in: &cancellables)
    }
    
    func add(_ offer: Offer) {
        offerRepo.add(offer)
    }
    
}
