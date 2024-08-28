param (
    [switch]
    $SkipFirefoxBrowser,

    [switch]
    $SkipChromeBrowser,

    [switch]
    $SkipEdgeBrowser,

    [switch]
    $SkipPython,

    [switch]
    $SkipNodeJs,

    [switch]
    $SkipGoLang,

    [switch]
    $SkipRust,

    [switch]
    $SkipDotNet,

    [switch]
    $SkipAzureTools
)

function WingetInstall {
    param (
        [Parameter(Mandatory, Position = 0)]
        [string]
        $Id
    )

    winget install --id $Id --silent
}

# Browsers:
if (!$SkipFirefoxBrowser) { WingetInstall 'Mozilla.Firefox' }
if (!$SkipChromeBrowser) { WingetInstall 'Google.Chrome' }
if (!$SkipEdgeBrowser) { WingetInstall 'Microsoft.Edge' }

# Git tools:
WingetInstall 'Git.Git'
WingetInstall 'StephanDilly.gitui' # https://github.com/extrawurst/gitui - Blazing 💥 fast terminal-ui for git written in rust 🦀
WingetInstall 'charmbracelet.glow' # https://github.com/charmbracelet/glow - Render markdown on the CLI, with pizzazz! 💅🏻
WingetInstall 'Axosoft.GitKraken' # https://www.gitkraken.com/

# Programming languages:
WingetInstall 'Microsoft.PowerShell'
if (!$SkipPython) { WingetInstall 'Python.Python.3.13' }
if (!$SkipNodeJs) { WingetInstall 'OpenJS.NodeJS.LTS' }
if (!$SkipGoLang) { WingetInstall 'GoLang.Go' }
if (!$SkipRust) { WingetInstall 'Rustlang.Rustup' }
if (!$SkipDotNet) { WingetInstall 'Microsoft.DotNet.SDK.8' }

# Development tools:
WingetInstall 'Microsoft.VisualStudioCode'
WingetInstall 'Docker.DockerDesktop'
WingetInstall 'Kubernetes.kubectl' # https://kubernetes.io/docs/reference/kubectl/
WingetInstall 'Derailed.k9s' # https://k9scli.io/

# Azure tools:
if (!$SkipAzureTools) {
    WingetInstall 'Microsoft.AzureCLI' # https://learn.microsoft.com/en-us/cli/azure/
    WingetInstall 'Microsoft.Azd' # https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/install-azd
    WingetInstall 'Microsoft.Azure.DataCLI' # https://learn.microsoft.com/en-us/sql/azdata/install/deploy-install-azdata
    WingetInstall 'Microsoft.Bicep' # https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/
    WingetInstall 'Microsoft.Azure.Kubelogin' # https://learn.microsoft.com/en-us/azure/aks/kubelogin-authentication
    WingetInstall 'Microsoft.devtunnel' # https://learn.microsoft.com/en-us/azure/developer/dev-tunnels/get-started?tabs=windows
}

# Other tools:
WingetInstall 'Gyan.FFmpeg' # https://ffmpeg.org/
WingetInstall 'yt-dlp.yt-dlp' # https://github.com/yt-dlp/yt-dlp
WingetInstall 'VideoLAN.VLC'
