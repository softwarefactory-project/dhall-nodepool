# dhall-nodepool

`dhall-nodepool` contains [Dhall][dhall-lang] bindings to [Nodepool][nodepool],
so you can generate nodepool configuration from Dhall expressions.

## Example

```dhall
-- ./examples/demo.dhall
let Nodepool = ../package.dhall

in  Nodepool.Config::{
    , providers =
      [ Nodepool.Providers.static
          Nodepool.Static::{
          , name = "provider_static"
          , pools =
            [ Nodepool.Static.Pool::{
              , name = "main"
              , nodes =
                [ Nodepool.Static.Pool.Node::{
                  , name = "static.example.com"
                  , labels = [ "mylabel" ]
                  }
                ]
              }
            ]
          }
      ]
    , labels = Some [ Nodepool.Label::{ name = "mylabel" } ]
    , zookeeper-tls = Nodepool.ZookeeperTls::{
      , ca = "my.ca"
      , cert = "my.crt"
      , key = "my.key"
      }
    , zookeeper-servers =
      [ Nodepool.ZookeeperServer::{ host = "zk01.example.com" } ]
    }

```

```yaml
# dhall-to-yaml --file examples/demo.dhall
labels:
  - name: mylabel
providers:
  - driver: static
    name: provider_static
    pools:
      - name: main
        nodes:
          - labels:
              - mylabel
            name: static.example.com
zookeeper-servers:
  - host: zk01.example.com
zookeeper-tls:
  ca: my.ca
  cert: my.crt
  key: my.key

```

## Changes

Frozen package are available in the tag commit.

### 0.2.0

- Initial release
