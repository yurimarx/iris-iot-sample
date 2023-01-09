Class dc.irisiotsample.DeviceStatusProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="dc.irisiotsample.DeviceStatusProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="DeviceStatusService" Category="" ClassName="dc.irisiotsample.DeviceStatusService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ClientID">InterSystemsIRIS</Setting>
    <Setting Target="Adapter" Name="Topic">/DeviceStatusInputTopic</Setting>
    <Setting Target="Adapter" Name="Url">tcp://mosquitto:1883</Setting>
    <Setting Target="Adapter" Name="CredentialsName">mosquitto_cred</Setting>
  </Item>
  <Item Name="DeviceStatusProcess" Category="" ClassName="dc.irisiotsample.DeviceStatusProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="DeviceStatusOperation" Category="" ClassName="dc.irisiotsample.DeviceStatusOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ClientID">InterSystemsIRIS</Setting>
    <Setting Target="Adapter" Name="Topic">/DeviceStatusOutputTopic</Setting>
    <Setting Target="Adapter" Name="Url">tcp://mosquitto:1883</Setting>
    <Setting Target="Adapter" Name="CredentialsName">mosquitto_cred</Setting>
  </Item>
</Production>
}

}
