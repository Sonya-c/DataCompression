@echo off
set "dirname=%1"
set "groupid=%2"

copy /Y LaBiblia.txt %dirname%
cd %dirname%
del /F /Q g%groupid%.txt
del /F comprimido.elmejorprofesor
del /F descomprimido-elmejorprofesor.txt

python compresor.py LaBiblia.txt >> g%groupid%.txt
python descompresor.py >> g%groupid%.txt
python verificador.py LaBiblia.txt >> g%groupid%.txt

for %%A in (LaBiblia.txt) do set "sizeBiblia=%%~zA"
for %%A in (comprimido.elmejorprofesor) do set "sizeCompressed=%%~zA"
for %%A in (descomprimido-elmejorprofesor.txt) do set "sizedDecompressed=%%~zA"

echo Original size %sizeBiblia% compressed %sizeCompressed% decompressed %sizedDecompressed% >> g%groupid%.txt
set /A "diffOriginal=sizeBiblia - sizedDecompressed"
echo compression rate .... >> g%groupid%.txt
echo Sized diff between original and decompressed %diffOriginal% >> g%groupid%.txt