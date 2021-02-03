{ Providers =
    ./Providers.dhall sha256:9bb97866e55076e1ab2f2665fa1c8e47bc39d16a7bd6479b4737145b2e9004c7
, Aws =
    ./Aws/package.dhall sha256:c3da126bdd8bbb5166c28e492c188b415ff2e3de3ad53a739d4e5a98a623ef9a
, Config =
    ./Config/package.dhall sha256:fe52f3eb4257b0b9db089bbda4cd7a78151ad3f965811d7a538ee5a08d9cc558
, Diskimage =
    ./Diskimage/package.dhall sha256:bf857795f7c20cdb2823f7f56ee7c1aaf6349eb091eb4b182069e41da41b9cd2
, Gce =
    ./Gce/package.dhall sha256:446d65b5fdee0cd31cc1729c0781bf33e44a96f45271de21e61393ad89a8b284
, Kubernetes =
    ./Kubernetes/package.dhall sha256:042abe63f258cac3729d7fa6e635928f5d6c767093e6b27dc984591f70d48aed
, Label =
    ./Label/package.dhall sha256:57c0b99faadd31679c690a00b2eac11f17245e291e8f0002fe17bd07f85cbbb7
, Openshift =
    ./Openshift/package.dhall sha256:ecaef4a607a3c61b5b1dffed1b730fd36838b614bd9bf8350ab80337c6866d28
, Openshiftpods =
    ./Openshiftpods/package.dhall sha256:301d3f26740a505033ab3cd2e461286297f36cfbd9d7c93854229add94d946be
, Openstack =
    ./Openstack/package.dhall sha256:8bfebc161fc855f5695a6123fb2382f73ec5f4ddf6d97b1f49446110bb29ffcd
, Static =
    ./Static/package.dhall sha256:850e89941c63380b5e9b67955406fe8ccd1d3818338cd2d7eda3a6831bcc9b59
, Webapp =
    ./Webapp/package.dhall sha256:0e3cde952af63619172b62506a55c64b2f4ce4dce4c900b9603d79848c151f4a
, ZookeeperServer =
    ./ZookeeperServer/package.dhall sha256:661ed4a88a521128cc2be47452415fcb2af3bc4584c7fb15df20725d4d06d8cb
, ZookeeperTls =
    ./ZookeeperTls/package.dhall sha256:924614423b23ea0bcd0929290961d9906362de34b0f3243e915e91589c581826
}
