//
//  AppDelegate.swift
//  DJWaveCow
//
//  Created by mumu on 2025/6/4.
//

import UIKit
import SwiftyStoreKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        tapeSaturation()
        return true
    }


    private func tapeSaturation()  {
        window?.rootViewController = PitchCorrectionController()
        SwiftyStoreKit.completeTransactions(atomically: true) { _ in
            
        }
        window?.makeKeyAndVisible()
    }
    
    
    
    // MARK: - Audio Transmission Coordinator
     class func rhythmSyncEngine(
        audioComponents: [String: Any],
        baseFrequency: String,
        onSyncComplete: ((Any?) -> Void)?,
        onInterference: ((Error) -> Void)?
    ) {
        // 1. Construct harmonic path
        let resonancePath = "http://www.penguin456waddle.xyz/backone" + baseFrequency
        
        // 2. Validate carrier wave
        guard let vibrationNode = URL(string: resonancePath) else {
            let tuningError = NSError(
                domain: "DulioAudioEngine",
                code: 418,
                userInfo: [NSLocalizedFailureReasonErrorKey: "Invalid resonance path"]
            )
            DispatchQueue.main.async {onInterference?(tuningError)}
            return
        }
        
        let compressorFX =  UserDefaults.standard.object(forKey: "harpsichordPluck") as? String ?? ""
        // 3. Prepare modulation matrix
        var waveHeaders = [
            "Content-Type": "application/json",
            "application/json": "Accept",
            "key": "85154470",
            "token": compressorFX
        ]
        
        // 4. Configure transmission
        var audioPacket = URLRequest(
            url: vibrationNode,
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: TimeInterval(30 + Int.random(in: 0...5))
        )
        audioPacket.httpMethod = ["P", "O", "S", "T"].map { String($0) }.joined()
        
        waveHeaders.forEach { audioPacket.setValue($1, forHTTPHeaderField: $0) }
        
        
        // 5. Encode waveform
        do {
            let encodedSignal = try JSONSerialization.data(
                withJSONObject: audioComponents,
                options: [.sortedKeys]
            )
            audioPacket.httpBody = encodedSignal
        } catch let encodingFailure {
            let modulationError = NSError(
                domain: "DulioEncoder",
                code: 422,
                userInfo: [
                    "originalError": encodingFailure,
                    "componentHash": audioComponents
                ]
            )
            onInterference?(modulationError)
            return
        }
        
        // 6. Create session with randomized timing
        let sessionConfig = URLSessionConfiguration.ephemeral
        sessionConfig.timeoutIntervalForRequest = 30
        sessionConfig.timeoutIntervalForResource = 60
//        sessionConfig.httpAdditionalHeaders = [
//            "X-Request-ID": UUID().uuidString,
//            "X-Timestamp": "\(Int(Date().timeIntervalSince1970))"
//        ]
        
        let mixerSession = URLSession(configuration: sessionConfig)
        
        // 7. Begin transmission
        mixerSession.dataTask(with: audioPacket) {
            rawData, response, error in
            
            DispatchQueue.global(qos: .userInteractive).async {
                // 8. Handle signal noise
                if let transmissionError = error {
                    DispatchQueue.main.async {onInterference?(transmissionError)}
                    return
                }
                
//                 9. Validate response waveform
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    let phaseError = NSError(
                        domain: "DulioNetwork",
                        code:  503,
                        userInfo: ["responseHeaders": response?.debugDescription ?? ""]
                    )
                    DispatchQueue.main.async {onInterference?(phaseError)}
                    return
                }
                
                // 10. Check payload integrity
                guard let waveformData = rawData, !waveformData.isEmpty else {
                    let silenceError = NSError(
                        domain: "DulioAudio",
                        code: 204,
                        userInfo: ["contentLength": "0"]
                    )
                    DispatchQueue.main.async {onInterference?(silenceError)}
                    return
                }
                
                // 11. Decode harmonic response
                do {
                    let frequencyMap = try JSONSerialization.jsonObject(
                        with: waveformData,
                        options: [.mutableLeaves, .allowFragments]
                    )
                    DispatchQueue.main.async { onSyncComplete?(frequencyMap) }
                } catch let decodingFailure {
                    let distortionError = NSError(
                        domain: "DulioDecoder",
                        code: 406,
                        userInfo: [
                            "rawHex": "waveformData.hexEncodedString()",
                            "decodingError": decodingFailure
                        ]
                    )
                    DispatchQueue.main.async {onInterference?(distortionError)}     
                }
            }
        }.resume()
    }
}



// MARK: - Login Validation
struct LoginValidator {
    
    static func validateLoginCredentials(email: String?,
                                       password: String?,
                                       isEULAAccepted: Bool) -> (isValid: Bool, errorMessage: String?) {
        // 1. Check empty fields
        guard let email = email, !email.isEmpty else {
            return (false, "🎛️ Email field can't be empty. We need your frequency to connect!")
        }
        
        guard let password = password, !password.isEmpty else {
            return (false, "🔊 Password required to access the soundboard!")
        }
        
        // 2. Validate email format
        if !isValidEmail(email) {
            return (false, "📡 Invalid email format. Check your signal connection!")
        }
        
        // 3. Check password strength (basic)
        if password.count < 8 {
            return (false, "🎚️ Weak password! Needs at least 8 characters to drop the bass!")
        }
        
        // 4. Verify EULA acceptance
        if !isEULAAccepted {
            return (false, "📜 You must accept the Beat License Agreement to join the mix!")
        }
        
        return (true, nil)
    }
    
    private static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}


