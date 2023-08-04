//
//  EmployeeDetailView.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import SwiftUI
import SDWebImageSwiftUI

struct EmployeeDetailView: View {
    var fullName : String
    var bio : String
    var photo : String
    var team : String
    var emailAddress : String
    var phoneNumber : String
    
    var body: some View {
        GeometryReader{ proxy in
            VStack(spacing:15){
                Spacer()
                let size = proxy.size.width/2
                
                WebImage(url: URL(string: photo))
                    .placeholder(Image(Constants.tdLogo))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size, height: size)
                    .clipShape(Circle())
                
                Group{
                    Text("\(fullName) \n \(team) \n \(emailAddress) \n \(phoneNumber)")
                        .multilineTextAlignment(.center)
                    Text(bio)
                }
                .padding(.horizontal,20)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle(fullName)
    }
}

struct EmployeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetailView(fullName: "Bob", bio: "Hello I'm bob", photo: "", team: "Software", emailAddress: "bob@gmail.com", phoneNumber: "111-111-1111")
    }
}
