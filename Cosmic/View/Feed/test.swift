//
//  test.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 28.06.2022.
//

import SwiftUI

struct test: View {
    
    var vm = APODDataSevrice()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                Task {
                    try await vm.fetchOneAPODData()
                }
            }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
