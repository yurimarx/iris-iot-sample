Class dc.irisiotsample.DeviceStatusService Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.MQTT.Adapter.Inbound";

Method OnProcessInput(pInput As EnsLib.MQTT.Message, pOutput As Ens.StringResponse) As %Status
{
   set tsc=$$$OK 
   set DeviceStatusValue = ##class(%DynamicAbstractObject).%FromJSON(pInput.StringValue)
   set DeviceStatus = ##class(dc.irisiotsample.DeviceStatusRequest).%New()
   set DeviceStatus.deviceId = DeviceStatusValue.deviceId
   set DeviceStatus.statusDate = DeviceStatusValue.statusDate
   set DeviceStatus.status = DeviceStatusValue.status
   set tsc =..SendRequestSync("DeviceStatusProcess", DeviceStatus, .Response, -1, "Device Status Process")
   set pOutput = Response
   quit tsc
}

}
