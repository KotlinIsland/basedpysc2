"""Setup script for pysc2 - builds using Bazel, then packages."""
import subprocess
from pathlib import Path
from setuptools import setup
from setuptools.command.build_py import build_py as _build_py


class BuildWithBazel(_build_py):
    """Custom build that compiles C++ extension with Bazel first."""

    def run(self):
        """Build the C++ extension with Bazel, then run normal build."""
        # Build with Bazel
        subprocess.check_call(["bazel", "build", "//src/pysc2/env/converter/cc/python:converter"])

        # Copy the .so file
        so_dir = Path("src/pysc2/env/converter/cc/python")
        so_dir.mkdir(parents=True, exist_ok=True)

        subprocess.check_call(
            "cp -f bazel-bin/src/pysc2/env/converter/cc/python/converter*.so src/pysc2/env/converter/cc/python/",
            shell=True,
        )

        # Run normal build
        super().run()


setup(
    cmdclass={"build_py": BuildWithBazel},
    package_data={
        "pysc2.env.converter.cc.python": ["*.so"],
    },
    has_ext_modules=lambda: True,  # Mark as platform-specific
)
