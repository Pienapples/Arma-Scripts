// For use with 'loadCrates.sqf' define a function to call attachTo and setVectorDirAndUp
params ["_obj","_objAttTo",["_offsetVector",[0,0,0]],["_vectorDir",[0,0,0]],["_vectorUp",[0,0,0]]]; // Define the parameters used in the function and when it's called.
    _obj attachTo [_objAttTo ,_offsetVector]; // Apply the first two values for the function
    _obj setVectorDirAndUp [_vectorDir, _vectorUp]; // Apply the last two values for the function.