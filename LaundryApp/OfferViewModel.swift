//
//  OfferViewModel.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import Foundation
import Combine

final class OfferViewModel: ObservableObject, Identifiable {
    
    private let offerRepository = OfferRepository()
    @Published var offer: Offer
    var id = ""
    private var cancellables: Set<AnyCancellable> = []
   
    init(offer: Offer) {
        self.offer = offer
        $offer
            .compactMap{ $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
}
