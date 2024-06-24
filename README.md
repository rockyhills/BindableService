# BindableService
BindableService For Roblox

To Create a new bindablestorage you Do BindableService:CreateStorage("StorageName")
After creating a new storage you can add multiple/single binds by doing:

**Multiple**
local BindsToAdd = {
["Equipped"] = "BindableEvent"
["Unequipped"] = "BindableEvent
}
BindableService:AddBinds("StorageName",BindsToAdd)

**Single**
BindableService:AddBind("StorageName","Activated")

To Remove Binds you do:

BindableService:RemoveBind("StorageName","BindName")

To Completely Remove a storage with its items you do

BindableService:ClearStorage("StorageName",true) -- true signals "Delete Storage after clearing"
to just clear a storage you do
BindableService:ClearStorage("StorageName")
to get a bindablestorage with its list of items do you do
BindableService:GetBindableStorage("StorageName") 

