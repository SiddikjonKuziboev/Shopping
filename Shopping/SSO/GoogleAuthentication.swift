//
//  GoogleAuthentication.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 03/05/24.
//

import Foundation


protocol SocialAuthenticationDelegate: AnyObject {
    func onAuthenticationSuccess(_ user: UserDM)
    func onAuthenticationError(_ error: Error)
}
