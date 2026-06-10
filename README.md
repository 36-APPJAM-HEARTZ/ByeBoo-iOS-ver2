# 🧸 ByeBoo (iOS)

ByeBoo ver2 실험실입니다. Tuist Micro Architecture를 기반으로 개발되었습니다.

## 🚀 시작하기 (Getting Started)

이 프로젝트는 **Tuist**를 기반으로 관리됩니다. 로컬에 Tuist가 설치되어 있지 않아도 다음 단계를 통해 프로젝트를 실행할 수 있습니다.

### 1. 필수 도구 설치
이 프로젝트는 도구 버전 관리를 위해 [mise](https://mise.jdx.dev/)를 사용합니다.

```bash
# mise 설치 (macOS)
brew install mise
```

### 2. 프로젝트 설정
프로젝트 루트 디렉토리에서 다음 명령어를 실행하여 Tuist 및 필요한 의존성을 설치합니다.

```bash
# 1. mise를 통한 도구(Tuist 등) 설치
mise install

# 2. Tuist 외부 의존성 설치 (Swift Package 등)
tuist install

# 3. Xcode 프로젝트 생성
tuist generate

```

### 3. 프로젝트 실행
`tuist generate` 를 이용해서 프로젝트를 열어 개발해주세요.

---

## 🛠 주요 명령어 (Quick Commands)

`mise` 셸 활성화를 권장합니다 (`eval "$(mise activate zsh)"`). 활성화된 상태에서는 바로 `tuist` 명령어를 사용할 수 있습니다.

- **프로젝트 생성**: `tuist generate`
- **외부 의존성 설치**: `tuist install`
- **매니페스트 수정**: `tuist edit`
- **캐시 정리**: `tuist clean`

---

## 📒 새로운 Feature 생성 방법

1. 피처 생성 명령어
  터미널에서 프로젝트 루트 디렉토리로 이동한 뒤 다음 명령어를 실행합니다.

   1 # `MyNew`라는 이름의 피처를 생성할 경우
   2 `tuist scaffold feature --name MyNew`

  2. 생성되는 결과물
  명령어를 실행하면 `Projects/Features/MyNewFeature/` 폴더 하위에 다음과 같은 Micro Architecture 표준 구조가 자동으로
  생성됩니다.

   * Project.swift: 모듈 설정 파일
   * Sources/: 실제 구현 코드가 들어갈 폴더
   * Interface/: 타 모듈에 노출할 프로토콜 및 모델 폴더
   * Testing/: 테스트를 위한 Mock/Stub 폴더
   * Tests/: 유닛 테스트 폴더
   * Demo/: 단독 실행을 위한 AppDelegate, SceneDelegate (아까 수정한 템플릿 적용됨)
   * Resources/: 이미지, 폰트 등 리소스 폴더

  3. 생성 후 필수 작업 (수동)
  템플릿이 파일을 만들어주지만, 프로젝트 전체에 연결하는 작업은 수동으로 한 번 해주어야 합니다.

  ① `Plugin/DependencyPlugin`에 등록
  다른 모듈에서 이 피처를 의존성으로 추가할 수 있도록 등록합니다.
```
   // Plugin/DependencyPlugin/ProjectDescriptionHelpers/DependencyPlugin.swift

   public extension TargetDependency.Project.Features {
       static let MyNew = feature(name: "MyNew") // 추가
   }
```

  ③ 프로젝트 생성
  설정이 끝났으면 다시 generate를 실행합니다.
   `tuist generate`

  💡 팁: 템플릿 수정이 필요할 때
  만약 생성되는 파일의 기본 코드(예: `Sources/MyNewFeature.swift` 내용 등)를 바꾸고 싶다면, 다음 폴더의 .stencil 파일들을
  수정하면 됩니다.
   * 경로: `Tuist/Templates/Feature/*.stencil`

## 🏗 Architecture

- **Tuist Micro Architecture** 적용
- **Layer**: App -> Feature -> Domain -> Data -> Core -> Shared
- **Interface & Testing**: 모듈간 결합도를 낮추기 위해 Interface 타겟과 Testing 타겟을 분리하여 관리합니다.
