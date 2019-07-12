echo ''
echo 'This script will remove the GitHub default labels and create the standard StudioPress labels for your repo. A personal access token is required to access private repos.'

echo ''
echo -n 'GitHub Personal Access Token: '
read -s TOKEN

echo ''
echo -n 'GitHub Org/Repo (e.g. foo/bar): '
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)
REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

# Delete default labels
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/good%20first%20issue
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/question
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/wontfix

#create Status labels
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Awaiting Feedback","description":"More information needed from reporter.","color":"fef2c0"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Confirmed","description":"Bug confirmed or suggestion liked.","color":"c2e0c6"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Duplicate","description":"Has been reported or suggested before.","color":"CCCCCC"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Has PR","description":"This issue already has a PR","color":"98ff98"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Invalid","description":"The report is not valid.","color":"e6e6e6"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Investigation","description":"This bug or feature needs investigation.","color":"9a6af2"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Maybe Later","description":"May be viable in the future.","color":"ffffff"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Needs Docs","description":"Documentation needed before this can be merged.","color":"f9d0c4"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Needs Inline Docs","description":"Inline documentation needed before this can be merged.","color":"94a2cb"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Needs KB Docs","description":"Customer facing documentation.","color":"ffff00"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Needs PR","description":"Needs a pull request to be able to move this forward.","color":"e0d0d0"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Needs Refresh","description":"PR needs refreshing to avoid merge conflict.","color":"fbca04"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Needs Testing","description":"This PR needs manual testing.","color":"F66733"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Needs Tests","description":"This PR should be accompanied by automated tests.","color":"e99695"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Review Ready","description":"PR is ready to be reviewed.","color":"51ad01"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Wontfix","description":"Bug won't be fixed, or feature added.","color":"ffffff"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

#create Type labels
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type: Bug","description":"Focus is on code not working as expected.","color":"fc2929"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type: Chore","description":"General task related to this repo.","color":"a2f9d3"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type: Code Standards","description":"Focus is on fixing code standard violations.","color":"0052cc"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type: Documentation","description":"Focus is on adding or improving documentation.","color":"1d76db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type: Enhancement","description":"Focus is on adding a new feature or improvement.","color":"84b6eb"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type: External","description":"Not directly related to code in this repo.","color":"5319e7"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type: Maintenance","description":"","color":"e3f49c"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type: Question","description":"General question about how the code is meant to work.","color":"cc317c"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
