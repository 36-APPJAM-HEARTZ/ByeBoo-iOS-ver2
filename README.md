# 🧸 ByeBoo (iOS)

ByeBoo ver2 프로젝트입니다. **Swift 6**와 **Tuist Micro Architecture**를 기반으로 설계되었으며, 안정성과 확장성을 최우선으로 합니다.

## 🚀 시작하기 (Getting Started)

이 프로젝트는 **Tuist**를 기반으로 관리됩니다. 로컬 환경에 Tuist가 설치되어 있지 않아도 `mise`를 통해 즉시 개발 환경을 구축할 수 있습니다.

### 1. 필수 도구 설치
도구 버전 관리를 위해 [mise](https://mise.jdx.dev/)를 사용합니다.

```bash
# mise 설치 (macOS)
brew install mise

# 설치 후 셸 활성화 (zsh 기준)
echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
```

### 2. 프로젝트 설정
```bash
# 1. 프로젝트에 정의된 도구(Tuist 등) 설치
mise install

# 2. Tuist 외부 의존성 설치 (Swift Package 등)
tuist install

# 3. Xcode 프로젝트 생성
tuist generate
```

---

## 🛠 Tech Stack

- **Language**: Swift 6.0 (Strict Concurrency Checking)
- **Dependency Management**: Tuist (Manifests, Plugins, Templates)
- **Architecture**: Micro Architecture (Modular Design)
- **DI Framework**: Needle (Uber)
- **Navigation**: Coordinator Pattern

### Third-Party Libraries
- **Network**: Alamofire
- **UI / Layout**: SnapKit, Then
- **Image / Resource**: Kingfisher, Lottie
- **Analytics**: Mixpanel, Firebase
- **Auth**: KakaoSDK
- **DI**: NeedleFoundation

---

## 🏗 Architecture & Design Patterns

### 1. Micro Architecture
계층 구조를 통해 모듈 간의 결합도를 낮추고 빌드 속도를 최적화합니다.
- **App**: 모든 모듈을 조립하는 최상위 계층 (Composition Root)
- **Features**: 독립적인 비즈니스 화면 단위 (Home, Login, Splash 등)
- **Domain**: 비즈니스 로직 및 인터페이스 (Entity, UseCase, Repository Interface)
- **Data**: 외부 데이터 소스 구현체 (Repository Impl, API, DTO)
- **PresentationKit**: 공통 UI 프레임워크 (BaseVC, Coordinator 프로토콜)
- **Core / DesignSystem**: 공통 유틸리티 및 디자인 에셋

### 2. Dependency Injection (Needle)
**Compile-time Safe DI**를 지향합니다.
- `AppComponent`가 의존성 트리의 뿌리(Root) 역할을 수행합니다.
- 자식 컴포넌트(`Component`)는 부모에게 필요한 의존성을 `Dependency` 프로토콜을 통해 요청합니다.
- 의존성 누락 시 빌드 타임에 에러를 발생시켜 런타임 안정성을 보장합니다.

### 3. Coordinator Pattern
화면 전환 로직을 ViewController에서 분리하여 독립적으로 관리합니다.
- **Interface 기반 이동**: 피처 모듈 간의 결합을 방지하기 위해 `Interface` 모듈에 코디네이터 프로토콜을 정의합니다.
- **생명주기 관리**: `childCoordinators` 배열과 `finished` 클로저를 사용하여 메모리 누수를 원천 차단합니다.
- **ViewModel 주입**: ViewModel이 코디네이터를 소유하여 비즈니스 로직에 따른 화면 전환을 결정합니다.

---

## 📒 새로운 Feature 생성 방법

표준화된 구조로 새로운 피처를 즉시 생성할 수 있습니다.

```bash
# 'MyNew'라는 이름의 피처를 생성
tuist scaffold feature --name MyNew
```

### 생성 후 필수 작업
1. `Plugin/DependencyPlugin/.../DependencyPlugin.swift`에 신규 피처 상수 등록.
2. `AppComponent.swift`에 해당 피처의 `Component`와 `Coordinator` 조립 로직 추가.
3. `tuist generate` 실행.

---

## ⚠️ Swift 6 & Strict Concurrency
본 프로젝트는 **Swift 6**의 엄격한 동시성 검사 모드를 사용합니다.
- 모든 UI 관련 클래스(VC, VM, Coordinator)는 `@MainActor`를 사용하여 데이터 레이스를 방지합니다.
- 외부 라이브러리 사용 시 명시적인 의존성 선언이 필요합니다.
