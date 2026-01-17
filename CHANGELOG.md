# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- **setup_git_sync.ps1**:
    - 重構腳本邏輯，使用陣列管理遠端列表，提升可維護性。
    - 新增 `git config --unset-all` 機制，確保多次執行不會產生重複設定 (Idempotency)。
    - 加入顏色輸出與狀態檢查，提升使用者體驗。
- **README.md**:
    - 優化了文件整體的語氣與結構，使其更具親和力。
    - 新增了大量襯景的情緒符號 (Emojis) 以提升閱讀體驗。
    - 為 Docker Compose 服務列表中的每個組件加入了生動的角色比喻 (如「視覺化總部」、「日誌快遞員」) 與白話功能說明，幫助初學者快速理解。
