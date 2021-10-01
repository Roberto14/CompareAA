Function CompareAA(aa1,aa2) as Boolean

    if aa1 = invalid or aa2 = invalid return false
    if aa1.Count() <> aa2.Count() return false
    
    equals = true
    i = 0
    for each prop in aa1
        if isArray(aa1) then prop = i
        
        if DoesExist(aa2,prop) then
            if type(aa1[prop]) = "roAssociativeArray" or isArray(aa1[prop])
                if type(aa1[prop]) = type(aa2[prop])
                    equals = CompareAA(aa1[prop],aa2[prop])
                else
                    equals = false
                end if
            else
                mappedeAa1PropType = mapIntrinsicType(type(aa1[prop]))
                mappedeAa2PropType = mapIntrinsicType(type(aa2[prop]))
                if mappedeAa1PropType <> mappedeAa2PropType
                    equals = false 
                else
                    if aa1[prop] <> aa2[prop] then
                        equals = false
                    end if
                end if
            end if
        else
            equals = false    
        end if
        
        'break the cicle if false is found
        if not equals then exit for
        i = i + 1
    next
    
    return equals
End Function

Function mapIntrinsicType(type as String) as String
    mapType = type
    if type = "roString"
        mapType = "String"
    else if type = "roInt"
        mapType = "Integer"
    else if type = "roFloat"
        mapType = "Float"
    else if type = "roLongInteger"
        mapType = "LongInteger"
    else if type = "roBoolean"
        mapType = "Boolean"
    end if
    return mapType
End Function

Function DoesExist(array, prop) as Boolean

    if type(array) = "roAssociativeArray" return array.DoesExist(prop)
    
    found = false
    for i = 0 to array.Count() - 1
        if i = prop then found = true : exit for
    next
    return found
End Function

Function isArray(obj) as Boolean
    if obj = invalid return false
    if GetInterface(obj, "ifArray") = invalid return false
    return true
End Function
