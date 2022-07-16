local M = {}

function M.compile_run()
  local filetype = vim.bo.filetype
  vim.cmd('w')
  if filetype == 'cpp' then
    vim.cmd("!g++ -std=c++11 % -o %<")
    vim.cmd("!time ./%<")
  elseif filetype == 'c' then
    vim.cmd("!gcc % -o %<")
    vim.cmd("!time ./%<")
  elseif filetype == 'python' then
    vim.cmd("!time python3 %")
  end
end

return M
