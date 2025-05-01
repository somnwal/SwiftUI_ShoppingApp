# SwiftUI Shopping App

SwiftUI로 제작한 쇼핑몰 앱입니다.

서버 : https://github.com/somnwal/NodeJS_ShoppingApp_Server

## 프로젝트 구조

```
shopping/
├── shopping/                   # 메인 앱 소스 코드
│   ├── shoppingApp.swift       # 앱 진입점
│   ├── ContentView.swift       # 메인 콘텐츠 뷰
│   ├── Model/                  # 데이터 모델
│   │   ├── ProductModel.swift  # 상품 모델
│   │   ├── TypeModel.swift     # 타입 모델
│   │   └── UserModel.swift     # 사용자 모델
│   ├── View/                   # UI 뷰 컴포넌트
│   │   ├── Home/               # 홈 화면 관련 뷰
│   │   │   └── HomeView.swift
│   │   ├── Login/              # 로그인 관련 뷰
│   │   │   ├── LoginView.swift
│   │   │   ├── SignInView.swift
│   │   │   ├── SignUpView.swift
│   │   │   └── WelcomeView.swift
│   │   ├── MainTab/            # 메인 탭 뷰
│   │   │   └── MainTabView.swift
│   │   └── Explore/            # 탐색 뷰
│   │       └── ExploreView.swift
│   ├── Viewmodel/              # 뷰모델 (MVVM 아키텍처)
│   │   ├── MainViewModel.swift
│   │   └── HomeViewModel.swift
│   ├── Common/                 # 공통 유틸리티
│   │   └── UIKitExtension.swift
│   ├── UICommon/               # UI 관련 공통 컴포넌트
│   │   ├── Cell/
│   │   ├── UIExtension.swift
│   │   ├── ServiceCall.swift
│   │   ├── LineTextField.swift
│   │   ├── RoundButton.swift
│   │   └── ... (기타 UI 컴포넌트)
│   ├── font/                   # 폰트 리소스
│   └── Assets.xcassets/        # 이미지 및 색상 리소스
├── shoppingTests/              # 테스트 코드
└── shoppingUITests/            # UI 테스트 코드
```

## 주요 기능

- 사용자 인증 (로그인/회원가입)
- 상품 목록 보기
- 상품 탐색
- 메인 탭 인터페이스

## 기술 스택

- SwiftUI
- MVVM 아키텍처
- RESTful API 통신
