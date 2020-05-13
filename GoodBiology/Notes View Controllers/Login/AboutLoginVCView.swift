//
//  AboutLoginVCView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 19.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import SwiftUI

class ContactPickerDelegate: BindableObject {
    
    var willChange = PassthroughSubject<ContactPickerDelegate, Never>()
    var didChange = PassthroughSubject<ContactPickerDelegate, Never>()
    
    var contact: String? {
        willSet {
            willChange.send(self)
        }
        
        didSet {
            didChange.send(self)
        }
    }
}

struct AboutLoginVCView : View {
    @ObjectBinding var delegate: ContactPickerDelegate
    
    var body: some View {
        List {
            Button("Alice") {
                self.delegate.contact = "Alice"
            }
            Button("Bob") {
                self.delegate.contact = "Bob"
            }
            Button("Trudy") {
                self.delegate.contact = "Trudy"
            }
        }
    }
}

struct AboutLoginVCView_Previews: PreviewProvider {
    static var previews: some View {
        AboutLoginVCView()
    }
}
