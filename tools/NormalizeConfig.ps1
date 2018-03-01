$ErrorActionPreference = "Stop"

function Format-Xml ($xml, $indent=2)
{ 
    $StringWriter = New-Object System.IO.StringWriter 
    $XmlWriter = New-Object System.Xml.XmlTextWriter $StringWriter 
    $xmlWriter.Formatting = "indented" 
    $xmlWriter.Indentation = $Indent 
    $xml.WriteContentTo($XmlWriter) 
    $XmlWriter.Flush() 
    $StringWriter.Flush() 
    Write-Output $StringWriter.ToString() 
}


$untidy = ([xml](Get-Content './Web.config' -Raw))

$tidy = Format-Xml $untidy

Set-Content -Path 'Web.config' $tidy