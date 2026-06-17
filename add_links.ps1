$file = "D:\M3Webside\cn\index.html"
$encoding = [System.Text.Encoding]::UTF8
$lines = [System.IO.File]::ReadAllLines($file, $encoding)

$newCards = @(
    "            <div class=`"row`">",
    "                <div class=`"col-sm-3`">",
    "                    <div class=`"xe-widget xe-conversations box2 label-info`" onclick=`"window.open('https://156yt.cn/', '_blank')`" data-toggle=`"tooltip`" data-placement=`"bottom`" title=`"`" data-original-title=`"盐田易物流`">",
    "                        <div class=`"xe-comment-entry`">",
    "                            <a class=`"xe-user-img`">",
    "                                <img data-src=`"../assets/images/logos/ywl156.png`" class=`"lozad img-circle`" width=`"40`">",
    "                            </a>",
    "                            <div class=`"xe-comment`">",
    "                                <a href=`"#`" class=`"xe-user-name overflowClip_1`">",
    "                                    <strong>易物流</strong>",
    "                                </a>",
    "                                <p class=`"overflowClip_2`">盐田易物流</p>",
    "                            </div>",
    "                        </div>",
    "                    </div>",
    "                </div>",
    "                <div class=`"col-sm-3`">",
    "                    <div class=`"xe-widget xe-conversations box2 label-info`" onclick=`"window.open('http://www.dcblink.com/', '_blank')`" data-toggle=`"tooltip`" data-placement=`"bottom`" title=`"`" data-original-title=`"大铲湾码头`">",
    "                        <div class=`"xe-comment-entry`">",
    "                            <a class=`"xe-user-img`">",
    "                                <img data-src=`"../assets/images/logos/dcmt.png`" class=`"lozad img-circle`" width=`"40`">",
    "                            </a>",
    "                            <div class=`"xe-comment`">",
    "                                <a href=`"#`" class=`"xe-user-name overflowClip_1`">",
    "                                    <strong>大铲</strong>",
    "                                </a>",
    "                                <p class=`"overflowClip_2`">大铲湾码头</p>",
    "                            </div>",
    "                        </div>",
    "                    </div>",
    "                </div>",
    "            </div>",
    "            <br />"
)

$result = New-Object System.Collections.Generic.List[string]
$inserted = $false

for($i = 0; $i -lt $lines.Count; $i++) {
    if($lines[$i] -match "END 海关码头" -and -not $inserted) {
        foreach($line in $newCards) {
            $result.Add($line)
        }
        $inserted = $true
    }
    $result.Add($lines[$i])
}

[System.IO.File]::WriteAllLines($file, $result, $encoding)
Write-Host "Done. Inserted 2 new links."
