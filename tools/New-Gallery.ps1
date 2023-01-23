Get-ChildItem images | ForEach-Object {
    if ($_.Name -match '^(\d+)-(\d+)x(\d+)\.jpg$') {
        $i = $_.Name
        $n = $matches[1]
        $w = $matches[2]
        $h = $matches[3]
        $t = @(Get-ChildItem "thumbs/$n-*.jpg")
        if ($t.Count -eq 1) {
            $t = $t[0].Name
            Write-Output "<a href='images/$i' data-pswp-width='$w' data-pswp-height='$h' data-cropped='true' target='_blank'><img src='thumbs/$t'></a>"
        } else {
            Write-Warning "Thumbnail error for: $_"
        }
    } else {
        Write-Warning "Bad image name: $_"
    }
}