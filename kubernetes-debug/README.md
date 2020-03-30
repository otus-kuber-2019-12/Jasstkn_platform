# Выполнено ДЗ №12

 - [x] Основное ДЗ

## В процессе сделано:
 - Запущен дебаг контейнер в agentless режиме
 ```
 > docker inspect 8a6e2676d0b8
 ...
 "CapAdd": null,
 "CapDrop": null,
 "Capabilities": null,
 ...
 ```
 Версия приложения v0.0.1, а коммит, содержащий добавление капабилитис:
 ```
 CapAdd:      strslice.StrSlice([]string{"SYS_PTRACE", "SYS_ADMIN"}),
 ```
 был релизнут в версии v0.1.1. После обновления `strace` работает как нужно:
 ```
 kubectl debug web --agentless=false --port-forward=true
 pod web PodIP 10.12.1.8, agentPodIP 10.128.0.27
 wait for forward port to debug agent ready...
 Forwarding from 127.0.0.1:10027 -> 10027
 Forwarding from [::1]:10027 -> 10027
 Handling connection for 10027
                             pulling image nicolaka/netshoot:latest...
 latest: Pulling from nicolaka/netshoot
 Digest: sha256:99d15e34efe1e3c791b0898e05be676084638811b1403fae59120da4109368d4
 Status: Image is up to date for nicolaka/netshoot:latest
 starting debug container...
 container created, open tty...
 bash-5.0# strace -c -p1
 strace: Process 1 attached
 ^Cstrace: Process 1 detached
```
 - Запущен `netperf-operator`:
 ```
 k describe netperfs.app.example.com example
 Name:         example
 Namespace:    default
 Labels:       <none>
 Annotations:  kubectl.kubernetes.io/last-applied-configuration:
                {"apiVersion":"app.example.com/v1alpha1","kind":"Netperf","metadata":{"annotations":{},"name":"example","namespace":"default"}}
 API Version:  app.example.com/v1alpha1
 Kind:         Netperf
 Metadata:
   Creation Timestamp:  2020-03-29T19:26:19Z
   Generation:          4
   Resource Version:    41379
   Self Link:           /apis/app.example.com/v1alpha1/namespaces/default/netperfs/example
   UID:                 e007b7d5-09db-48ac-b32f-cd47995c6060
 Spec:
   Client Node:
   Server Node:
 Status:
   Client Pod:          netperf-client-cd47995c6060
   Server Pod:          netperf-server-cd47995c6060
   Speed Bits Per Sec:  8696.76
   Status:              Done
 Events:                <none>
 ```
 
## Как запустить проект:
- Добавить securityContext c capability: SYS_PTRACE
```
kubectl apply -f agent_daemonset.yml
```

## Как проверить работоспособность:
```

```

## PR checklist:
 - [x] Выставлен label с номером домашнего задания

## Ответы на вопросы:
- 
