local M = {}

function M.compile_run()
  local filetype = vim.bo.filetype
  vim.cmd('w')
  if filetype == 'cpp' then
    vim.cmd("!g++ -std=c++11 % -o %<")
    vim.cmd("!time ./%<")
  end
end

return M
