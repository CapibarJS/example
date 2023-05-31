import {PrismaClient} from "@prisma/client";

declare namespace global {
  // @ts-ignore
  namespace db {
    const db: PrismaClient
  }
}
