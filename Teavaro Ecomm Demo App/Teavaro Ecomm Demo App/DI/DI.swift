//
//  DI.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 23/06/2022.
//

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { CheckoutViewModel() }
    }
}
