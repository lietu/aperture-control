$junctions = @{
    "C:\\Python36" = "C:\\Python38";
    "C:\\Python37" = "C:\\Python38";
}

$junctions.Keys | ForEach-Object {
    $source = $_
    $target = $junctions.Item($source)

    if (-not (Test-Path $source)) {
        New-Item -ItemType Junction -Path $source -Target $target
    }
}
