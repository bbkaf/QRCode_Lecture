//
//  File.swift
//  QRcode_L1
//
//  Created by HankTseng on 2018/2/13.
//  Copyright © 2018年 HankTseng. All rights reserved.
//

import Foundation
import UIKit

class QRCodeImageView: UIImageView {
    var qrcodeImage: CIImage!
    
    func genQRCode(infoTest: String) {
        print("genQRCode from string \(infoTest)")
        let data = infoTest.data(using: .utf8)!
        let inputParameter = ["inputMessage": data, "inputCorrectionLevel": "L"] as [String: Any]
        let filter = CIFilter(name: "CIQRCodeGenerator", withInputParameters: inputParameter)
        qrcodeImage = filter?.outputImage
        
        let scaleX =  200 / qrcodeImage.extent.size.width
        let scaleY = 200 / qrcodeImage.extent.size.height
        let qrcodeImageScale = qrcodeImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
        DispatchQueue.main.async {
            self.image = UIImage(ciImage: qrcodeImageScale)
        }
    }
}
