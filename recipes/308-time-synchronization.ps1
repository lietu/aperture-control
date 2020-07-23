# Check https://www.ntppool.org/en/ for public servers in your region
$ntpServers = "0.europe.pool.ntp.org 1.europe.pool.ntp.org 2.europe.pool.ntp.org 3.europe.pool.ntp.org"

Set-Service -Name W32Time -StartupType Automatic
Set-Service -Name W32Time -Status Running -PassThru

w32tm /config /syncfromflags:manual /manualpeerlist:"$ntpServers"
w32tm /config /update
w32tm /resync
