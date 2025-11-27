# 모바일 앱 3조 패널나우 - iOS 🍎 

<div align="left">
    <div>
        <img width="100%" src="https://github.com/user-attachments/assets/4a608413-a0d2-460e-ad09-6c93920ea9b3">
    </div>
</div>

**설문조사형 앱테크 플랫폼 '패널나우'**


</br>


</div>

## 👩🏻‍💻 Developers
| [신혜연](https://github.com/hyeyeonie) | [박정환](https://github.com/Jhw9n) | [홍준범](https://github.com/KuKaH) |
| :--------: | :--------: | :--------: |
| <img src="https://github.com/hyeyeonie.png" width="200" alt="멜론 앱 UI 스크린샷 1"> | <img src="https://github.com/Jhw9n.png" width="200" alt="멜론 앱 UI 스크린샷 1"> | <img src="https://github.com/KuKaH.png" width="200" alt="멜론 앱 UI 스크린샷 1"> |
| <p align = "center">`Home View` | <p align = "center"> `Exchange View` | <p align = "center">`ProductDetail View` |

<br>

## 🎸 Convention
### 공통 Type

- `feat` : 새로운 기능 구현
- `add` : feat 이외의 부수적인 코드, 폰트, 에셋 등 추가
- `fix` : 버그 및 오류 해결
- `chore` : 버전 코드, 패키지 구조, 의존성 추가
- `docs` : README, .gitignore 등의 문서 작업
- `refactor` : 리팩토링 
- `merge` : 서로 다른 브랜치 간의 병합
</aside>

<br>

### Commit Message
```
[type] #이슈번호 작업내용
```

<br>

### Branch Strategy
1. **Issue를 생성**한다. 
2. (현재 브랜치가 아닌 **main 브랜치에서**) 해당 이슈와 관련된 **새 브랜치를 생성**한다.
    
    ```swift
    feat/#이슈번호-작업할뷰
    
    ex) 
    feat/#1-DetailView
    ```
    
3. 이슈에 작성한 내용을 기반으로 **기능을 구현**한다. (+ 커밋)
    
    ```swift
    1. 커밋 잘게 쪼개는 것도 좋지만 될 수 있으면 기능 단위로
    2. 커밋 내용별로 [type] 잘 붙여주기
    3. 작업 끝나면 PR을 올리지 않더라도 항상 push까지 해주기
    ```
    
4. **add - commit - push - PR** 과정을 거친다.
5. PR 작성자 외의 다른 팀원들이 **코드리뷰**한다.
코드리뷰 받고 반영할 부분이 있다면 수정한다.
(수정은 다시 그 브랜치로 돌아와서 고치고 add - commit - push 하면 됨)
6. PR 작성자가 **본인의 브랜치를 main으로 merge**한다. (+ merge 전과 후 반드시 공유)
7. **merge 했으면 로컬에서 git switch main 으로 이동한 다음 반드시 pull 받는다.**

</br>

## 🎬 시연 영상

https://github.com/user-attachments/assets/1a9e4e6b-d790-45f2-9b85-cd3e02b8309c

<br/>
