# 리버팟으로 구현한 Book Store

## 사용 패키지 및 용도
1. [Riverpod](https://pub.dev/packages/riverpod)
 - 상태관리
 - 간단 Riverpod 설명 (완전 정확하진 않음 그냥 대략적 참고만)
    - Widget들이 Riverpod의 Provider를 읽을 수 있기 위해서는 앱 전체를 `ProviderScope`로 감싸 주어야 함
    - Provider를 사용하고 싶은 위젯은 `StatelessWidget`, `StatefulWidget`이 아닌 `ConsumerWidget`, `ConsumerStatefulWidget`을 사용해야 함.
    - `context`가 중요한 Provider 패키지와는 다르게, `ConsumerWidget`, `ConsumerStatefulWidget`에서 제공하는 `ref`가 중요하고, 이것으로 Riverpod의 Provider를 사용할 수 있음
    - 이외 디테일한 사항을 배우고 싶다면 강의 추천해 드릴 수 있음!
2. [dio](https://pub.dev/packages/dio)
- http 통신
3. [json_serializable](https://pub.dev/packages/json_serializable)
- json 데이터를 모델 객체로 만들 수 있도록 도와주는 라이브러리
4. [Retrofit](https://pub.dev/packages/retrofit)
- dio와 함께 http 통신을 도와주는 라이브러리
