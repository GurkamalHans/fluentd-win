$pkg_name="fluentd"
$pkg_origin="gurkamalhans"
$pkg_version=@"1.0.2"
$pkg_deps=@(
	"core/ruby",
	"core/gcc",
	"core/gcc-libs",
  "core/powershell"
)
$pkg_upstream_url="https://www.fluentd.org/"
$pkg_description="Fluentd is an open source data collector, which lets \
  you unify the data collection and consumption for a better use and \
  understanding of data."
$pkg_license=@("Apache-2.0")
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_source="http://packages.treasuredata.com.s3.amazonaws.com/3/windows/td-agent-3.1.1-0-x64.msi"
$pkg_bin_dirs="bin"
$pkg_exports=@(
  "forwarded-port"="input.forward.port"
  "http-port"="input.http.port"
)
$pkg_exposes=@("forward-port", "http-port")

function Invoke-Download {
  return 0;
}

function Invoke-Verify {
  return 0;
}

function Invoke-Unpack {
  return 0;
}

function Invoke-Build {
  local _bundler_dir
  _bundler_dir=$(pkg_path_for bundler)

  export GEM_HOME=${pkg_path}/vendor/bundle
  export GEM_PATH=${_bundler_dir}:${GEM_HOME}

  cat > Gemfile <<-GEMFILE
    source 'https://rubygems.org'
    gem 'fluentd', '= ${pkg_version}'
GEMFILE
  
  bundle install --jobs 2 --retry 5 --path ./vendor/bundle --binstubs
}

function Invoke-Install {
  copy -r . "$pkg_prefix/"
  fix_interpreter "$pkg_prefix/bin/*" core/coreutils bin/env
}
