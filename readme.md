# dockerfile for textlint-reviewdog on bitbucket pipeline

sphinx-textlint-reviewdog-bitbucket

* textlint
  * nodejs
* reviewdog
  * golang
* sphinx
  * python pip pipenv

## how to use

Add `.textlintrc` and `bitbucket-pipelines.yml` into your document bitbucket repo.

`.textlintrc` sample

```json:.textlintrc
{
    "rules": {
        "preset-ja-technical-writing": true
    }
}
```

`bitbucket-pipelines.yml` sample

```yml:bitbucket-pipelines.yml
pipelines:
  default:
    - step:
        name: Reviewdog-textlint
        image: cslroot/sphinx-textlint-reviewdog-bitbucket
        cahces:
          - node
          - pip
        script:
          - npm install
          - pip sync
          - /sphinx-textlint-reviewdog-bitbucket.sh .
```

## installed tools

- golang:latest
- nodejs 16.x
- reviewdog


# memo

```
docker image build -t cslroot/sphinx-textlint-reviewdog-bitbucket:latest .
```

```
docker run --rm -it -v $PWD:/work cslroot/sphinx-textlint-reviewdog-bitbucket
/sphinx-textlint-reviewdog-bitbucket.sh .
```

