//
//  LoginValidator.swift
//  DJWaveCow
//
//  Created by  on 2025/12/15.
//


import UIKit

struct DULIOSIASTALoginValidator {
    
    static func DULIOSIASTAvalidateLoginCredentials(DULIOSIASTAemail: String?,
                                       DULIOSIASTApassword: String?,
                                       DULIOSIASTAisEULAAccepted: Bool) -> (isValid: Bool, errorMessage: String?) {
        // 1. Check empty fields
        guard let DULIOSIASTAemail = DULIOSIASTAemail, !DULIOSIASTAemail.isEmpty else {
            return (false, "🎛️ Email field can't be empty. We need your frequency to connect!")
        }
        
        guard let DULIOSIASTApassword = DULIOSIASTApassword, !DULIOSIASTApassword.isEmpty else {
            return (false, "🔊 Password required to access the soundboard!")
        }
        
        // 2. Validate email format
        if !isDULIOSIASTAValidDULIOSIASTAEmail(DULIOSIASTAemail) {
            return (false, "📡 Invalid email format. Check your signal connection!")
        }
        
        // 3. Check password strength (basic)
        if DULIOSIASTApassword.count < 8 {
            return (false, "🎚️ Weak password! Needs at least 8 characters to drop the bass!")
        }
        
        // 4. Verify EULA acceptance
        if !DULIOSIASTAisEULAAccepted {
            return (false, "📜 You must accept the Beat License Agreement to join the mix!")
        }
        
        return (true, nil)
    }
    
    private static func isDULIOSIASTAValidDULIOSIASTAEmail(_ email: String) -> Bool {
        let emailDULIOSIASTARegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPDULIOSIASTAredicate = NSPredicate(format: "SELF MATCHES %@", emailDULIOSIASTARegex)
        return emailPDULIOSIASTAredicate.evaluate(with: email)
    }
}
