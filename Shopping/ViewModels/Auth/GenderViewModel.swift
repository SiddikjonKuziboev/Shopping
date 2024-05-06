//
//  GenderViewModel.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 06/05/24.
//

import Foundation

class GenderViewModel: ObservableObject {
    @Published var isMale: Bool? = nil {
        didSet {
            next = true
        }
    }
    @Published var isSkipe: Bool = false {
        didSet {
            next = true
        }
    }
    @Published var next: Bool = false
    
    
    init() {}
    
    func skip() {
        isSkipe = true
    }
    
    func continueButton() {
        next = true
    }
    
}
