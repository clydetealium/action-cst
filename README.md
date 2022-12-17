# action-cst

## What is this?
This is a mash up of two existing GHA marketplace actions
- [actions/container-structure-tests](https://github.com/marketplace/actions/container-structure-tests)
- [actions/container-structure-test-action](https://github.com/marketplace/actions/container-structure-test-action)

## Why the duplication?
I wanted to have more control over how the action is maintained

## What does it do?
Facilitates [container-structure-test](https://github.com/GoogleContainerTools/container-structure-test) usage in your GitHub Action workflows.

## Example usage
```
name: container scrutiny
on:
  pull_request:
    branches:
      - main
  push:
    branches:
      - main
jobs:
  cst:
    name: container regression
    runs-on: ubuntu-20.04
    env:
      tag: 'local/my-image:latest'
    steps:
    - name: Checkout
      uses: actions/checkout@v3
    - name: Set up QEMU
      uses: docker/setup-qemu-action@v2
    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v2
    - name: Build the image
      uses: docker/build-push-action@v3
      with: 
        context: .
        push: false
        tags: ${{ env.tag }}
        load: true
        build-args: 'ARCH=i386'
    - name: Run structure tests
      uses: clydetealium/action-cst@v1
      with:
        image: ${{ env.tag }}
        configFile: cst_config.yml
```
