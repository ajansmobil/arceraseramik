@echo off
title AnyDesk Sure Sifirlama (999 Serial Cozumu)

:: 1. AnyDesk islemlerini sonlandir
echo AnyDesk durduruluyor...
taskkill /f /im AnyDesk.exe
timeout /t 2 /nobreak >nul

:: 2. Kayit defteri temizligi (Hem sistem hem kullanici)
echo Kayit defteri temizleniyor...
reg delete "HKEY_CURRENT_USER\Software\AnyDesk" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\AnyDesk" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\AnyDesk" /f

:: 3. sys.conf dosyasini sil (En onemli kisim burasi - 999 hatasi genelde buradan gelir)
echo sys.conf dosyasi siliniyor...
del /f /q "%ALLUSERSPROFILE%\AnyDesk\sys.conf"
del /f /q "%ProgramData%\AnyDesk\sys.conf"

:: 4. MAC adresi takibi icin (Bazen IP ve Mac ile takip ettikleri icin mac adresi degistiriliyor)
:: Not: Bu komut ağını kapatıp açar, AnyDesk yeni cihaz sanır.
echo MAC adresi sifirlaniyor (Ag baglantisi kesiliyor)...
netsh interface set interface "Ethernet" admin=disable
netsh interface set interface "Ethernet" admin=enable
netsh interface set interface "WLAN" admin=disable
netsh interface set interface "WLAN" admin=enable

echo.
echo TAMAMLANDI! Simdi AnyDesk'i acin.
pause
