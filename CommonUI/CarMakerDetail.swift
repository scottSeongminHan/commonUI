//
//  CarMakerDetail.swift
//  CommonUI
//
//  Created by sungals07 on 2021/10/29.
//

import SwiftUI

struct CarMakerDetail: View {
    // 양방햔 바인딩을 위해 State Annotation을 붙입니다.조
    // State 어노테이션이 붙으면 뷰 안에서 값을 참조할 수 있는 랩핑클래스인
    // Binding<T>의 형태로 받습니다.
    @State var isPresent: Bool = false
    let carMaker: CarMaker
    var body: some View {
        
        VStack {
            Image(carMaker.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
            //탭을 2번 연속해서 눌렀을때 perform 블록을 실행시킵니다.
                .onTapGesture(count: 2) {
                    //isPresent를 true로 바꾸어 alert이 Present되도록 합니다.
                    self.isPresent = true
                }
            Text(carMaker.name)
            // $를 추가하면 isPresent를 Binding<Bool> 형태로 받습니다.
        }
        .alert(isPresented: $isPresent) {
            //화면에 Alert를 띄웁니다.
            Alert(title: Text("더블클릭"),
                  message: Text("하셨습니다!"),
                  dismissButton: .default(Text("ok")))
        }
    }
}

struct CarMakerDetail_Previews: PreviewProvider {
    static let previewMaker = CarMaker(name: "hello world", imageUrl: "car1", numberOfStore: 10000)
    
    static var previews: some View {
//        CarMakerDetail()
        CarMakerDetail(carMaker: previewMaker)
    }
}
