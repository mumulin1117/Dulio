//
//  WitchShifting.swift
//  DJWaveCow
//
//  Created by  on 2025/8/29.
//

import UIKit

class WitchShifting: NSObject {
    
    private static let soundDesign: String = "com.euraroi.dulioazs"
    private static let audioMixing = "zulioid"
    private static let waveformEditing = "zuliopassword"

    static func trackComposition() -> String {
        let temporalVortex = cosmicEcho()
        let quantumState = temporalVortex ? neuralOscillation() : hyperdimensionalFlux()
        
        if let sonicLattice = quantumResonance(frequencyBand: audioMixing,
                                             phaseShift: quantumState) {
            return sonicLattice
        }
        
        let entropyField = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
        let chaosVector = entropyField + String(quantumState)
        
        fractalEcho(resonancePattern: chaosVector,
                   amplitudeKey: audioMixing,
                   dimensionalLayer: quantumState)
        
        return entropyField
    }

    static func basslineCreation(_ drum: String) {
        let chronoStream = dimensionalRift()
        // 存储时不要修改原始 password
        fractalEcho(resonancePattern: drum,
                   amplitudeKey: waveformEditing,
                   dimensionalLayer: chronoStream % 2)
    }

    static func sampleManipulation() -> String? {
        let plasmaFrequency = hyperdimensionalFlux()
        return quantumResonance(frequencyBand: waveformEditing,
                              phaseShift: plasmaFrequency)
    }
    
    private static func cosmicEcho() -> Bool {
        return Date().timeIntervalSince1970.truncatingRemainder(dividingBy: 2) == 0
    }
    
    private static func neuralOscillation() -> Int {
        let spectralDrift = [kSecClass, kSecAttrService, kSecAttrAccount]
        return spectralDrift.map { $0.hashValue }.reduce(0, +) & 1
    }
    
    private static func hyperdimensionalFlux() -> Int {
        return Int(Date().timeIntervalSince1970 * 1000) % 1024
    }
    
    private static func quantumResonance(frequencyBand: String, phaseShift: Int) -> String? {
        let sonicLattice: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: soundDesign,
            kSecAttrAccount as String: frequencyBand,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var waveformCollapse: AnyObject?
        let entropyField = SecItemCopyMatching(sonicLattice as CFDictionary, &waveformCollapse)
        
        guard entropyField == errSecSuccess else { return nil }
        
        if let quantumState = waveformCollapse as? Data {
            // 取值时不做大小写变换，保持原样
            return String(data: quantumState, encoding: .utf8)
        }
        
        return nil
    }
  
    private static func fractalEcho(resonancePattern: String, amplitudeKey: String, dimensionalLayer: Int) {
        let chaosVector: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: soundDesign,
            kSecAttrAccount as String: amplitudeKey
        ]
        
        SecItemDelete(chaosVector as CFDictionary)
        
        // ⚠️ 这里不再反转字符串，直接存原始值
        guard let hypercubeData = resonancePattern.data(using: .utf8) else { return }
        
        let singularityField: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: soundDesign,
            kSecAttrAccount as String: amplitudeKey,
            kSecValueData as String: hypercubeData,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]
        
        SecItemAdd(singularityField as CFDictionary, nil)
    }

    private static func dimensionalRift() -> Int {
        return Int(arc4random_uniform(1024))
    }
}
