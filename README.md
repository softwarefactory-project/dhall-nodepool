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
    , zookeeper-servers =
      [ Nodepool.ZookeeperServer::{ host = "zk01.example.com" } ]
    }

```

```yaml
# dhall-to-yaml --file examples/demo.dhall
zookeeper-servers:
  - host: zk01.example.com
    port: 2181

```
