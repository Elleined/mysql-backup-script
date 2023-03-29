echo off

rem ***Date Format YYYY/MM/DD***

set year=%DATE:~10,4%
set month=%DATE:~4,2%
set day=%DATE:~7,2%
set dayName=%DATE:~0,3%

rem ***Time Format HH:MM:SS***

set hour=%TIME:~0,2%
set minute=%TIME:~3,2%
set seconds=%TIME:~6,2%

rem ***!!!DONT MODIFY CODE ABOVE THIS!!!***

rem ***Below this you can test the code above if it is correct***

echo YEAR     :  %year%
echo MONTH    :  %month%
echo DAY      :  %day%
echo DAY NAME :  %dayName%

echo HOUR     :  %hour%
echo MINUTE   :  %minute%
echo SECONDS  :  %seconds%

rem ***FINAL DATE TIME OUTPUT***
set date_time=%year%_%month%_%day%_%dayName%_AT_%hour%_%minute%_%seconds% 

echo DATETIME OUTPUT: %date_time%

rem ***For Reference visit this youtube video https://youtu.be/1GUCJKmJuAo***
pause