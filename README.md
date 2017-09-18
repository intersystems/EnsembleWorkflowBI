# EnsembleWorkflowBI
DeepSee Cube and sample dashboards for Ensemble Workflow. Tested on 2015.1 and later.

## Installation

1. Import latest release or all XMLs (except from `Locale` folder) into any Ensemble enabled namespace.
2. Compile: `Do $system.OBJ.Compile("Workflow.Cube")`
3. Build cube: `Do ##class(%DeepSee.Utils).%BuildCube("WORKFLOW")`
4. (Optional) For localization call: `Do ##class(%MessageDictionary).ImportDir(dir)` where dir is a path to `Locale` folder.

## Development

Development is done via [Cache-Tort-Git](https://github.com/intersystems-ru/cache-tort-git).

## Localization development

Execute in a terminal to regenerate basic localization:

```
Kill ^CacheMsg("WORKFLOW") 
ZWrite ^CacheMsg("WORKFLOW")
Set $mvv(58)="en"
Set dir = "C:\temp\EnsembleWorkflowBI\Locale"
Do $system.OBJ.Compile("Workflow.Cube")
Do ##class(%MessageDictionary).ExportDomainList(dir _ "WORKFLOW_en.xml","WORKFLOW", "en")
Do ##class(%MessageDictionary).ExportDomainList(dir _ "WORKFLOW_ru.xml","WORKFLOW", "ru")
Do ##class(%MessageDictionary).ImportDir(dir)
```
## Discussion
For more information on the app and further discussion please check the article [Visualizing Ensemble Workflow task execution
](https://community.intersystems.com/post/visualizing-ensemble-workflow-task-execution)
