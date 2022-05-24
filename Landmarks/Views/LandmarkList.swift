//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            // model data의 landmarks 배열을 List 초기화기에 전달합니다.
            // List는 식별 가능한 데이터(identifiable data)로 작동합니다.
            // 데이터와 함께 각 요소를 고유하게 식별하는 속성의 키 경로를 전달하거나 데이터 유형이 식별 가능 프로토콜에 적합하도록 하는 두 가지 방법 중 하나를 통해 데이터를 식별할 수 있습니다.
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    // closure에서 LandmarkRow을 반환하여 동적으로 생성된 List를 완성합니다.
                    LandmarkRow(landmark: landmark)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone 13", "iPad mini (6th generation)"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
