Class dc.irisiotsample.DeviceStatusResponse Extends Ens.Response
{

Property deviceId As %String;

Property status As %Boolean;

Storage Default
{
<Data name="DeviceStatusResponseDefaultData">
<Subscript>"DeviceStatusResponse"</Subscript>
<Value name="1">
<Value>deviceId</Value>
</Value>
<Value name="2">
<Value>status</Value>
</Value>
</Data>
<DefaultData>DeviceStatusResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
