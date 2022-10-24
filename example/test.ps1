$task = Get-ScheduledTask "Test.ps1"
$items = @{}
if ($task.Actions.Execute -ne $null) {$items.Add('Execute', "$($task.Actions.Execute)")} 
$items.Add('Argument', "$($task.Actions.Arguments) -auto") 
if ($task.Actions.WorkingDirectory -ne $null) {$items.Add('WorkingDirectory',"$($task.Actions.WorkingDirectory)")} 
$action = New-ScheduledTaskAction @items
$task.Actions = $action
Set-ScheduledTask -InputObject $task

