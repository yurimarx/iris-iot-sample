Class dc.irisiotsample.DeviceStatusRequest Extends Ens.Request
{

Property deviceId As %String;

Property statusDate As %TimeStamp;

Property status As %Boolean;

Storage Default
{
<Data name="DeviceStatusRequestDefaultData">
<Subscript>"DeviceStatusRequest"</Subscript>
<Value name="1">
<Value>deviceId</Value>
</Value>
<Value name="2">
<Value>statusDate</Value>
</Value>
<Value name="3">
<Value>status</Value>
</Value>
</Data>
<DefaultData>DeviceStatusRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
