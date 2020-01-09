//
//  ContentView.swift
//  CombineSwiftUISample
//
//  Created by 中山 陽介 on 2020/01/09.
//  Copyright © 2020 Yosuke Nakayama. All rights reserved.
//

import SwiftUI
import Combine
 
struct ContentView: View {
 
    @ObservedObject var companyViewModel: CompanyViewModel
 
    init(companyViewModel: CompanyViewModel) {
        self.companyViewModel = companyViewModel
    }
 
    var body: some View {
        VStack {
            Text("\(companyViewModel.name)")
            Spacer()
            Button(action: {
                self.companyViewModel.loadEmployee()
            }, label: {
                Text("start load")
            })
        }
        .frame(height: 100)
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            companyViewModel: CompanyViewModel(name: "No Data")
        )
    }
}
