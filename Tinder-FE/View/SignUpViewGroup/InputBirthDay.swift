//
//  InputBirthDay.swift
//  Tinder-FE
//
//  Created by Gia Huy on 07/09/2022.
//

import SwiftUI
import Combine
import NavigationStack

struct InputBirthDay: View {
    @StateObject var signUpVMGroup = SignUpViewModelGroup()
    @State private var goToNextView: Bool = false
    @State private var goBack: Bool = false
    @State private var disableButton: Bool = true
    
    
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 1970)) ?? Date()
    let endingDate: Date = Date()
    
    var body: some View {
        ZStack {
            PopView(isActive: $goBack, label: {Text("")})
            PushView(destination: ChooseGenderView(), isActive: $goToNextView, label: {Text("")})
            Color.white.ignoresSafeArea()
            VStack {
                Spacer().frame(height: 80)
                HStack {
                    Text("Sinh nhật\ncủa tôi là")
                        .font(.system(size: 50, weight: .bold, design: .default))
                        .padding(.leading, 50)
                    Spacer()
                }
                Spacer().frame(height: 40)
                HStack {
                    Spacer()
                    DatePicker("Choose Your BirthDate", selection: $signUpVMGroup.birthDay, in: startingDate...endingDate, displayedComponents: [.date])
                        .accentColor(Color("lightRed"))
                        .datePickerStyle(
                            GraphicalDatePickerStyle()
                        )
                    Spacer()
                }
                .labelsHidden()
                
                Text("Tuổi của bạn sẽ được hiển thị công khai")
                    .frame(width: 320)
                    .font(.system(size: 17, weight: .bold, design: .default))
                    .foregroundColor(Color("darkGrey"))
                Spacer()
                Button {
                    self.goToNextView = true
                } label: {
                    Text("TIẾP TỤC")
                        .modifier(ButtonNextEnable())
                }
                .padding(.horizontal, 30)
            }
            .overlay(
                Button(action: {
                    self.goBack = true
                }) {
                  Image("darkGrayBackButton")
                        .resizable()
                        .scaledToFit()
                }
                .modifier(BackButtonModifier()),
                alignment: .topLeading
            )
            .padding(20)
        }
    }
}

struct InputBirthDay_Previews: PreviewProvider {
    static var previews: some View {
        InputBirthDay()
    }
}
