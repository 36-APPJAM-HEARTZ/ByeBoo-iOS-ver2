# ``DomainInterface``

ByeBoo 프로젝트의 비즈니스 로직 명세 및 핵심 데이터 모델을 정의합니다.

## Overview

이 모듈은 앱의 핵심 비즈니스 규칙을 담고 있는 인터페이스 계층입니다. 실제 구현(Data, Domain Sources)과는 독립적으로 존재하며, 모든 Feature 모듈은 이 인터페이스만을 의존하여 비즈니스 로직을 수행합니다.

## Topics

### Entities
앱 전역에서 사용되는 순수 비즈니스 데이터 모델입니다.


### Use Cases
사용자의 액션에 따른 개별 비즈니스 로직의 단위입니다.


### Repository Interfaces
필요한 데이터를 요청하기 위한 규격입니다.

