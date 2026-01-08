//
//  PIAConnect.swift
//  pia14iosjan8
//
//  Created by BillU on 2026-01-08.
//

import Foundation
import WatchConnectivity

@Observable class PIAConnect: NSObject, WCSessionDelegate {
    
    var messagetext = "NOMESSAGE"
    var isreachable: Bool = false
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func startconnect() {
        
        if(WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
    }
    
    func sendMessage(message: String) {
        
        var mymessage : [String : String] = ["mymessage": message]
        
        if(WCSession.isSupported()) {
            let session = WCSession.default
            session.sendMessage(mymessage, replyHandler: nil, errorHandler: nil)
        }
    }
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        messagetext = message["mymessage"] as! String
    }
    
    func sessionReachabilityDidChange(_ session: WCSession) {
        isreachable = WCSession.default.isReachable
    }
    
}
