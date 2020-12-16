-- Interpret using this command:
--    podman run -it --rm -v $(pwd):/data:Z quay.io/software-factory/shake-factory
--
-- Learn more at: https://softwarefactory-project.io/cgit/software-factory/shake-factory/tree/README.md

import Development.Shake
import ShakeFactory
import ShakeFactory.Dhall

test :: Rules ()
test = phony "test" $ do
  testCases <- getDirectoryFiles "tests" ["*"]
  mapM_ testLoad testCases
  where
    testLoad :: String -> Action String
    testLoad testCase = do
      Stdout s <- cmd "yaml-to-dhall" "(./package.dhall).Config.Type" "--file" ("tests/" <> testCase)
      pure s

main = shakeMain $ do
  want ["README.md", "package.dhall", "test"]
  "README.md" %> dhallReadmeAction
  "package.dhall" %> dhallTopLevelPackageAction "./Nodepool/package.dhall"
  "Nodepool//package.dhall" %> dhallPackageAction
  dhallDocsRules "dhall-nodepool"
  cleanRules
  test
