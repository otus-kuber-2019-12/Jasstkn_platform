# Выполнено ДЗ №11

 - [x] Основное ДЗ
 - [x] Задание co :star: | Автоматизация подготовки Kubernetes cluster
 - [x] Задание co :star: | Continuous Integration
 - [x] Задание со :star: | Установка Istio operator
 - [x] Задание со :star: | Инфраструктурный репозиторий
 - [x] Задание со :star: | Flagger one more Canary
 - [x] Задание со :star: | Flagger Notification
 - [x] Задание со :star: | Distributed Tracing
 - [ ] Задание со :star::star: | Monorepos: Please don’t!
 - [x] Задание со :star::star: | Argo CD

## В процессе сделано:
 - Сконфигурирован репозиторий [base-layer](https://gitlab.com/Jasstkn/base-layer) с возможностью автоматической валидации terraform кода, построения плана, деплоя и дестроя окружения
 - Сконфигурирован репозиторий [platform-layer](https://gitlab.com/Jasstkn/platform-layer) c возможностью автоматического построения диффа, деплоя и дестроя инфраструктурных сервисов (flux, helm-operator, istio operator)
 - Сконфигурирован репозиторий [microservices-demo](https://gitlab.com/Jasstkn/microservices-demo) с возможностью валидации Dockerfile-ов, сборки единовременно всех образов или образа конкретного приложения и пуша в удаленный докер репозиторий
 - Сконфигурирована GitOps система на основе FluxCD + Helm-Release для автоматического деплоя новых образов или изменений в хелм-чартах
 - Установлен Istio несколькими способами: как add-on для GKE, через istioctl и через Istio Operator (в base-layer репозитории istio можно включить через переменную окружения)
 - Настроен Canary на базе Flagger + Istio
- Сконфигурированы [нотификации](https://gitlab.com/Jasstkn/platform-layer/-/blob/master/deploy-platform/values/flagger.default.yaml#L8) в Slack от Flagger
<img width="441" alt="Screenshot 2020-03-22 at 00 06 58" src="https://user-images.githubusercontent.com/20466436/77236582-0dad0080-6bd1-11ea-9d0a-3b05498d19f6.png">

 - Был [задеплоен](https://gitlab.com/Jasstkn/platform-layer/-/blob/master/istio-operator/istio-config-profile.yaml#L9) Jaeger из коробки с Istio

<img width="1429" alt="Screenshot 2020-03-22 at 00 15 54" src="https://user-images.githubusercontent.com/20466436/77236735-4e594980-6bd2-11ea-986d-aee38424a13c.png">
<img width="1429" alt="Screenshot 2020-03-22 at 00 18 18" src="https://user-images.githubusercontent.com/20466436/77236770-a3955b00-6bd2-11ea-9c21-562431f6053d.png">

- Сконфигурирован деплой через ArgoCD
<img width="1429" alt="Screenshot 2020-03-26 at 12 21 47" src="https://user-images.githubusercontent.com/20466436/77630648-73e0ad00-6f5c-11ea-9686-6312ec193b82.png">
<img width="1429" alt="Screenshot 2020-03-26 at 12 22 10" src="https://user-images.githubusercontent.com/20466436/77630626-6cb99f00-6f5c-11ea-8295-f12809500e7a.png">
Понравилось:
- UI
- Довольно быстро удалось законфигурить (низкий порог вхождения)

Не понравилось:
- Плохо с декларативным описанием приложений, я впихнула это в [platform-layer](https://gitlab.com/Jasstkn/platform-layer/-/tree/master/argocd/releases), но естественно там этому не место и нужно создавать репу под описание окружений. Другой вариант - натыкивать через UI, что лишает декларативности и нормальной истории изменений (не уверена, что можно откатить именно Application)
- Из-за AdBlock не деплоился adservice 😆. Не стала разбираться, что именно пошло не так.
- Плохо понимаю, какие подводные камни могут встретиться - нет ощущения хорошей управляемости как с тем же GitlabCi / Jenkins.
- Для хелмчартов пришлось править версию на с v2 на v1. Приложение не умеет работать с v2.

## Как запустить проект:
- base-layer: запустить пайплайн в репозитории
- platform-layer: запустить пайплайн в репозитории
- microservices-demo: добавить ключ flux в свой профиль и проверить, что приложения задеплоились. Для сборки образов: чтобы собрать один компонент переменная в CI/CD SERVICE="service_name, ex. frontend" или для сборки всех компонент SERVICE: all, создать тег - пайплайн запуститься автоматически и продеплоится автоматически, если релиз не мажорный.

- Установка Istio Operator выполнена в [gitlab-ci](https://gitlab.com/Jasstkn/platform-layer/-/blob/master/.gitlab-ci.yml#L42)
## Как проверить работоспособность:
```
k get svc -n istio-system | grep LoadBalancer
curl <IP>
```
Пример работы Canary:
```
  Warning  Synced  10m    flagger  IsPrimaryReady failed: primary daemonset productcatalogservice-primary.microservices-demo not ready: waiting for rollout to finish: observed deployment generation less then desired generation
  Normal   Synced  9m34s  flagger  Initialization done! productcatalogservice.microservices-demo
  Normal   Synced  34s    flagger  New revision detected! Scaling up productcatalogservice.microservices-demo
  Normal   Synced  4s     flagger  Starting canary analysis for productcatalogservice.microservices-demo
  Normal   Synced  4s     flagger  Advance productcatalogservice.microservices-demo canary weight 5
```

## PR checklist:
 - [x] Выставлен label с номером домашнего задания

## Ответы на вопросы:
- Почему первый раз Canary отроллбечился?
Был неправильно настроен load-generator (на внутренний адрес) и не хватало метрик для анализа релиза 