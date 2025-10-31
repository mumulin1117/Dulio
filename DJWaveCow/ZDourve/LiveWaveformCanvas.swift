//
//  LiveWaveformCanvas.swift
//  DJWaveCow
//
//  Created by  on 2025/10/31.
//
import AVFAudio
import UIKit
class LiveWaveformCanvas: UIView {
    weak var waveformDelegate: WaveformDelegate?
    func animateWaveforms(_ waveforms: [AudioWaveform]) {}
    func pulseWithTempo(_ tempo: Float) {}
    func addBeatLayer(_ layer: BeatLayer) {}
    func previewWaveform(for sample: AudioSample) {}
    func updateTempo(_ tempo: Float) {}
    func updateLayerVisibility(_ index: Int) {}
    func applyFilterEffect(_ filter: AudioFilter) {}
    func highlightWaveform(_ waveform: AudioWaveform) {}
    func resetHighlight() {}
    func clearAllLayers() {}
}
class BeatLayer {
    let sample: AudioSample
    var isMuted: Bool = false
    
    init(sample: AudioSample) {
        self.sample = sample
    }
}

struct AudioSample {
    let name: String
    let duration: TimeInterval
}
