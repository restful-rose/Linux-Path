param(
    [Parameter(
        Mandatory=$true,
        ValueFromPipeline = $true,
        ValueFromPipelineByPropertyName = $true)]
    [string]$WindowsPath
)

process {

# Normalize porential mixed slashes
    $normalized = $WindowsPath -replace '\\', '/'

# Detect drive letter using regex
    if ($normalized -match '^([A-Za-z]):/(.*)') {
        $drive = $matches[1].ToLower()
        $rest = $matches[2]
        $wslPath = "/mnt/$drive/$rest"
    }
    else {
        # No drive letter > treat as relative path
        $wslPath = $normalized
    }

    Write-Output $wslPath
}
