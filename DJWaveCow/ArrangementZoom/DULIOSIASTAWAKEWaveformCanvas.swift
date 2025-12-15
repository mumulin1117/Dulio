//
//  DULIOSIASTAWAKEWaveformCanvas.swift
//  DJWaveCow
//
//  Created by  on 2025/10/31.
//
import AVFAudio
import UIKit
class DULIOSIASTAWAKEWaveformCanvas: UIView {
    weak var DULIOSIASTAwaveformDelegate: DULIOSIASTAWaveformDelegate?
    func DULIOSIASTAanimateWaveforms(_ waveforms: [DULIOSIASTAClockWaveform]) {}
    func DULIOSIASTApulseWithTempo(_ tempo: Float) {}
    func DULIOSIASTAaddBeatLayer(_ layer: DULIOSIASTABeatLayer) {}
    func DULIOSIASTApreviewWaveform(for sample: DULIOSIASTAAudioSample) {}
    func DULIOSIASTAupdateTempo(_ tempo: Float) {}
    func DULIOSIASTAupdateLayerVisibility(_ index: Int) {}
    func DULIOSIASTAapplyFilterEffect(_ filter: DULIOSIASTAAudioFilter) {}
    func DULIOSIASTAhighlightWaveform(_ waveform: DULIOSIASTAClockWaveform) {}
    func DULIOSIASTAresetHighlight() {}
    func DULIOSIASTAclearAllLayers() {}
}
class DULIOSIASTABeatLayer {
    let sample: DULIOSIASTAAudioSample
    var isMuted: Bool = false
    
    init(sample: DULIOSIASTAAudioSample) {
        self.sample = sample
    }
}

struct DULIOSIASTAAudioSample {
    let DULIOSIASTAname: String
    let DULIOSIASTAduration: TimeInterval
}
