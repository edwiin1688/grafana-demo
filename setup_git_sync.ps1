# setup_git_sync.ps1
# 依據 docs/git同步備份branch.md 建立的同步腳本

$RepoName = "grafana-demo"

# 定義要同步的所有遠端倉庫列表
# 注意：這些 URL 對應到 push list，Git 會依序推送到這些位置
$Remotes = @(
    "git@github.com:edwin45168899/$RepoName.git",                   # Backup
    "git@github.com-chiisen:chiisen/$RepoName.git",                 # Main
    "git@github.com-edwiin1688:edwiin1688/$RepoName.git",           # Main1
    "git@github.com-NathanEvans1221:NathanEvans1221/$RepoName.git"  # Main2
)

# 檢查是否在 git 專案根目錄
if (-not (Test-Path ".git")) {
    Write-Host "❌ 錯誤: 請在 Git 專案根目錄下執行此腳本。" -ForegroundColor Red
    exit 1
}

Write-Host "🔄 正在設定 Git 多重推送同步 (Repo: $RepoName)..." -ForegroundColor Cyan

# 1. 清除舊的 Push URL 設定 (險保冪等性，避免重複)
Write-Host "🧹 清除舊的 Push URL..." -ForegroundColor Gray
# 使用 git config 因為 remote set-url --delete 對於多個值操作較繁瑣
# 允許 exit code 非 0 (當原本沒有 pushurl 時 unset-all 會報錯，但不影響流程)
git config --unset-all remote.origin.pushurl 2>$null

# 2. 加入新的 Push URL
foreach ($Url in $Remotes) {
    Write-Host "➕ 加入遠端: $Url" -ForegroundColor Green
    git remote set-url --add --push origin $Url
}

Write-Host "`n✅ 設定完成！目前的 remote 設定如下：" -ForegroundColor Yellow
git remote -v
