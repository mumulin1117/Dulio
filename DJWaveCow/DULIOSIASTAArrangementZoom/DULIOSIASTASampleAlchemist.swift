//
//  DULIOSIASTASampleAlchemist.swift
//  DJWaveCow
//
//  Created by  on 2025/6/9.
//

import UIKit

final class DULIOSIASTASampleAlchemist {
    private var sampleDNAPool: [DULIOSIASTASampleStrand] = []
    private let maxMutatedVariants = 3
    
  
    
    
}
struct DULIOSIASTASampleStrand {
    let idDULIOSIASTA: String
    let waveDULIOSIASTAformDNA: [Float]
    let bpmDULIOSIASTARange: ClosedRange<Int>
    let mutationDULIOSIASTACount: Int
    
    var isPrimeDULIOSIASTAStrain: Bool { mutationDULIOSIASTACount == 0 }
}
