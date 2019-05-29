# noobaa-mixins
Prometheus Alerts for [NooBaa](https://github.com/noobaa/noobaa-core)

### Prerequesites 
* Install GO and have your GOPATH updated
* Install [jsonnet](https://github.com/google/jsonnet#building-jsonnet)
```
brew install jsonnet
```
* Install [jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler#install)
```
go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb
```

* Install [promtool](https://github.com/prometheus/prometheus)
```
go get github.com/prometheus/prometheus/cmd/promtool
```


### Usage
install dependencies
```
jb install
```

Generate the prometheus alert files by
```
make prometheus_alert_rules.yaml
```

run tests by
```
make test
```
