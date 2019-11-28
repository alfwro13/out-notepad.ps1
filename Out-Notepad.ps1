Function Out-Notepad {
 [CmdletBinding()]
    Param
      (  
        [Parameter(Mandatory=$true,
        ValueFromPipeline=$true,
        Position=0)]
        $StrText
       )
  
$fso=new-object -com scripting.filesystemobject
$filename=$fso.GetTempName()
$tempfile=Join-Path $env:temp $filename

$strText | Out-File $tempfile
notepad $tempfile
#tidy up
sleep 3
if (Test-Path $tempfile) {del $tempfile}
}
