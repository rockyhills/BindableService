--!nocheck

---------------------------------
------- DEFINE VARIABLES --------
---------------------------------

export type BindableType = string

local __DebugMode = false

local BindableService = {
	["Bindables"] = {
		
	}
}

---------------------------------
-------   FUNCTIONALITY  --------
---------------------------------


function BindableService:CreateBindableStorage(Name: string)
	BindableService["Bindables"][Name] = {}
	if __DebugMode then warn(string.format("%s%s","Created BindingStorage :: ",BindableService["Bindables"][Name])) end
end

function BindableService:AddBinds(StorageName: string, Binds: {})
	if not BindableService["Bindables"][StorageName] then if __DebugMode then warn(string.format("BindableStorage by !! %s not found",StorageName)) end return end

	for BindName,BindType in next,Binds do
		BindableService:AddBind(StorageName,BindName,BindType)
	end	
end


function BindableService:GetBindableStorage(Name: string)
	return BindableService["Bindables"][Name]
end


function BindableService:AddBind(StorageName : string, Name: string , Type : BindableType)
	if not BindableService["Bindables"][StorageName] then if __DebugMode then warn(string.format("BindableStorage by !! %s not found",StorageName)) end return end
	
	local NewBindable : Instance = Instance.new(Type or "BindableEvent")
	NewBindable.Name = Name
	
	BindableService["Bindables"][StorageName][NewBindable.Name] = NewBindable
	
	if __DebugMode then warn(NewBindable) end
end

function BindableService:ClearStorage(StorageName : string,DeleteStorage : boolean?)
	if not BindableService["Bindables"][StorageName] then if __DebugMode then warn(string.format("BindableStorage by !! %s not found",StorageName)) end return end
	
	for _,Bindable in next, BindableService["Bindables"][StorageName] do
		if typeof(Bindable) == "Instance" then
			Bindable:Destroy()
		end
	end
	
	if DeleteStorage then
		BindableService["Bindables"][StorageName] = nil
	end
end

function BindableService:RemoveBind(StorageName : string, Name: string)
	if not BindableService["Bindables"][StorageName] then if __DebugMode then warn(string.format("BindableStorage by !! %s not found",StorageName)) end return end
	
	local Bindable = BindableService["Bindables"][StorageName][Name]
	Bindable:Destroy()
	BindableService["Bindables"][StorageName][Name] = nil
	if __DebugMode then warn(string.format("Removed Bindable By !! :: %s ** Storage ** :: %s",StorageName,Name)) end
end




return BindableService
