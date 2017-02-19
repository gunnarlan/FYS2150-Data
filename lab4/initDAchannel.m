function [AOch]=initDAchannel(DS,devicename,NumCh)
%Initialiser DAQ for DA-omforming
%NumCh = integer, antall kanaler
AOch=addAnalogOutputChannel(DS,devicename,0:NumCh-1,'Voltage');
