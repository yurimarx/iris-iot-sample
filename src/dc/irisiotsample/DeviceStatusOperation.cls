Class dc.irisiotsample.DeviceStatusOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.MQTT.Adapter.Outbound";

Parameter SETTINGS = "-SendSuperSession";

Method NotifyDeviceStatus(pRequest As dc.irisiotsample.DeviceStatusRequest, Output pResponse As dc.irisiotsample.DeviceStatusResponse) As %Status
{

    #dim tSC As %Status = $$$OK
	#dim e As %Exception.AbstractException
	
	Try {
		Set message = ##class(EnsLib.MQTT.Message).%New()
        Set message.Topic = ..Adapter.Topic
        Set jsonValue = {}
        Set jsonValue.message = "Device "_pRequest.deviceId_" has status "_pRequest.status
        Set message.StringValue = jsonValue.%ToJSON() 
        Set tSC=..Adapter.Send(message.Topic,message.StringValue)
        Set pResponse = ##class(dc.irisiotsample.DeviceStatusResponse).%New()
        Set pResponse.deviceId = pRequest.deviceId
        Set pResponse.status = pRequest.status
	} Catch e {
		Set tSC=e.AsStatus()
	}
	
	Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="dc.irisiotsample.DeviceStatusRequest">
    <Method>NotifyDeviceStatus</Method>
  </MapItem>
</MapItems>
}

}
