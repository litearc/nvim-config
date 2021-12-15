local m = require'config'.pmap.visual_multi

-- need to manually disable these since plugin creates mappings by default
vim.g.VM_maps = {
  ['Select Operator'] = '',
  ['Undo'] = '',
  ['Redo'] = '',
  ['Find Under'] = m.find,
  ['Find Subword Under'] = '',
  ['Select Cursor Down'] = '',
  ['Select Cursor Up'] = '',
  ['Select All'] = '',
  ['Visual All'] = '',
  ['Skip Region'] = m.skip,
  ['Increase'] = '',
  ['Decrease'] = '',
}
