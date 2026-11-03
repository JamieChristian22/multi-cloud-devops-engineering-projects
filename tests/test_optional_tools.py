"""Enforce honest optional IaC tool checks in the DevOps validator."""
from pathlib import Path
import os
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
CHECK = ROOT / "scripts" / "check-optional-iac.sh"


class OptionalCLITests(unittest.TestCase):
    def invoke(self, terraform=None, helm=None):
        with tempfile.TemporaryDirectory() as tmp:
            folder = Path(tmp)
            for name, code in (("terraform", terraform), ("helm", helm)):
                if code is not None:
                    stub = folder / name
                    stub.write_text(f"#!/bin/sh\nexit {code}\n", encoding="utf-8")
                    stub.chmod(0o755)
            return subprocess.run(
                ["/bin/bash", str(CHECK)],
                cwd=ROOT, env={**os.environ, "PATH": str(folder)},
                text=True, capture_output=True, check=False, timeout=20,
            )

    def test_missing_tools_explicitly_skipped(self):
        p = self.invoke()
        self.assertEqual(p.returncode, 0, p.stderr)
        self.assertIn("SKIP: Terraform", p.stdout)
        self.assertIn("SKIP: Helm", p.stdout)

    def test_terraform_failure_must_fail_ci(self):
        p = self.invoke(terraform=2)
        self.assertNotEqual(p.returncode, 0)
        self.assertNotIn("SKIP: Terraform", p.stdout)

    def test_helm_failure_must_fail_ci(self):
        p = self.invoke(terraform=0, helm=4)
        self.assertNotEqual(p.returncode, 0)
        self.assertNotIn("SKIP: Helm", p.stdout)

    def test_successful_tool_checks(self):
        p = self.invoke(terraform=0, helm=0)
        self.assertEqual(p.returncode, 0, p.stderr)
        self.assertIn("PASS: Terraform", p.stdout)
        self.assertIn("PASS: Helm", p.stdout)


if __name__ == "__main__":
    unittest.main()
