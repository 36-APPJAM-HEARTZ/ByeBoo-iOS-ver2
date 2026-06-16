# ``PresentationKit``

ByeBoo 프로젝트의 공통 UI 프레임워크 및 아키텍처 베이스를 제공합니다.

## Overview

이 모듈은 모든 Feature 모듈에서 공통으로 상속받아 사용하는 Base 클래스와 Coordinator 프로토콜을 포함합니다.

## Topics

### Architecture Base
이 프로젝트의 모든 화면이 따르는 표준 기반 클래스들입니다.

- ``BaseViewController``
- ``BaseView``

### Navigation
화면 전환 및 흐름 제어를 위한 코디네이터 패턴 관련 프로토콜입니다.

- ``Coordinator``
- ``FinishableProtocol``

### Analytics
사용자 행동 분석 및 로깅을 위한 인터페이스입니다.

- ``MixpanelProperty``

