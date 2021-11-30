//
//  SwiftUIView.swift
//  CommonUI
//
//  Created by sungals07 on 2021/10/21.
//

import SwiftUI

// free image download site
// https://pixabay.com/
struct CarMaker {
    let name: String
    let imageUrl: String
    let numberOfStore: Int
}

extension CarMaker {
    static func all() -> [CarMaker] {
        return [
            CarMaker(name: "기아", imageUrl: "car1", numberOfStore: 2000),
            CarMaker(name: "현대", imageUrl: "car2", numberOfStore: 2100),
            CarMaker(name: "쌍용", imageUrl: "car3", numberOfStore: 2200)
        ]
    }
}

struct CarMakerCell: View {
    let carMaker: CarMaker
    
    var body: some View {
        HStack {
            Image(carMaker.imageUrl)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            
            VStack(alignment: .leading) {
                Text(carMaker.name).font(.largeTitle)
                Text("\(carMaker.numberOfStore) 지점")
            }
        }
    }
}

struct SwiftUIView: View {
    let carMakes = CarMaker.all()
    
    var body: some View {
        NavigationView {
            List(self.carMakes, id: \.name) { carMaker in
    //            Text(carMaker.name)
//                CarMakerCell(carMaker: carMaker)
                
                NavigationLink {
                    CarMakerDetail(carMaker: carMaker)
                } label: {
                    CarMakerCell(carMaker: carMaker)
                }

            }.navigationBarTitle("자동차  제조사", displayMode: .inline)
        }
    }
    
//    let genderType = ["남성","여성","비밀"]
//
//    @State var name = ""
//    @State var gender = 0
//    @State var bornIn = 0
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            Text("Hello world!")
//            Spacer().frame(height: 15)
//            Text("Hi!")
//            Spacer().frame(height: 55)
//            Text("How are you!")
//        }.background(Color.red)
//    }
    
//    var resultScript: String {
//        if(name.isEmpty) {
//            return "이름을 입력해주세요."
//        } else {
//            return "\(name)님은 성별이 \(genderType[gender])이며 나이는 \(120 - bornIn)입니다."
//        }
//    }
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section {
//                    TextField("이름을 입력해주세요", text: $name)
//                        .keyboardType(.default)
//                } header: {
//                    Text("이름")
//                }
//
//                Section {
//                    Picker("출생년도", selection: $bornIn) {
//                        ForEach(1900 ..< 2019) {
//                            Text("\(String($0))년생")
//                        }
//                    }
//                } header: {
//                    Text("생년월일")
//                }
//
//                Section(header: Text("성별")){
//                    //선택하는 값을 bornIn 변수에 할당합니다.
//                    Picker("성별", selection: $gender){
//                        // 1900부터 2018까지 Text를 만듭니다.
//                        ForEach(0 ..< genderType.count ){
//                            Text("\(self.genderType[$0])")
//                        }
//                    }.pickerStyle(SegmentedPickerStyle())
//                }
//
//                Section {
//                    Text("\(resultScript)")
//                } header: {
//                    Text("결과")
//                }
//
//            }.navigationTitle("회원가입")
//        }
//
//    }
    
//    @State var name = ""
//    @State var age = ""
//
//    var body: some View {
//        Form {
//            Section {
//                TextField("이름을 입력해주세요", text: $name)
//                    .keyboardType(.default)
//            }
//            Section {
//                TextField("나이를 입력해주세요", text: $age)
//                    .keyboardType(.numberPad)
//            }
//            Text("\(name)님의 나이는 \(age) 입니다.")
//        }
//    }
    
//    @State var touchedCount = 0
//    var body: some View {
//        NavigationView {
//            Form {
//                Text("버튼을 클릭한 횟수 \(touchedCount)")
//                Button("this is button") {
//                    print("가나다라")
//                    self.touchedCount += 1
//                }
//            }.navigationTitle("this is title")
//        }
//    }
}

struct ContentView: View {
//    @State var isToggleOn: Bool = true
//
//    var body: some View {
//
//        VStack {
//
//            // isToggleOn을 Binding<Bool> 형태로 리턴하기위에
//            // $를 붙여 초기화합니다.
//            ChildView(isToggleOn: $isToggleOn)
//            if isToggleOn {
//                Text("그으으을자!")
//            }
//
//        }
//    }
    @ObservedObject var countRepo = CountRepo()

        var body: some View {
            VStack {
                Text("\(self.countRepo.count)").font(.largeTitle)
                
                Button("숫자증가") {
                    self.countRepo.count += 1
                }
            }
        }
}


struct ChildView :View{
    //Binding Annoation을 붙이면 Binding<Bool>을 인자로받아 초기화 시킬 수 있습니다.
    @Binding var isToggleOn:Bool

    var body: some View{

        //$가 붙으면 값을 수정가능한 Binding타입 참조합니다.
        Toggle(isOn: $isToggleOn) {
            Text("글자를 가립니다")
        }.padding()
    }
}

class CountRepo: ObservableObject {
//    @Published var count: Int = 0
    var count:Int = 0 {
        willSet(newVal){
            print(newVal % 5)
            if(newVal % 5 == 0){
                objectWillChange.send()
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
//        SwiftUIView()
//        SwiftUIViewLevel2
        ContentView()
    }
}
