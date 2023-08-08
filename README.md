# Counter
<img width="1744" alt="Untitled" src="https://github.com/HANLeeeee/Counter/assets/74815957/7a29be54-870e-4f12-b407-7b203d4a5f70">


</br>
</br>
</br>
</br>

## 📌 Project Goal

- `MVVM` 모델 사용
- `UserDefaults` 사용한 기록 저장
- `Codable` 을 사용하여 json으로 데이터 인코딩/디코딩


</br>
</br>
</br>
</br>


## 📌 Service Function

- 숫자 카운트
- 기록 저장/초기화



</br>
</br>
</br>
</br>


## 📌 What I Do
### JSONEncoder, JSONDecoder 사용

- records 배열을 인코딩하여 Json파일로 데이터 변환하여 `UserDefaults`에 저장
- `UserDefaults`에 저장된 데이터를 디코딩을 통해 `Record`타입으로 반환

```swift
do {
  let endcoder: JSONEncoder = JSONEncoder()
  let data: Data = try endcoder.encode(records)
  UserDefaults.standard.set(data, forKey: UserDefaultsKey.records.rawValue)

} catch {
  print(error.localizedDescription)
}
```

```swift
do {
  if let data = UserDefaults.standard.object(forKey: UserDefaultsKey.records.rawValue) as? Data {
    let decoder: JSONDecoder = JSONDecoder()
    return try decoder.decode([Record].self, from: data)
  }

} catch {
  print(error.localizedDescription)
}
```




</br>
</br>
</br>
</br>






## 📌 미리보기




https://github.com/HANLeeeee/Counter/assets/74815957/9847c3f3-8a34-42c0-bc2f-fcf2267d489f







