//
//  StellarOps.swift
//  StellarKit
//
//  Created by Kin Foundation.
//  Copyright © 2018 Kin Foundation. All rights reserved.
//

import Foundation

extension Operation {
    public static func createAccountOp(destination: String,
                                       balance: Int64,
                                       source: Account? = nil) -> Operation {
        let destPK = PublicKey.PUBLIC_KEY_TYPE_ED25519(WD32(KeyUtils.key(base32: destination)))

        var sourcePK: PublicKey? = nil
        if let source = source, let pk = source.publicKey {
            sourcePK = PublicKey.PUBLIC_KEY_TYPE_ED25519(WD32(KeyUtils.key(base32: pk)))
        }

        return Operation(sourceAccount: sourcePK,
                         body: Operation.Body.CREATE_ACCOUNT(CreateAccountOp(destination: destPK,
                                                                             balance: balance)))
    }

    public static func paymentOp(destination: String,
                                 amount: Int64,
                                 asset: Asset,
                                 source: Account? = nil) -> Operation {
        let destPK = PublicKey.PUBLIC_KEY_TYPE_ED25519(WD32(KeyUtils.key(base32: destination)))

        var sourcePK: PublicKey? = nil
        if let source = source, let pk = source.publicKey {
            sourcePK = PublicKey.PUBLIC_KEY_TYPE_ED25519(WD32(KeyUtils.key(base32: pk)))
        }

        return Operation(sourceAccount: sourcePK,
                         body: Operation.Body.PAYMENT(PaymentOp(destination: destPK,
                                                                asset: asset,
                                                                amount: amount)))

    }

    public static func changeTrustOp(asset: Asset, source: Account? = nil) -> Operation {
        var sourcePK: PublicKey? = nil
        if let source = source, let pk = source.publicKey {
            sourcePK = PublicKey.PUBLIC_KEY_TYPE_ED25519(WD32(KeyUtils.key(base32: pk)))
        }

        return Operation(sourceAccount: sourcePK,
                         body: Operation.Body.CHANGE_TRUST(ChangeTrustOp(asset: asset)))
    }
}
