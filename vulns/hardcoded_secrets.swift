
let dataLength = self.count
let cipherLength  = size_t(dataLength + kCCBlockSizeAES128)
var cipherData = Data(count:cryptLength)

let keyLength = size_t(kCCKeySizeAES128)
let options = CCOptions(kCCOptionPKCS7Padding)

var bytesEncrypted :size_t = 0

let algorithm = CCAlgorithm(kCCAlgorithmAES)
let op = CCOperation(operation)

let myKey: Data = "alice or bob".data(using:String.Encoding.utf8)!

CCCrypt(
    op,
    algorithm,
    options,
    // ruleid: hardcoded-symmetric-key
    myKey, 
    keyLength,
    ivBytes,
    dataBytes, 
    dataLength,
    cipherBytes, 
    cipherLength,
    &bytesEncrypted)

let status = cipherData.withUnsafeMutableBytes { cipherBytes in
    self.withUnsafeBytes { dataBytes in
        iv.withUnsafeBytes { ivBytes in
            key.withUnsafeBytes { keyBytes in
                CCCrypt(
                    op,
                    algorithm,
                    options,
                    // todoid: hardcoded-symmetric-key
                    keyBytes, 
                    keyLength,
                    myIV,
                    dataBytes, 
                    dataLength,
                    cipherBytes, 
                    cipherLength,
                    &bytesEncrypted)
            }
        }
    }
}

let someSalt = "I want some crypto".data(using: .utf8)!
let plaintext = "Lorem ipsum dolor".data(using: .utf8)!

let keyData = Data(base64Encoded: "foobarNonce==")!
// ruleid: hardcoded-symmetric-key
let someKey = SymmetricKey(data: keyData)

let ciphertext = try! ChaChaPoly.seal(plaintext, using: sSymmetricKey,
nonce: someSalt).combined

let sealedBox = try! ChaChaPoly.SealedBox(combined: encryptedData)
let decryptedData = try! ChaChaPoly.open(sealedBox, using: someKey)
let decryptedPlaintext = String(data: decryptedData, encoding: .utf8)!


// AES-GCM
let nonce = try! AES.GCM.Nonce(data: Data(base64Encoded: "foobarNonce")!)
let tag = Data(base64Encoded: "fYj==")!

let sealedBox = try! AES.GCM.seal(
    plain.data(using: .utf8)!,
    using: someKey, 
    nonce: nonce, 
    authenticating: tag)

let c = []
for i in 1...16 {
    let randomInt = Int.random(in: 0..<256)
    c.append(randomInt)
}

let otherNonce = Data(bytes: c)

let otherNonce = try! AES.GCM.Nonce(data: otherNonce)
let tag = Data(base64Encoded: "fYj==")!