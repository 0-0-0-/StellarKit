//
//  Errors.swift
//  StellarErrors
//
//  Created by Avi Shevin on 18/03/2018.
//  Copyright © 2018 Kin Foundation. All rights reserved.
//

import Foundation

public enum StellarError: Error {
    case memoTooLong (Any?)
    case missingAccount
    case missingPublicKey
    case missingHash
    case missingSequence
    case missingBalance
    case missingSignClosure
    case urlEncodingFailed
    case dataEncodingFailed
    case signingFailed
    case destinationNotReadyForAsset (Error, String?)
    case unknownError (Any?)
    case internalInconsistency
}
