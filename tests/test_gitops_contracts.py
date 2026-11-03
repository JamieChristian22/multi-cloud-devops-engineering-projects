"""Validate GitOps manifest references without connecting to a cluster."""
from pathlib import Path
import unittest

import yaml

ROOT = Path(__file__).resolve().parents[1]
GITOPS = ROOT / "04-argocd-gitops-platform"
PUBLIC_REPOSITORY = "https://github.com/JamieChristian22/multi-cloud-devops-engineering-projects.git"
ENVIRONMENTS = ("dev", "staging", "prod")


def load(path):
    with path.open(encoding="utf-8") as source:
        return yaml.safe_load(source)


class GitOpsContracts(unittest.TestCase):
    def test_applicationset_public_repo_and_environments(self):
        manifest = load(GITOPS / "argocd/applicationset.yaml")
        self.assertEqual(manifest["kind"], "ApplicationSet")
        generators = manifest["spec"]["generators"]
        actual = {entry["environment"] for gen in generators for entry in gen["list"]["elements"]}
        self.assertEqual(actual, set(ENVIRONMENTS))
        src = manifest["spec"]["template"]["spec"]["source"]
        self.assertEqual(src["repoURL"], PUBLIC_REPOSITORY)
        self.assertIn("{{environment}}", src["path"])

    def test_all_overlays_reference_real_files(self):
        base = GITOPS / "apps/devops-api"
        base_config = load(base / "base/kustomization.yaml")
        self.assertEqual(base_config["kind"], "Kustomization")
        for item in base_config["resources"]:
            self.assertTrue((base / "base" / item).is_file(), item)
        for env in ENVIRONMENTS:
            with self.subTest(env=env):
                folder = base / "overlays" / env
                manifest = load(folder / "kustomization.yaml")
                self.assertEqual(manifest["kind"], "Kustomization")
                self.assertEqual(manifest["namespace"], "devops-" + env)
                for item in manifest["resources"]:
                    self.assertTrue((folder / item).resolve().exists(), item)
                for patch in manifest.get("patches", []):
                    self.assertTrue((folder / patch["path"]).is_file(), patch)
                self.assertTrue(manifest.get("images"), "missing image configuration")
                self.assertTrue(all(i.get("newTag") not in ("latest", "", None)
                                    for i in manifest["images"]))

    def test_root_app_points_into_this_repo(self):
        root = load(GITOPS / "argocd/root-application.yaml")
        self.assertEqual(root["kind"], "Application")
        source = root["spec"]["source"]
        self.assertEqual(source["repoURL"], PUBLIC_REPOSITORY)
        self.assertTrue((ROOT / source["path"]).is_dir())


if __name__ == "__main__":
    unittest.main()
