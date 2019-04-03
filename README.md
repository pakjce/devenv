# direnv 기반 개발 환경

## 선행 조건

`pyenv`, `conda` 등을 미리 설치해둡니다.

## 사용 방법
`./activations` 에 적절한 activation script를 작성해두고,

각 작업 폴더에 `.envrc` 를 아래와 같이 작성한 뒤 `direnv allow` 를 해 둡니다.

```
source ${HOME}/devenv/activations/conda-py36-pt101.sh
source .venv/bin/activate
```