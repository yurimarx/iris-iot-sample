Class dc.irisiotsample.DeviceStatusProcess Extends Ens.BusinessProcess
{

Method OnRequest(request As dc.irisiotsample.DeviceStatusRequest, Output response As Ens.StringResponse) As %Status
{
    Set tsc = 1
    Set response = ##class(Ens.StringResponse).%New()
    
    Set DeviceStatus = ##class(dc.irisiotsample.DeviceStatus).%New()
    Set DeviceStatus.deviceId = request.deviceId
    Set DeviceStatus.status = request.status
    Set DeviceStatus.statusDate = request.statusDate
    Set tsc = DeviceStatus.%Save()

    If $$$ISOK(tsc) {
        Set tsc =..SendRequestSync("DeviceStatusOperation", request, .pResponse, -1, "Device Status Operation")
        Set response.StringValue = "Device id "_pResponse.deviceId_" has the status "_pResponse.status
    } Else {
        Set response.StringValue = "Error on save the device status"
        Set SuspendMessage = 1
    }

    quit tsc
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
