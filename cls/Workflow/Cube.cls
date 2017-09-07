Include EnsUtil

/// 
Class Workflow.Cube Extends %DeepSee.CubeDefinition [ DependsOn = EnsLib.Workflow.TaskResponse ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="WORKFLOW" displayName="WORKFLOW" disabled="false" abstract="false" sourceClass="EnsLib.Workflow.TaskResponse" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0">
  <dimension name="Role" displayName="Role" disabled="false" hasAll="false" allCaption="All %RoleName" allDisplayName="%RoleName" type="data" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false">
      <level sourceProperty="%RoleName" name="Role" displayName="Role" disabled="false" list="false" useDisplayValue="true" useAsFilter="true">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Username" displayName="Username" disabled="false" hasAll="false" allCaption="All %UserName" allDisplayName="%UserName" type="data" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false">
      <level sourceProperty="%TaskStatus.AssignedTo" name="Username" displayName="Username" disabled="false" list="false" useDisplayValue="true" useAsFilter="true">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Status" displayName="Status" disabled="false" hasAll="false" allCaption="All %Status" allDisplayName="%Status" type="data" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false">
      <level sourceProperty="%Status" name="Status" displayName="Status" disabled="false" list="false" useDisplayValue="true" useAsFilter="true">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="IsComplete" displayName="IsComplete" disabled="false" hasAll="false" allCaption="All IsComplete" allDisplayName="IsComplete" type="data" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false">
      <level sourceProperty="%TaskStatus.IsComplete" name="IsComplete" displayName="IsComplete" disabled="false" list="false" useDisplayValue="true" useAsFilter="true">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="TimeCompleted" displayName="TimeCompleted" disabled="false" hasAll="false" allCaption="All TimeCompleted" allDisplayName="TimeCompleted" sourceProperty="%TaskStatus.TimeCompleted" type="time" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="TimeCompleted" displayName="TimeCompleted" disabled="false">
      <level name="YearCompleted" displayName="YearCompleted" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true">
      </level>
      <level name="MonthCompleted" displayName="MonthCompleted" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true">
      </level>
      <level name="DayCompleted" displayName="DayCompleted" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="TimeCreated" displayName="TimeCreated" disabled="false" hasAll="false" allCaption="All TimeCreated" allDisplayName="TimeCreated" sourceProperty="%TaskStatus.TimeCreated" type="time" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="TimeCreated" displayName="TimeCreated" disabled="false">
      <level name="YearCreated" displayName="YearCreated" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true">
      </level>
      <level name="MonthCreated" displayName="MonthCreated" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true">
      </level>
      <level name="DayCreated" displayName="DayCreated" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Priority" displayName="Priority" disabled="false" hasAll="false" allCaption="All %Priority" allDisplayName="%Priority" type="data" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="Priority" displayName="Priority" disabled="false">
      <level sourceProperty="%Priority" name="Priority" displayName="Priority" disabled="false" list="false" useDisplayValue="true" useAsFilter="true">
      </level>
    </hierarchy>
  </dimension>
  <measure sourceExpression="$System.SQL.DATEDIFF(&quot;minute&quot;,%source.%TaskStatus.TimeCreated,%source.%TaskStatus.TimeCompleted)" name="CompletionTime" displayName="CompletionTime" disabled="false" aggregate="AVG" type="integer" hidden="false" searchable="false"></measure>
  <listing name="Listing" displayName="Listing" disabled="false" listingType="table" fieldList="%Subject,%Message,%UserName,%TaskStatus_TimeCreated,%TaskStatus_TimeCompleted,%TaskStatus_IsComplete" sql="SELECT TaskStatus_RoleName As &quot;Role&quot;,  TaskStatus_IsComplete As IsCompleted,  %Status As &quot;Status&quot;,  TaskStatus_Source As BusinessProcess,  TaskStatus_AssignedTo As &quot;User&quot;,  %Subject As &quot;Subject&quot;,  %Message As &quot;Message&quot;,  TaskStatus_TimeCreated As &quot;TimeCreated&quot;,  TaskStatus_TimeCompleted As &quot;TimeCompleted&quot;,  DATEDIFF(&apos;minute&apos;,TaskStatus_TimeCreated,TaskStatus_TimeCompleted) As &quot;CompletionTime&quot; FROM $$$SOURCE  WHERE $$$RESTRICT"></listing>
</cube>
}

Parameter DOMAIN = "WORKFLOW";

}

