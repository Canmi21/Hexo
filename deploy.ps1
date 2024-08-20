hexo generate
cd public
if (!(Test-Path ".git")) {
    git init
}
git remote remove origin
git remote add origin "https://example.com/.git"
git pull origin main --allow-unrelated-histories
git status
git add -A
$dateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "Site updated: $dateTime"
git push -f origin main
Start-Sleep -Seconds 3
