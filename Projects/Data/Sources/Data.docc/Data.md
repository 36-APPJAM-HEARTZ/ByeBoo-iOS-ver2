# ``Data``

ByeBoo 프로젝트의 데이터 레이어를 담당하며, 네트워크 통신 및 로컬 영속성 관리를 수행합니다.

## Overview

이 모듈은 서버 API와의 통신을 위한 네트워크 인프라, 데이터 전달 객체(DTO), 그리고 도메인 레이어의 Repository를 실제로 구현하는 로직을 포함합니다.

## Topics

### Networking
서버 통신을 정의하고 실행하는 핵심 인터페이스입니다.

- ``EndPoint``
- ``NetworkService``
- ``NetworkInterceptor``
