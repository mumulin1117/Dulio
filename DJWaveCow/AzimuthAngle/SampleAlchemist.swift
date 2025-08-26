//
//  SampleAlchemist.swift
//  DJWaveCow
//
//  Created by  on 2025/6/9.
//

import UIKit

final class SampleAlchemist {
    private var sampleDNAPool: [SampleStrand] = []
    private let maxMutatedVariants = 3
    
  
    
    
}
struct SampleStrand {
    let id: String
    let waveformDNA: [Float]
    let bpmRange: ClosedRange<Int>
    let mutationCount: Int
    
    var isPrimeStrain: Bool { mutationCount == 0 }
}
