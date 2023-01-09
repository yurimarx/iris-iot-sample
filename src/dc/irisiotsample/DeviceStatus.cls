Class dc.irisiotsample.DeviceStatus Extends %Persistent
{

Property deviceId As %String;

Property statusDate As %TimeStamp;

Property status As %Boolean;

Storage Default
{
<Data name="DeviceStatusDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>deviceId</Value>
</Value>
<Value name="3">
<Value>statusDate</Value>
</Value>
<Value name="4">
<Value>status</Value>
</Value>
</Data>
<DataLocation>^dc.irisiotsample.DeviceStatusD</DataLocation>
<DefaultData>DeviceStatusDefaultData</DefaultData>
<IdLocation>^dc.irisiotsample.DeviceStatusD</IdLocation>
<IndexLocation>^dc.irisiotsample.DeviceStatusI</IndexLocation>
<StreamLocation>^dc.irisiotsample.DeviceStatusS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
