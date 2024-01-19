
set print pretty on
# 保存gdb历史命令
set history save on
# 开启log
set logging file ./.gdb.log
set logging on

set auto-load safe-path /

# macos 防卡住
# set startup-with-shell off
# 退出gdb quit
define hook-quit
  python save_bp()
end

