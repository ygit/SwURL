//
//  RemoteImageView.swift
//  Landmarks
//
//  Created by Callum Trounce on 06/06/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public struct RemoteImageView: View {
    
    var url: URL
    
    var options: ((Image) -> Body)
    
    var placeholderImage: Image?
    
    @State
    var remoteImage: RemoteImage = RemoteImage()
   
    public var body: Image {
        let res = remoteImage.load(url: url).image ?? placeholderImage
        return options(res!)
    }
    
    public init(url: URL, placeholderImage: Image? = nil,  options: @escaping ((Image) -> Image)) {
        self.placeholderImage = placeholderImage
        self.url = url
        self.options = options
    }
}
