# dhall-nodepool

`dhall-nodepool` contains [Dhall][dhall-lang] bindings to [Nodepool][nodepool],
so you can generate nodepool configuration from Dhall expressions.

## Example

```dhall
{- ./examples/demo.dhall -}
let Nodepool =
        env:DHALL_NODEPOOL
      ? https://softwarefactory-project.io/cgit/software-factory/dhall-nodepool/plain/package.dhall

in  Nodepool.Config::{
    , providers =
      [ Nodepool.Providers.static
          Nodepool.Static::{
          , name = "provider_static"
          , pools =
            [ Nodepool.StaticPool::{
              , name = "main"
              , nodes =
                [ Nodepool.StaticPoolNode::{
                  , name = "static.example.com"
                  , labels = [ "mylabel" ]
                  }
                ]
              }
            ]
          }
      ]
    , labels = [ Nodepool.Label::{ name = "mylabel" } ]
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

```