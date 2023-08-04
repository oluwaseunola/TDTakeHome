//
//  DirectoryEmployeeCell.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import SwiftUI
import SDWebImageSwiftUI

struct DirectoryEmployeeCell: View {
    var fullName : String
    var photo : String
    var team : String
    var emailAddress : String
    var phoneNumber : String
    
    var body: some View {
        
        HStack(spacing:15){
            
            WebImage(url: URL(string: photo))
                .resizable().placeholder(Image(Constants.tdLogo)).aspectRatio(contentMode:.fill).frame(width:65, height: 65).clipShape(Circle())
            
            
            VStack(alignment:.leading){
                Text(fullName).font(.system(.title3, design: .rounded)).foregroundColor(.green).bold()
                
                Text(team).font(.system(.footnote, design: .rounded)).foregroundColor(.gray).padding(.bottom,5)
                
                Label {
                    Text(emailAddress).font(.system(.footnote, design: .rounded)).foregroundColor(.gray)
                } icon: {
                    Image(systemName: Constants.envelopeImage).foregroundColor(.green)
                }.padding(.bottom,2)
                
                Label {
                    Text(phoneNumber).font(.system(.footnote, design: .rounded)).foregroundColor(.gray)
                } icon: {
                    Image(systemName: Constants.phoneImage).foregroundColor(.green)
                }
            }
            
            Spacer()
        
        }.frame(maxWidth:.infinity).frame(height:150).padding(.horizontal,20)

    }
}

struct DirectoryEmployeeCell_Previews: PreviewProvider {
    static var previews: some View {
        DirectoryEmployeeCell(fullName: "", photo: "", team: "", emailAddress: "", phoneNumber: "")
    }
}
