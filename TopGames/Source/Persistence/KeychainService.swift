//
//  KeychainService.swift
//  TopGames
//
//  Created by Bruno Luiz on 03/08/18.
//  Copyright © 2018 Bruno Luiz. All rights reserved.
//

import Foundation
import KeychainAccess

//**********************************************************************************************************
//
// MARK: - Class -
//
//**********************************************************************************************************

public final class KeychainService: NSObject {
    
    //*************************************************
    // MARK: - Properties
    //*************************************************
    
    private lazy var keychain: Keychain = Keychain(service: Bundle.main.bundleIdentifier ?? "edu.ibm.trainning.TopGames")
    
    //*************************************************
    // MARK: - Initializers
    //*************************************************
    
    private override init() { }
    
    public static let shared: KeychainService = {
        return KeychainService()
    }()
    
    //*************************************************
    // MARK: - Exposed Methods
    //*************************************************
    
    public func setValue(_ value: String, forKey key: String) {
        do { try keychain.set(value, key: key) } catch { }
    }
    
    public func getValue(forKey key: String) -> String? {
        do { return try self.keychain.getString(key) } catch { return nil }
    }
    
    public func removeValue(forKey key: String) {
        do { try keychain.remove(key) } catch { }
    }
    
    public func removeAll() {
        do { try keychain.removeAll() } catch { }
    }
}
