class Group < ActiveHash::Base
  self.data = [
    { id: 'Inventory', name: 'Inventory' },
    { id: 'Still Image', name: 'Still Image' },
    { id: 'Stylist', name: 'Stylist' },
    { id: 'Promotion', name: 'Promotion' },
    { id: 'Cast', name: 'Cast' },
    { id: 'A-STUDIO', name: 'A-STUDIO' },
    { id: 'C-STUDIO', name: 'C-STUDIO' }
  ]
end
