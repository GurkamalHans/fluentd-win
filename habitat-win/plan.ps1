$pkg_name="fluentd"
$pkg_origin="gurkamalhans"
$pkg_version=@"1.0.2"
$pkg_deps=@(
	"core/ruby",
	"core/gcc",
	"core/gcc-libs",
  "core/powershell"
)
$pkg_license=@("Apache-2.0")
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_source="http://packages.treasuredata.com.s3.amazonaws.com/3/windows/td-agent-3.1.1-0-x64.msi"
$pkg_exports=@(
  "forwarded-port"="input.forward.port"
  "http-port"="input.http.port"
)
$pkg_exposes=@("forward-port", "http-port")

function Invoke-Download { }

function Invoke-Verify { }

function Invoke-Unpack { }

function Invoke-Build { }

function Invoke-Install { }
