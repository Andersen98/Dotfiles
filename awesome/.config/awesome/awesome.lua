---@meta awesome

---@generic T
---@return T
---@package
function dummy() end

---@class awesome
awesome = {}

---@param size integer
function awesome.set_preferred_icon_size(size) end

---@param code? integer
function awesome.quit(code) end

---@return boolean
function awesome.startup() end

---@param name string
---@param func function
function awesome.connect_signal(name, func) end

---@type string
awesome.startup_errors = dummy()

return awesome
