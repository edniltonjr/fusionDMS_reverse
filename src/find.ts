import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();


async function main() {
    console.log(`Start seeding ...`)
    const result = await prisma.t44_cliente_empresa.findMany({
        where: {
            t44_empresa_id: 271
        },
        take: 10
    })
    console.log(result)
}

main();