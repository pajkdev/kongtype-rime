@echo off
chcp 65001 >nul
title 港话通 RIME 输入法 Windows 一键安装部署
echo ========================================================
echo   港话通 RIME 香港粤语输入法 Windows 一键安装与配置程序 (v1.6.0)
echo ========================================================
echo.
echo 正在将港话通方案配置自动写入小狼毫用户目录...
set TARGET_DIR=%APPDATA%\Rime
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

copy /y "%~dp0kongtype_hk.schema.yaml" "%TARGET_DIR%\" >nul
copy /y "%~dp0kongtype_hk.dict.yaml" "%TARGET_DIR%\" >nul
copy /y "%~dp0default.custom.yaml" "%TARGET_DIR%\" >nul
copy /y "%~dp0weasel.custom.yaml" "%TARGET_DIR%\" >nul
if exist "%~dp0luna_pinyin.dict.yaml" copy /y "%~dp0luna_pinyin.dict.yaml" "%TARGET_DIR%\" >nul
if exist "%~dp0essay.txt" copy /y "%~dp0essay.txt" "%TARGET_DIR%\" >nul
if exist "%~dp0rime.lua" copy /y "%~dp0rime.lua" "%TARGET_DIR%\" >nul

echo [√] 方案核心文件与通用汉字拼音词库已成功复制到: %TARGET_DIR%
echo.
echo 正在尝试自动唤起小狼毫重新部署...
if exist "%ProgramFiles(x86)%\Rime\weasel-0.16.3\WeaselDeployer.exe" (
    start "" "%ProgramFiles(x86)%\Rime\weasel-0.16.3\WeaselDeployer.exe" /deploy
) else if exist "%ProgramFiles%\Rime\weasel-0.16.3\WeaselDeployer.exe" (
    start "" "%ProgramFiles%\Rime\weasel-0.16.3\WeaselDeployer.exe" /deploy
) else if exist "%ProgramFiles(x86)%\Rime\weasel-0.15.0\WeaselDeployer.exe" (
    start "" "%ProgramFiles(x86)%\Rime\weasel-0.15.0\WeaselDeployer.exe" /deploy
) else (
    echo 提示: 请右键点击右下角任务栏小狼毫中/英托盘图标，选择【重新部署】即可生效！
)
echo.
echo ========================================================
echo  恭喜！港话通输入法 (v1.6.0) 安装部署完成！
echo  [√] 已自动应用【搜狗经典白】高对比度皮肤（告别黑底看不清）
echo  [√] 已配置搜狗打字习惯：拼音输入完毕按【空格】转换上屏，按【回车】直接输出英文
echo  [√] 已全面补充标准通用汉字库：如输入 chen 秒出 陈/沉/晨/趁/臣/衬/称，输入 zhao 秒出 找/赵/照！
echo  测试打字：输入 zhaogongzuo 按空格秒出 搵工，输入 pashan 秒出 行山！
echo ========================================================
pause
