// Copyright © 2017-2018 Trust.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import TrustCore
import TrustKeystore
import XCTest

class WalletTests: XCTestCase {
    func testSeparateAccounts() throws {
        let url = Bundle(for: type(of: self)).url(forResource: "wallet", withExtension: "json")!
        let key = try! KeystoreKey(contentsOf: url)
        let wallet = Wallet(keyURL: url, key: key)
        let accounts = try wallet.getAccounts(derivationPaths: [
            Coin.ethereum.derivationPath(at: 0),
            Coin.callisto.derivationPath(at: 0),
            Coin.poa.derivationPath(at: 0),
        ], password: "password")

        XCTAssertEqual(accounts.count, 3)
    }
}
