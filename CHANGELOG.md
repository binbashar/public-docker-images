# Change Log

All notable changes to this project will be documented in this file.

<a name="unreleased"></a>
## [Unreleased]



<a name="v0.0.40"></a>
## [v0.0.40] - 2020-11-15

- Merge branch 'master' of github.com:binbashar/public-docker-images
- BBL-440 | upgrading repo to use versioned makefile lib


<a name="v0.0.39"></a>
## [v0.0.39] - 2020-10-12

- Merge branch 'master' of github.com:binbashar/public-docker-images
- BBL-313 | removing unnessary figures


<a name="v0.0.38"></a>
## [v0.0.38] - 2020-10-12

- BBL-313 | segregating docker images to le-docker-images repo to grant beter stability and maintainability


<a name="v0.0.37"></a>
## [v0.0.37] - 2020-10-09

- BBL-313 | adding build step before pushing at master


<a name="v0.0.36"></a>
## [v0.0.36] - 2020-10-09

- BBL-313 | adding cross image tests
- BBL-313 | improving docker login cmd to avoid sec warning
- BBL-313 | fixing makefile + circleci config
- BBL-313 | fixing circleci config file
- BBL-313 | Updating Makefiles + Dockerfiles to use new fully as code build approach + CircleCi config updated
- BBL-313 | removing old build files + discontuined supported images


<a name="v0.0.35"></a>
## [v0.0.35] - 2020-10-08

- BBL-313 | upgrading versions + standalone makefile approach partially implemented
- BBL-313 | updating makefile to follow improved stand-alone approach + renaming figures folder


<a name="v0.0.34"></a>
## [v0.0.34] - 2020-10-06

- BBL-378 | fixing builds at docker hub and upgrading versions


<a name="v0.0.33"></a>
## [v0.0.33] - 2020-09-24

- BBL-381 | upgrading circleci vm executor


<a name="v0.0.32"></a>
## [v0.0.32] - 2020-09-24

- BBL-84 | upgrading kubectl and kubectx versions


<a name="v0.0.31"></a>
## [v0.0.31] - 2020-09-24

- Bump http-proxy from 1.18.0 to 1.18.1 in /vuejs-vuetify/example-test


<a name="v0.0.30"></a>
## [v0.0.30] - 2020-09-15

- BBL-81 | minor readme.md update


<a name="v0.0.29"></a>
## [v0.0.29] - 2020-09-11

- BBL-381 | minor Makefile parameterizing improvement


<a name="v0.0.28"></a>
## [v0.0.28] - 2020-09-11

- BBL-381 | minor readme figures sizeing improvement


<a name="v0.0.27"></a>
## [v0.0.27] - 2020-09-11

- BBL-381 | testing standalone makefile approach
- BBL-379 | Ignoring Makefile temp changes before releasing
- BBL-379 | removing Makefile blank lines
- BBL-379 | improving Makefile sitaxt with parameters
- BBL-379 | testing Make commands from centralized repo


<a name="v0.0.26"></a>
## [v0.0.26] - 2020-09-10

- BBL-379 | fixing Failed: binbashar/public-docker-images on master / test_and_release


<a name="v0.0.25"></a>
## [v0.0.25] - 2020-09-06

- Update Terraform Slim images to use Terraform 0.13.2 as default ([#42](https://github.com/binbashar/public-docker-images/issues/42))


<a name="v0.0.24"></a>
## [v0.0.24] - 2020-09-03

- Add oathtool to Terraform slim image ([#41](https://github.com/binbashar/public-docker-images/issues/41))
- Slim docker image that contains Terraform, AWS CLI and another image that also has Terratest ([#38](https://github.com/binbashar/public-docker-images/issues/38))


<a name="v0.0.23"></a>
## [v0.0.23] - 2020-08-26

- Add jq tool for parsing AWS CLI output ([#36](https://github.com/binbashar/public-docker-images/issues/36))


<a name="v0.0.22"></a>
## [v0.0.22] - 2020-08-22

- Support Terraform v0.13.0 ([#35](https://github.com/binbashar/public-docker-images/issues/35))


<a name="v0.0.21"></a>
## [v0.0.21] - 2020-08-19

- BBL-192 | updating .gitignore + adding .editorconfig + LICENSE.md


<a name="v0.0.20"></a>
## [v0.0.20] - 2020-08-02

- Bump elliptic from 6.5.2 to 6.5.3 in /vuejs-vuetify/example-test


<a name="v0.0.19"></a>
## [v0.0.19] - 2020-07-23

- Add oathtool for MFA support ([#32](https://github.com/binbashar/public-docker-images/issues/32))


<a name="v0.0.18"></a>
## [v0.0.18] - 2020-07-20

- Bump lodash from 4.17.15 to 4.17.19 in /vuejs-vuetify/example-test


<a name="v0.0.17"></a>
## [v0.0.17] - 2020-07-10

- BBL-167 seting terraform-awscli image to use python3.8


<a name="v0.0.16"></a>
## [v0.0.16] - 2020-07-07

- BBL-248 small sintaxt improvement
- BBL-248 supporting latest terraform 0.12.28 version
- BBL-248 propagating Makefile grep string update


<a name="v0.0.15"></a>
## [v0.0.15] - 2020-06-09

- Bump websocket-extensions in /vuejs-vuetify/example-test


<a name="v0.0.14"></a>
## [v0.0.14] - 2020-04-27

- BBL-248 removing terraform-docs from README.md
- BBL-248 removing terraform-docs since we're using cytopia/terraform-docs image for this purpose


<a name="v0.0.13"></a>
## [v0.0.13] - 2020-04-24

- BBL-248 improving directory structure to make this layer easier to understand and following the std
- BBL-248 improving directory structure to make this layer easier to understand and following the std
- BBL-248 adding vuejs-vuetify dockerfile and related files
- BBL-248 updating .gitignore
- BLL-248 adding .github repo templates
- BBL-248 updating release mgmt README.md section
- BBL-248 updating terraform-resource makefile
- BBL-248 Adding terraform-awscli dockerfile
- BBL-248 Makefile.release updated
- BBL-248 updating changelog format


<a name="v0.0.12"></a>
## [v0.0.12] - 2020-01-27

- BBL-80 Updating Makefile: parametrized version + latest tf 0.12.20


<a name="v0.0.11"></a>
## [v0.0.11] - 2019-10-29

- BBL-137 minor code enhancement updates


<a name="v0.0.10"></a>
## [v0.0.10] - 2019-10-25

- BBL-137 adding komiser without redis in Makefile
- BBL-137 updating mysql-client docker image readme.md


<a name="v0.0.9"></a>
## [v0.0.9] - 2019-10-25

- BBL-137 fixing sec-scoutsuit https://cloud.docker.com/u/binbash/repository/docker/binbash/sec-scoutsuite/builds/3c807e01-efc1-4950-b0c7-15ee57fdb7e0
- BBL-137 fixing https://cloud.docker.com/u/binbash/repository/docker/binbash/terraform-landscape/builds/bc2e964a-ec01-4f7e-b85a-f09af6b7bf0a
- BBL-137 fixing https://cloud.docker.com/u/binbash/repository/docker/binbash/mysql-client/builds/e8ba3906-d472-407c-9b99-c5b09c5e0328
- BBL-137 updating README.md images size for an improved view.
- BBL-137 updating README.md images size for an improved view.


<a name="v0.0.8"></a>
## [v0.0.8] - 2019-10-25

- BBL-137 flag to false for better code sintaxt
- BBL-137 adding awscli and scoutsuite image status in readme.md
- BBL-137 adding inline comment komiser makefile
- BBL-137 adding Makefile and docker-compose.yml for komiser w/ redis auto exec
- BBL-137 kubectl readme.md update + adding maintainer to kubectx dockerfile
- BBL-137 adding docker scoutsuite files
- BBL-137 adding docker awscli files
- BBL-137 adding maintainer info to every Dockerfile


<a name="v0.0.7"></a>
## [v0.0.7] - 2019-10-22

- BBL-119 disabling circleci docker cache not available for our current plan
- BBL-119 adding CircleCi automated release mgmt code
- BBL-119 referencing terraform to 0.12.12


<a name="v0.0.6"></a>
## [v0.0.6] - 2019-08-24

- Updating CHANGELOG.md via make changelog-patch for v0.0.6
- BBL-101 updating mysql-client based image version to a fix one


<a name="v0.0.5"></a>
## [v0.0.5] - 2019-08-21

- Updating CHANGELOG.md via make changelog-patch for v0.0.5
- BBL-95 udpating kubectl readmme.md
- BBL-95 dockerfile, makefile and readme.md updates for both kubectl and kubectx
- BBL-95 updating README.mds
- adding dockerized k8s kubectx and kubenx
- adding dockerized k8s kubectl


<a name="v0.0.4"></a>
## [v0.0.4] - 2019-07-12

- Adding CHANGELOG.md for v0.0.4
- updating figures url by github raw endpoint in order to let README.md images to be publicly accesible by docker-hub and tf-registry among others
- fixing public figure url
- Updating terraform-resources Makefile in order to test different binaries
- fixing figures url
- adding CHANGELOG.md with new release semtag v0.0.3


<a name="v0.0.3"></a>
## [v0.0.3] - 2019-07-05

- adding -o flag to generate changelog based on next release tag
- Makefile update for git-chglog patch, minor, major CHANGELOG.md generation support.
- makefile indentation update
- Updating Makefile to support git-release tagging patch, minor and major semtags.
- readme code block indentation
- Updating readme.mds
- Adding new git-release docker file w/ git-chglog and semtag support
- Set theme jekyll-theme-slate
- BBL-33 updating main readme.md with terraform doc docker cloud build ref
- BBL-33 terraform-docs binbash image related files


<a name="v0.0.2"></a>
## [v0.0.2] - 2019-05-16

- BBL-74 fixing alpine version to 3.8.4
- BBL-74 several README.md updates
- BBL-74 terraform-landscape docker files added
- updating mysql-client community version pkg
- BBL-64 adding missing # char for makefiles autohelp comments
- BBL-64 updating makefiles to be self documented
- BBL-64 updating docker-compose file to it's std name.
- BBL-64 adding .gitignore and .sql example file for mysql-client docker image tests
- BBL-64 README.md has been updated with the new mysql-client badge (will take effect after PR and docker hub autobild configs update)
- BBL-64 adding mysql-client 5.6,5.7 and 8.0 compatible to be reference in the jenkins-module documentation.
- BBL-64 adding jenkins local testing env related files to be referenced in the jenkins-modules README.md
- Merge branch 'master' into 39-dockerize-terraform
- BBL-39 jenkins image readme update
- BBL-39 jenkins image readme minor update
- BBL-39 jenkins image readme update
- BBL-39 README.md updated with badges.
- BBL-39 php7.1-composer dockerfiles added (cloud.docker.com autobuild pending) - wp_provision image to be deprecated in favor of this image.
- BBL-39 Jenkins dockerfile and its dependencies added (cloud.docker.com autobuild pending)
- BBL-39 terraform related files updated to use DOCKER_TAG env var in order to simplfy the automated cloud build
- Update docker file to adapt it our testing flow.


<a name="v0.0.1"></a>
## v0.0.1 - 2019-04-24

- Add build hook for docker cloud. ([#3](https://github.com/binbashar/public-docker-images/issues/3))
- Update docker file to adapt it our testing flow. ([#2](https://github.com/binbashar/public-docker-images/issues/2))
- Dockerize terraform and terratest. ([#1](https://github.com/binbashar/public-docker-images/issues/1))
- Initial commit


[Unreleased]: https://github.com/binbashar/public-docker-images/compare/v0.0.40...HEAD
[v0.0.40]: https://github.com/binbashar/public-docker-images/compare/v0.0.39...v0.0.40
[v0.0.39]: https://github.com/binbashar/public-docker-images/compare/v0.0.38...v0.0.39
[v0.0.38]: https://github.com/binbashar/public-docker-images/compare/v0.0.37...v0.0.38
[v0.0.37]: https://github.com/binbashar/public-docker-images/compare/v0.0.36...v0.0.37
[v0.0.36]: https://github.com/binbashar/public-docker-images/compare/v0.0.35...v0.0.36
[v0.0.35]: https://github.com/binbashar/public-docker-images/compare/v0.0.34...v0.0.35
[v0.0.34]: https://github.com/binbashar/public-docker-images/compare/v0.0.33...v0.0.34
[v0.0.33]: https://github.com/binbashar/public-docker-images/compare/v0.0.32...v0.0.33
[v0.0.32]: https://github.com/binbashar/public-docker-images/compare/v0.0.31...v0.0.32
[v0.0.31]: https://github.com/binbashar/public-docker-images/compare/v0.0.30...v0.0.31
[v0.0.30]: https://github.com/binbashar/public-docker-images/compare/v0.0.29...v0.0.30
[v0.0.29]: https://github.com/binbashar/public-docker-images/compare/v0.0.28...v0.0.29
[v0.0.28]: https://github.com/binbashar/public-docker-images/compare/v0.0.27...v0.0.28
[v0.0.27]: https://github.com/binbashar/public-docker-images/compare/v0.0.26...v0.0.27
[v0.0.26]: https://github.com/binbashar/public-docker-images/compare/v0.0.25...v0.0.26
[v0.0.25]: https://github.com/binbashar/public-docker-images/compare/v0.0.24...v0.0.25
[v0.0.24]: https://github.com/binbashar/public-docker-images/compare/v0.0.23...v0.0.24
[v0.0.23]: https://github.com/binbashar/public-docker-images/compare/v0.0.22...v0.0.23
[v0.0.22]: https://github.com/binbashar/public-docker-images/compare/v0.0.21...v0.0.22
[v0.0.21]: https://github.com/binbashar/public-docker-images/compare/v0.0.20...v0.0.21
[v0.0.20]: https://github.com/binbashar/public-docker-images/compare/v0.0.19...v0.0.20
[v0.0.19]: https://github.com/binbashar/public-docker-images/compare/v0.0.18...v0.0.19
[v0.0.18]: https://github.com/binbashar/public-docker-images/compare/v0.0.17...v0.0.18
[v0.0.17]: https://github.com/binbashar/public-docker-images/compare/v0.0.16...v0.0.17
[v0.0.16]: https://github.com/binbashar/public-docker-images/compare/v0.0.15...v0.0.16
[v0.0.15]: https://github.com/binbashar/public-docker-images/compare/v0.0.14...v0.0.15
[v0.0.14]: https://github.com/binbashar/public-docker-images/compare/v0.0.13...v0.0.14
[v0.0.13]: https://github.com/binbashar/public-docker-images/compare/v0.0.12...v0.0.13
[v0.0.12]: https://github.com/binbashar/public-docker-images/compare/v0.0.11...v0.0.12
[v0.0.11]: https://github.com/binbashar/public-docker-images/compare/v0.0.10...v0.0.11
[v0.0.10]: https://github.com/binbashar/public-docker-images/compare/v0.0.9...v0.0.10
[v0.0.9]: https://github.com/binbashar/public-docker-images/compare/v0.0.8...v0.0.9
[v0.0.8]: https://github.com/binbashar/public-docker-images/compare/v0.0.7...v0.0.8
[v0.0.7]: https://github.com/binbashar/public-docker-images/compare/v0.0.6...v0.0.7
[v0.0.6]: https://github.com/binbashar/public-docker-images/compare/v0.0.5...v0.0.6
[v0.0.5]: https://github.com/binbashar/public-docker-images/compare/v0.0.4...v0.0.5
[v0.0.4]: https://github.com/binbashar/public-docker-images/compare/v0.0.3...v0.0.4
[v0.0.3]: https://github.com/binbashar/public-docker-images/compare/v0.0.2...v0.0.3
[v0.0.2]: https://github.com/binbashar/public-docker-images/compare/v0.0.1...v0.0.2
