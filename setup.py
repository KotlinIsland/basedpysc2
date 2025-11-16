"""Setup script for pysc2 - builds using Bazel, then packages."""
import subprocess
from pathlib import Path
from setuptools import setup, find_packages
from setuptools.command.build_py import build_py as _build_py


class BuildWithBazel(_build_py):
    """Custom build that compiles C++ extension with Bazel first."""

    def run(self):
        """Build the C++ extension with Bazel, then run normal build."""

        # TODO: need to handle .pyd for windows

        cc_dir = Path("src/pysc2/env/converter/cc/python")
        cc_dir.mkdir(parents=True, exist_ok=True)

        game_data_dir = Path("src/pysc2/env/converter/cc/game_data/python")
        game_data_dir.mkdir(parents=True, exist_ok=True)

        proto_dir = Path("src/pysc2/env/converter/proto")
        proto_dir.mkdir(parents=True, exist_ok=True)

        # Build with Bazel
        subprocess.check_call(["bazel", "build", f"//{cc_dir}:converter", f"//{game_data_dir}:uint8_lookup", f"//{proto_dir}:all"])

        # Copy the .so files
        subprocess.check_call(
            f"cp -f bazel-bin/{game_data_dir}/uint8_lookup.so {game_data_dir}/",
            shell=True,
        )
        subprocess.check_call(
            f"cp -f bazel-bin/{cc_dir}/converter.so {cc_dir}/",
            shell=True,
        )
        subprocess.check_call(
            f"cp -f bazel-bin/{proto_dir}/converter_pb2.py {proto_dir}/",
            shell=True,
        )

        super().run()


setup(
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    cmdclass={"build_py": BuildWithBazel},
    package_data={
        "pysc2.env.converter.cc.python": ["*.so"],
        "pysc2.env.converter.cc.game_data.python": ["*.so"],
    },
    has_ext_modules=lambda: True,  # Mark as platform-specific
)
