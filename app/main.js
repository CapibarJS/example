const {Server, Schema, defineApi} = require('@capibar/core');
const {PrismaClient, Prisma} = require("@prisma/client");

BigInt.prototype.toJSON = function () {
  const int = Number.parseInt(this.toString());
  return int ?? this.toString();
};

const db = new PrismaClient();

const server = new Server({
  Schema,
  db,
  prisma: Prisma,
  crud: {
    findMany: (entity) => defineApi({
      params: ['limit:?int'],
      method: async (args) => entity.findMany(args),
    }),
    findOne: (entity) => async (args) => entity.findUnique(args),
    create: (entity) => async (args) => entity.create(args),
    update: (entity) => async (args) => entity.update(args),
    delete: (entity) => async (args) => entity.delete(args),
  },
  config: {
    network: {
      http: {
        port: 3001,
      },
    },
  },
});

server.start().then();
