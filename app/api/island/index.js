defineConfig({
  meta: {
    name: 'Islands',
    description: 'Island crud description',
  },
  Entity: db.Island,
  crud: {
    exclude: ['update', 'delete', 'create'],
  },
});
