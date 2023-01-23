param([string]$name, [string]$title)
$body = Get-ChildItem "$name/images/*" | ForEach-Object {
    if ($_.Name -match '^(\d+)-(\d+)x(\d+)\.jpg$') {
        $i = $_.Name
        $n = $matches[1]
        $w = $matches[2]
        $h = $matches[3]
        $t = @(Get-ChildItem "$name/thumbs/$n-*.jpg")
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
"<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Jake Lundrigan Memorial &mdash; $title</title>
    <link rel='stylesheet' href='/photoswipe/photoswipe.css'>
    <link rel='stylesheet' href='/style.css'>
    <script type='module' src='/script.js'></script>
</head>
<body>
    <h1><a href='/'>«&nbsp;</a>$title Gallery</h1>
    <div id='gallery' class='gallery'>
$body
$((1..20|ForEach-Object {"<div class='filler'></div>"}) -join "`r`n")
    </div>
</body>
</html>
" | Out-File -Encoding utf8 "$name/index.html"