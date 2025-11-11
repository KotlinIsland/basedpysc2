load("@my_deps//:requirements.bzl", "requirement")

package(default_visibility = ["//visibility:public"])

licenses(["notice"])

py_binary(
    name = "replay_actions",
    srcs = ["replay_actions.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/lib:features",
        "//src/pysc2/lib:gfile",
        "//src/pysc2/lib:point",
        "//src/pysc2/lib:protocol",
        "//src/pysc2/lib:remote_controller",
        "//src/pysc2/lib:replay",
        "//src/pysc2/lib:static_data",
        "//src/pysc2/maps",  # build_cleaner: keep
        "//src/pysc2/run_configs",
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
        "@s2client_proto//s2clientprotocol:sc2api_py_pb2",
    ],
)

py_binary(
    name = "gen_actions",
    srcs = ["gen_actions.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/lib:static_data",
        "//src/pysc2/maps",
        "//src/pysc2/run_configs",
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
        "@s2client_proto//s2clientprotocol:sc2api_py_pb2",
    ],
)

py_binary(
    name = "gen_data",
    srcs = ["gen_data.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/lib:static_data",
        "//src/pysc2/maps",
        "//src/pysc2/run_configs",
        "@absl_py//absl:app",
        "@s2client_proto//s2clientprotocol:sc2api_py_pb2",
    ],
)

py_binary(
    name = "check_apm",
    srcs = ["check_apm.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/lib:actions",
        "//src/pysc2/lib:features",
        "//src/pysc2/lib:point",
        "//src/pysc2/lib:units",
        "//src/pysc2/maps",
        "//src/pysc2/run_configs",
        "@absl_py//absl:app",
        "@s2client_proto//s2clientprotocol:sc2api_py_pb2",
    ],
)

py_binary(
    name = "benchmark_observe",
    srcs = ["benchmark_observe.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/lib:replay",
        "//src/pysc2/lib:stopwatch",
        "//src/pysc2/maps",
        "//src/pysc2/run_configs",
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
        "@s2client_proto//s2clientprotocol:sc2api_py_pb2",
    ],
)

py_binary(
    name = "benchmark_replay",
    srcs = ["benchmark_replay.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/lib:actions",
        "//src/pysc2/lib:features",
        "//src/pysc2/lib:point_flag",
        "//src/pysc2/lib:replay",
        "//src/pysc2/lib:stopwatch",
        "//src/pysc2/run_configs",
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
        "@s2client_proto//s2clientprotocol:sc2api_py_pb2",
    ],
)

py_binary(
    name = "mem_leak_check",
    srcs = ["mem_leak_check.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
        requirement("psutil"),  # build_cleaner: keep
        "//src/pysc2/lib:protocol",
        "//src/pysc2/maps",
        "//src/pysc2/run_configs",
        "@s2client_proto//s2clientprotocol:sc2api_py_pb2",
    ],
)

py_binary(
    name = "gen_versions",
    srcs = ["gen_versions.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "@absl_py//absl:app",
        requirement("requests"),
    ],
)

py_binary(
    name = "map_list",
    srcs = ["map_list.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/maps",
        "@absl_py//absl:app",
    ],
)

py_binary(
    name = "play",
    srcs = ["play.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/env:sc2_env",
        "//src/pysc2/lib:point_flag",
        "//src/pysc2/lib:renderer_human",
        "//src/pysc2/lib:replay",
        "//src/pysc2/lib:stopwatch",
        "//src/pysc2/maps",
        "//src/pysc2/run_configs",
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
        "@s2client_proto//s2clientprotocol:sc2api_py_pb2",
    ],
)

py_binary(
    name = "play_vs_agent",
    srcs = ["play_vs_agent.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
        "@absl_py//absl/logging",
        requirement("portpicker"),
        "//src/pysc2/agents",  # build_cleaner: keep
        "//src/pysc2/env:lan_sc2_env",
        "//src/pysc2/env:run_loop",
        "//src/pysc2/env:sc2_env",
        "//src/pysc2/lib:point_flag",
        "//src/pysc2/lib:renderer_human",
        "//src/pysc2/maps",
        "//src/pysc2/run_configs",
        "@s2client_proto//s2clientprotocol:sc2api_py_pb2",
    ],
)

py_binary(
    name = "agent_remote",
    srcs = ["agent_remote.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/agents",  # build_cleaner: keep
        "//src/pysc2/env:remote_sc2_env",
        "//src/pysc2/env:run_loop",
        "//src/pysc2/env:sc2_env",
        "//src/pysc2/lib:point_flag",
        "//src/pysc2/lib:portspicker",
        "//src/pysc2/lib:renderer_human",
        "//src/pysc2/maps",
        "//src/pysc2/run_configs",
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
        "@absl_py//absl/logging",
        "@s2client_proto//s2clientprotocol:sc2api_py_pb2",
    ],
)

py_binary(
    name = "replay_info",
    srcs = ["replay_info.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/lib:gfile",
        "//src/pysc2/lib:remote_controller",
        "//src/pysc2/lib:replay",
        "//src/pysc2/run_configs",
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
        "@s2client_proto//s2clientprotocol:common_py_pb2",
        "@s2client_proto//s2clientprotocol:sc2api_py_pb2",
    ],
)

py_binary(
    name = "agent",
    srcs = ["agent.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/agents",  # build_cleaner: keep
        "//src/pysc2/env:available_actions_printer",
        "//src/pysc2/env:run_loop",
        "//src/pysc2/env:sc2_env",
        "//src/pysc2/lib:point_flag",
        "//src/pysc2/lib:stopwatch",
        "//src/pysc2/maps",
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
    ],
)

py_binary(
    name = "valid_actions",
    srcs = ["valid_actions.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/lib:actions",
        "//src/pysc2/lib:features",
        "//src/pysc2/lib:point_flag",
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
    ],
)

py_binary(
    name = "compare_binaries",
    srcs = ["compare_binaries.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/lib:image_differencer",
        "//src/pysc2/lib:proto_diff",
        "//src/pysc2/lib:remote_controller",
        "//src/pysc2/lib:replay",
        "//src/pysc2/lib:stopwatch",
        "//src/pysc2/run_configs",
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
        "@s2client_proto//s2clientprotocol:sc2api_py_pb2",
    ],
)

py_binary(
    name = "battle_net_maps",
    srcs = ["battle_net_maps.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/run_configs",
        "@absl_py//absl:app",
    ],
)

py_binary(
    name = "reencode_replays",
    srcs = ["reencode_replays.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "//src/pysc2/lib:replay",
        "//src/pysc2/run_configs",
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
        "@s2client_proto//s2clientprotocol:sc2api_py_pb2",
    ],
)

py_binary(
    name = "update_battle_net_cache",
    srcs = ["update_battle_net_cache.py"],
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        "@absl_py//absl:app",
        "@absl_py//absl/flags",
        requirement("mpyq"),
        "//src/pysc2/run_configs",
        "@s2protocol_archive//:versions",
    ],
)

py_binary(
    name = "replay_version",
    srcs = ["replay_version.py"],
    deps = [
        "//src/pysc2/lib:replay",
        "//src/pysc2/run_configs",
        "@absl_py//absl:app",
    ],
)
