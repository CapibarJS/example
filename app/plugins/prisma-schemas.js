definePlugin({
  setup: async (app) => {
    const models = prisma.dmmf.datamodel.models;
    const Schemas = app.schemas;

    const Types = {
      BigInt: 'int',
      Int: 'int',
      Decimal: 'float',
      Float: 'float',
      Boolean: 'boolean',
      DateTime: 'date',
      JSON: 'object',
      Bytes: 'string',
      String: 'string'
    }
    models.forEach(({name}) => {
      const schema = Object.create(Schema.prototype)
      schema.name = name;
      const proxy = new Proxy(schema, {
        get(obj, prop) {
          if (prop in obj) return obj[prop];
          if (prop === 'path') return name;
        }
      })
      Schemas.schemas.push(proxy)
      Schemas.setSchema(proxy)
    })
    for (const model of models) {
      const fields = {}
      for (const field of model.fields) {
        const type = Types?.[field.type]
        fields[field.name] = {
          ...(type && {type}),
          ...(!type && {
            schema: Schemas.schemas.find(x => x.path === field.type)
          }),
          isArray: field.isList,
          required: false,
        }
      }
      const schema = defineSchema({Schema: model.name, ...fields});
      Schemas.setSchema(schema)
    }
    Schemas.schemas.forEach(x => {
      try {
        x.toObject()
      } catch (ex) {
        console.log(x.fields.map(x=>x.options?.schema))
        throw ex
      }
    })
  }
})
