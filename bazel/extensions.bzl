"""Bzlmod extension for loading external repositories."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# pybind11 BUILD content
_PYBIND11_BUILD = """\
licenses(["notice"])

config_setting(
    name = "msvc_compiler",
    flag_values = {"@bazel_tools//tools/cpp:compiler": "msvc-cl"},
    visibility = ["//visibility:public"],
)

config_setting(
    name = "windows",
    constraint_values = ["@platforms//os:windows"],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "pybind11",
    hdrs = glob([
        "include/**/*.h",
    ]),
    includes = ["include"],
    visibility = ["//visibility:public"],
)
"""

def _load_external_repos_impl(module_ctx):
    """Implementation of the load_external_repos extension."""
    # module_ctx doesn't have is_root, repos are loaded for all modules

    # absl_py
    http_archive(
        name = "absl_py",
        strip_prefix = "abseil-py-main",
        urls = ["https://github.com/abseil/abseil-py/archive/main.zip"],
    )

    # gflags (required by glog)
    http_archive(
        name = "com_github_gflags_gflags",
        sha256 = "34af2f15cf7367513b352bdcd2493ab14ce43692d2dcd9dfc499492966c64dcf",
        strip_prefix = "gflags-2.2.2",
        urls = ["https://github.com/gflags/gflags/archive/v2.2.2.tar.gz"],
    )

    # glog
    http_archive(
        name = "glog",
        sha256 = "6281aa4eeecb9e932d7091f99872e7b26fa6aacece49c15ce5b14af2b7ec050f",
        urls = ["https://github.com/google/glog/archive/96a2f23dca4cc7180821ca5f32e526314395d26a.zip"],
        strip_prefix = "glog-96a2f23dca4cc7180821ca5f32e526314395d26a",
    )

    # pybind11 - using inline BUILD content
    http_archive(
        name = "pybind11_bazel",
        strip_prefix = "pybind11_bazel-master",
        urls = ["https://github.com/pybind/pybind11_bazel/archive/refs/heads/master.zip"],
    )

    http_archive(
        name = "pybind11",
        build_file_content = _PYBIND11_BUILD,
        strip_prefix = "pybind11-2.13.6",
        urls = ["https://github.com/pybind/pybind11/archive/v2.13.6.tar.gz"],
    )

    # s2client_proto
    http_archive(
        name = "s2client_proto",
        urls = ["https://github.com/Blizzard/s2client-proto/archive/refs/heads/master.zip"],
        strip_prefix = "s2client-proto-master",
        patches = ["@@//bazel:s2clientprotocol.patch"],
    )

    # s2protocol
    http_archive(
        name = "s2protocol_archive",
        urls = ["https://github.com/Blizzard/s2protocol/archive/refs/heads/master.zip"],
        strip_prefix = "s2protocol-master",
        build_file = "@@//bazel:BUILD.s2protocol",
    )

    # dm_env
    http_archive(
        name = "dm_env_archive",
        urls = ["https://github.com/deepmind/dm_env/archive/refs/heads/master.zip"],
        strip_prefix = "dm_env-master",
        build_file = "@@//bazel:BUILD.dm_env",
    )

    # dm_env_rpc
    http_archive(
        name = "dm_env_rpc_archive",
        urls = ["https://github.com/deepmind/dm_env_rpc/archive/refs/heads/master.zip"],
        strip_prefix = "dm_env_rpc-master",
        build_file = "@@//bazel:BUILD.dm_env_rpc",
    )

    # grpc
    http_archive(
        name = "com_github_grpc_grpc",
        strip_prefix = "grpc-master",
        urls = ["https://github.com/grpc/grpc/archive/refs/heads/master.zip"],
    )

load_external_repos = module_extension(
    implementation = _load_external_repos_impl,
)
