

function Git-Push { 
    git push
    if ($LASTEXITCODE -eq 128) {
        # fatal: The current branch $ has no upstream branch
        $branch = Get-GitBranch
        $remote = git remote
        Write-Host "publishing branch " -NoNewline
        Write-Host $branch -ForegroundColor Blue -NoNewline
        Write-Host " to remote " -NoNewline
        Write-Host $remote -ForegroundColor Gray
        git push --set-upstream $remote $branch
    }
}

function Get-GitBranch {
    git branch | Where-Object { $_.StartsWith('*') } | ForEach-Object { $_.Substring(2) }
}

function Git-Add {
    param (
        [Parameter(Position = 0)]
        [string[]]
        $Files = @(),

        [Parameter]
        [switch]
        $All
    )

    if ($All) {
        git add --all
    }
    else {
        git add $Files
    }
    git status
}

function Git-UndoLastCommit {
    git reset HEAD~
}

Register-ArgumentCompleter -CommandName Git-Add -ParameterName Files -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    $files = git status -s | Where-Object { $_.StartsWith(' M ') } | ForEach-Object { $_.Substring(3) }

    $files | Where-Object {
        $_.Contains($wordToComplete)
    } | ForEach-Object {
        "'$_'"
    }
}
