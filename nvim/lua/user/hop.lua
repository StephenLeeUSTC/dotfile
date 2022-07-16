local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end

hop.setup {
  case_insensitive = true,
  char2_fallback_key = '<CR>',
  quit_key='<Esc>',
}
