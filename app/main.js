const {Server, Schema, defineApi} = require('@capibar/core');
const {PrismaClient, Prisma} = require("@prisma/client");
const packageJSON = require('../package.json');

BigInt.prototype.toJSON = function () {
  const int = Number.parseInt(this.toString());
  return int ?? this.toString();
};

const db = new PrismaClient();

const server = new Server({
  meta: {
    name: packageJSON.name,
    description: packageJSON.description,
    version: packageJSON.version,
  },

  Schema,
  db,
  prisma: Prisma,

  crud: {
    findMany: (entity) => defineApi({
      params: ['skip:?int', 'take:?int', 'where'],
      method: async (args) => entity.findMany(args)
    }),
    findOne: (entity) => async (args) => entity.findUnique(args),
    create: (entity) => async (args) => entity.create(args),
    update: (entity) => async (args) => entity.update(args),
    delete: (entity) => async (args) => entity.delete(args),
  },
  config: {
    static: {
      port: 5500,
    },
    network: {
      http: {
        port: 5501,
      },
      ws: {
        port: 5502,
      },
    },
  },
});

server.start().then();
